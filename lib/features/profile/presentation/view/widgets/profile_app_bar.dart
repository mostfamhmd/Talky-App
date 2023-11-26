import 'package:chat_app/core/Utils/colors.dart';
import 'package:chat_app/core/Utils/styles.dart';
import 'package:chat_app/core/widgets/back.dart';
import 'package:chat_app/features/Home/presentation/manager/Log%20Out/log_out_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key, required this.isLoading});
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Back(),
        Text(
          "Profile",
          style: AppStyles.kStyleNameChat16
              .copyWith(fontWeight: FontWeight.w900, fontSize: 18.sp),
        ),
        InkWell(
          onTap: () {
            BlocProvider.of<LogOutCubit>(context).logOut(isLogOut: true);
          },
          child: isLoading == false
              ? Icon(
                  Icons.logout,
                  size: 30.sp,
                  color: AppColor.kBlue,
                )
              : const CircularProgressIndicator(
                  color: AppColor.kBlue,
                ),
        ),
      ],
    );
  }
}
