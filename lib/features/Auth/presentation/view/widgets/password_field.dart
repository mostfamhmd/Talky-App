import 'package:chat_app/core/Utils/colors.dart';
import 'package:chat_app/core/Utils/icons.dart';
import 'package:chat_app/core/Utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PasswordField extends StatelessWidget {
  const PasswordField(
      {super.key,
      required this.controller,
      required this.text,
      this.onChanged});
  final TextEditingController controller;
  final String text;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColor.kBlackMid,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: AppStyles.kStyleBlackMid14,
        suffixIcon: SvgPicture.asset(
          AppIcons.kEye,
          height: 20.h,
          width: 20.w,
          fit: BoxFit.none,
        ),
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
