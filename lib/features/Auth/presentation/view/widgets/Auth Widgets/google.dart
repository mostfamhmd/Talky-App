import 'package:chat_app/core/Utils/icons.dart';
import 'package:chat_app/core/Utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Google extends StatelessWidget {
  const Google({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      height: 60.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          const Spacer(),
          SvgPicture.asset(AppIcons.kGoogle),
          const Spacer(),
          Text(
            "Sign in with Google",
            style: AppStyles.kStyleNameChat16,
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
