import 'package:chat_app/core/Utils/colors.dart';
import 'package:chat_app/core/Utils/icons.dart';
import 'package:chat_app/core/Utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MessageField extends StatelessWidget {
  const MessageField({
    super.key,
    required this.controller,
    required this.text,
    required this.onTap,
    this.scrollController,
  });
  final TextEditingController controller;
  final String text;
  final Function()? onTap;
  final ScrollController? scrollController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      scrollController: scrollController,
      cursorColor: AppColor.kBlackMid,
      controller: controller,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: AppStyles.kStyleBlackMid14,
        suffixIcon: InkWell(
          onTap: onTap,
          child: SvgPicture.asset(
            AppIcons.kSend,
            height: 20.h,
            width: 20.w,
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
