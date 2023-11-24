import 'package:chat_app/core/Utils/colors.dart';
import 'package:chat_app/core/Utils/icons.dart';
import 'package:chat_app/core/Utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PasswordField extends StatefulWidget {
  const PasswordField(
      {super.key,
      required this.controller,
      required this.text,
      this.onChanged});
  final TextEditingController controller;
  final String text;
  final void Function(String)? onChanged;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isHide = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColor.kBlackMid,
      controller: widget.controller,
      onChanged: widget.onChanged,
      obscureText: !isHide,
      decoration: InputDecoration(
        hintText: widget.text,
        hintStyle: AppStyles.kStyleBlackMid14,
        suffixIcon: InkWell(
          onTap: () {
            if (isHide == false) {
              isHide = true;
            } else {
              isHide = false;
            }
            setState(() {});
          },
          child: SvgPicture.asset(
            AppIcons.kEye,
            height: 20.h,
            width: 20.w,
            colorFilter: ColorFilter.mode(
                isHide == true ? AppColor.kBlue : AppColor.kBlackMid,
                BlendMode.srcIn),
            fit: BoxFit.none,
          ),
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
