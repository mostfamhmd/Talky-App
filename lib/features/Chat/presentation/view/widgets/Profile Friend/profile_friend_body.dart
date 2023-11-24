import 'package:chat_app/core/Utils/styles.dart';
import 'package:chat_app/features/profile/presentation/view/widgets/profile_app_bar.dart';
import 'package:chat_app/features/profile/presentation/view/widgets/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileFriendBody extends StatelessWidget {
  const ProfileFriendBody(
      {super.key,
      required this.friendName,
      required this.friendImage,
      required this.friendAbout});
  final String friendName;
  final String friendImage;
  final String friendAbout;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50.h,
          ),
          const ProfileAppBar(),
          const Spacer(),
          ProfileImage(
            image: friendImage,
          ),
          SizedBox(
            height: 20.h,
          ),
          const Spacer(),
          Container(
              width: 320.w,
              height: 60.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  friendName,
                  style: AppStyles.kStyleNameChat16,
                ),
              )),
          SizedBox(
            height: 10.h,
          ),
          Container(
              width: 320.w,
              height: 60.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  friendAbout,
                  style: AppStyles.kStyleNameChat16,
                ),
              )),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
