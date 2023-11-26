import 'package:chat_app/core/Utils/styles.dart';
import 'package:chat_app/core/widgets/back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileFriendAppBar extends StatelessWidget {
  const ProfileFriendAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
