import 'dart:io';
import 'package:chat_app/core/Utils/colors.dart';
import 'package:chat_app/core/Utils/styles.dart';
import 'package:chat_app/features/Auth/presentation/view/widgets/Custom_btn.dart';
import 'package:chat_app/features/Auth/presentation/view/widgets/email_field.dart';
import 'package:chat_app/features/profile/presentation/manager/Edit%20Profile/edit_profile_cubit.dart';
import 'package:chat_app/features/profile/presentation/view/widgets/profile_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import '../../../../Auth/presentation/view/widgets/User Info Widgets/user_info_app_bar.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody(
      {super.key,
      required this.myname,
      required this.myabout,
      required this.myimage});
  final String myname, myabout, myimage;
  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  TextEditingController controllerAboutMe = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  String? urlImage;

  bool isLoading = false;
  String aboutMe = "";
  String myName = "";
  File? _photo;

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state is EditProfileLoading) {
          setState(() {
            isLoading = true;
          });
        } else if (state is EditProfileSuccess) {
          Navigator.pop(context);
        } else if (state is EditProfileFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: AppColor.kBlue,
              content: Text(
                state.errorMessage,
                style: const TextStyle(color: Colors.white),
              )));
          isLoading = false;
        } else {
          setState(() {
            isLoading = false;
          });
        }
        setState(() {});
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            const UserInfoAppBar(
              userName: "",
            ),
            const Spacer(),
            ProfileImage(
              image: urlImage != null ? urlImage! : widget.myimage,
            ),
            SizedBox(
              height: 20.h,
            ),
            TextButton(
              onPressed: () => showImagePickerOption(context),
              child: Text(
                "Edit",
                style: AppStyles.kStyleBlue16,
              ),
            ),
            const Spacer(),
            EmailField(
              controller: controllerAboutMe,
              hint: widget.myname,
              onChanged: (name) {
                if (name.isNotEmpty) {
                  myName = name;
                } else {
                  myName = widget.myname;
                }
                setState(() {});
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            EmailField(
              controller: controllerName,
              hint: widget.myabout,
              onChanged: (about) {
                if (about.isNotEmpty) {
                  aboutMe = about;
                } else {
                  aboutMe = widget.myabout;
                }
                setState(() {});
              },
            ),
            const Spacer(
              flex: 2,
            ),
            InkWell(
              onTap: () async {
                await BlocProvider.of<EditProfileCubit>(context).editProfile(
                    aboutMe: aboutMe,
                    image: urlImage != null ? urlImage! : widget.myimage,
                    userName: '');
                setState(() {});
              },
              child: isLoading == true
                  ? Container(
                      width: 320.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColor.kBlue,
                      ),
                      child: const Center(
                          child: CircularProgressIndicator(
                        color: Colors.white,
                      )),
                    )
                  : const CustomButton(text: "Done"),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: AppColor.kBlueLight,
        context: context,
        builder: (builder) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 18.w),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4.5,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        uploadImage(context, ImageSource.gallery);
                        Navigator.of(context).pop();
                        setState(() {});
                      },
                      child: SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.image,
                              size: 70.sp,
                            ),
                            const Text("Gallery")
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        uploadImage(context, ImageSource.camera);
                        Navigator.of(context).pop();
                        setState(() {});
                      },
                      child: SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 70.sp,
                            ),
                            const Text("Camera")
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future uploadImage(BuildContext context, ImageSource source) async {
    final profPic = await ImagePicker().pickImage(source: source);
    setState(() {
      if (profPic != null) {
        _photo = File(profPic.path);
        uploadFile();
        setState(() {});
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadFile() async {
    if (_photo == null) return;

    final fileName = basename(_photo!.path);
    final destination = 'files/$fileName';

    try {
      final ref = FirebaseStorage.instance.ref(destination);
      String url = await ref.putFile(_photo!).snapshot.ref.getDownloadURL();
      setState(() {
        urlImage = url;
      });
    } catch (e) {
      print('Error occurred while uploading: $e');
    }
  }
}
