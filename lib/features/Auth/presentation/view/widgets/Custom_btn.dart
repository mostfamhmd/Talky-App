import 'package:chat_app/core/Utils/colors.dart';
import 'package:chat_app/core/Utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      height: 60.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColor.kBlue,
      ),
      child: Center(
        child: Text(
          text,
          style: AppStyles.kStyleNameChat16
              .copyWith(fontSize: 18.sp, color: Colors.white),
        ),
      ),
    );
  }
}
