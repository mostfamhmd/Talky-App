import 'package:chat_app/core/Utils/colors.dart';
import 'package:chat_app/features/Home/presentation/manager/Log%20Out/log_out_cubit.dart';
import 'package:chat_app/features/profile/presentation/view/profile_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar(
      {Key? key,
      this.isLoading = false,
      required this.userName,
      required this.userAbout,
      required this.userImage})
      : super(key: key);

  final bool isLoading;
  final String userName;
  final String userAbout;
  final String userImage;

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfileView(
                          myName: widget.userName,
                          myImage: widget.userImage,
                          myAbout: widget.userAbout,
                        )));
          },
          child: Container(
            height: 50.h,
            width: 50.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.network(
              widget.userImage,
              fit: BoxFit.contain,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            BlocProvider.of<LogOutCubit>(context).logOut(isLogOut: true);
          },
          child: widget.isLoading == false
              ? Icon(
                  Icons.logout,
                  size: 30.sp,
                  color: AppColor.kBlue,
                )
              : const CircularProgressIndicator(
                  color: AppColor.kBlue,
                ),
        ),
      ],
    );
  }
}
