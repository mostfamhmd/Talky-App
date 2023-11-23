import 'package:chat_app/core/Utils/icons.dart';
import 'package:chat_app/core/Utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Back extends StatelessWidget {
  const Back({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: SizedBox(
          width: 70.w,
          child: Row(
            children: [
              SvgPicture.asset(AppIcons.kBack),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Back",
                style: AppStyles.kStyleBlue16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
