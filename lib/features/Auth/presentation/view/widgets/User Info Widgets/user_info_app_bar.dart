import 'package:chat_app/core/Utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserInfoAppBar extends StatelessWidget {
  const UserInfoAppBar({super.key, required this.userName});
  final String userName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Text(
          userName,
          style: AppStyles.kStyleNameChat16
              .copyWith(fontWeight: FontWeight.w900, fontSize: 18.sp),
        ),
        const Spacer(),
      ],
    );
  }
}
