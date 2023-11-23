import 'package:chat_app/core/Utils/routes.dart';
import 'package:chat_app/core/Utils/styles.dart';
import 'package:chat_app/features/Auth/presentation/view/widgets/Auth%20Widgets/google.dart';
import 'package:chat_app/features/Auth/presentation/view/widgets/Auth%20Widgets/or.dart';
import 'package:chat_app/features/Auth/presentation/view/widgets/Auth%20Widgets/phone_number.dart';
import 'package:chat_app/features/Auth/presentation/view/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AuthBody extends StatelessWidget {
  const AuthBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(
            flex: 2,
          ),
          const Logo(),
          const Spacer(
            flex: 2,
          ),
          InkWell(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kSignInGoogleView);
              },
              child: const Google()),
          const OR(),
          const PhoneNumber(),
          const Spacer(
            flex: 2,
          ),
          Text(
            "Already have an account?",
            style: AppStyles.kStyleBlack14,
          ),
          TextButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kSignUpView);
            },
            child: Text(
              "Sign up here",
              style: AppStyles.kStyleBlue14,
            ),
          ),
          const Spacer(
            flex: 2,
          )
        ],
      ),
    );
  }
}
