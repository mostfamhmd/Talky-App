import 'package:chat_app/core/Utils/styles.dart';
import 'package:chat_app/features/Auth/presentation/view/widgets/Auth%20Widgets/divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OR extends StatelessWidget {
  const OR({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(),
          const CustomDivider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Text(
              "or",
              style: AppStyles.kStyleBlack14,
            ),
          ),
          const CustomDivider(),
          const Spacer(),
        ],
      ),
    );
  }
}
