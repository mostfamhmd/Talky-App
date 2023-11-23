import 'package:chat_app/core/Utils/styles.dart';
import 'package:chat_app/core/widgets/back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Back(),
        const Spacer(),
        Text(
          "Profile",
          style: AppStyles.kStyleNameChat16
              .copyWith(fontWeight: FontWeight.w900, fontSize: 18.sp),
        ),
        const Spacer(
          flex: 2,
        ),
      ],
    );
  }
}
