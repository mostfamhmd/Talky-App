import 'package:chat_app/core/Utils/colors.dart';
import 'package:chat_app/core/Utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileField extends StatelessWidget {
  const ProfileField({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: text,
        hintStyle: AppStyles.kStyleBlackMid14,
        border: buildoutlineInputBorder(),
        enabledBorder: buildoutlineInputBorder(),
        focusedBorder: buildoutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder buildoutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(
          color: AppColor.kBlackMid,
        ));
  }
}
