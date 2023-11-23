// ignore_for_file: must_be_immutable

import 'package:chat_app/core/Utils/colors.dart';
import 'package:chat_app/core/Utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailField extends StatelessWidget {
  const EmailField(
      {super.key,
      required this.controller,
      this.onChanged,
      this.hint = "Enter your gmail address"});
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      cursorColor: AppColor.kBlackMid,
      decoration: InputDecoration(
        hintText: hint,
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
