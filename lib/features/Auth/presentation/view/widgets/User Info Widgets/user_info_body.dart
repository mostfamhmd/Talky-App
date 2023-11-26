// ignore_for_file: use_build_context_synchronouslye

import 'package:chat_app/core/Utils/colors.dart';
import 'package:chat_app/features/Auth/presentation/manager/Sign%20Up/sign_up_cubit.dart';
import 'package:chat_app/features/Auth/presentation/view/widgets/email_field.dart';
import 'package:chat_app/features/Home/presentation/view/home_view.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:chat_app/core/Utils/styles.dart';
import 'package:chat_app/features/Auth/presentation/view/widgets/Custom_btn.dart';
import 'package:chat_app/features/Auth/presentation/view/widgets/User%20Info%20Widgets/user_info_app_bar.dart';
import 'package:chat_app/features/profile/presentation/view/widgets/profile_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class UserInfoBody extends StatefulWidget {
  const UserInfoBody({
    super.key,
    required this.userName,
    required this.email,
    required this.password,
  });

  final String userName;
  final String email;
  final String password;

  @override
  State<UserInfoBody> createState() => _UserInfoBodyState();
}

class _UserInfoBodyState extends State<UserInfoBody> {
  TextEditingController controllerAboutMe = TextEditingController();
  String? urlImage;
  String defultImage =
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png";
  bool isLoading = false;
  String aboutMe = "I'm Good";
  File? _photo;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpLoading) {
          setState(() {
            isLoading = true;
          });
        } else if (state is SignUpSuccess) {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const HomeView(),
            ),
          );
        } else if (state is SignUpFailed) {
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
            UserInfoAppBar(
              userName: widget.userName,
            ),
            const Spacer(),
            ProfileImage(
              image: urlImage != null && urlImage!.isNotEmpty
                  ? urlImage!
                  : defultImage,
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
              hint: "About Me",
              onChanged: (about) {
                if (about.isNotEmpty) {
                  aboutMe = about;
                  setState(() {});
                }
              },
            ),
            const Spacer(
              flex: 2,
            ),
            InkWell(
              onTap: () async {
                await BlocProvider.of<SignUpCubit>(context).signUp(
                  aboutMe: aboutMe,
                  userImage: urlImage != null ? urlImage! : defultImage,
                  userName: widget.userName,
                  email: widget.email,
                  password: widget.password,
                );
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
      } else {
        if (kDebugMode) {
          print('No image selected.');
        }
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
      if (kDebugMode) {
        print('Error occurred while uploading: $e');
      }
    }
  }
}
