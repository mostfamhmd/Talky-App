// ignore_for_file: use_build_context_synchronously

import 'package:chat_app/core/Utils/colors.dart';
import 'package:chat_app/core/Utils/routes.dart';
import 'package:chat_app/core/Utils/styles.dart';
import 'package:chat_app/core/widgets/back.dart';
import 'package:chat_app/features/Auth/presentation/manager/Sign%20In/sign_in_cubit.dart';
import 'package:chat_app/features/Auth/presentation/view/widgets/Custom_btn.dart';
import 'package:chat_app/features/Auth/presentation/view/widgets/email_field.dart';
import 'package:chat_app/features/Auth/presentation/view/widgets/logo.dart';
import 'package:chat_app/features/Auth/presentation/view/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignInGoogleBody extends StatefulWidget {
  const SignInGoogleBody({super.key});

  @override
  State<SignInGoogleBody> createState() => _SignInGoogleBodyState();
}

class _SignInGoogleBodyState extends State<SignInGoogleBody> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  bool isLoading = false;
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInLoading) {
          setState(() {
            isLoading = true;
          });
        } else if (state is SignInSuccess) {
          GoRouter.of(context).push(AppRouter.kHomeView);
        } else if (state is SignInFailed) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: AppColor.kBlue,
              content: Text(
                state.errorMessage,
                style: const TextStyle(color: Colors.white),
              )));
          isLoading = false;
        } else {
          setState(() {
            isLoading = false;
          });
        }
        setState(() {});
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            const Back(),
            const Spacer(),
            const Logo(),
            const Spacer(),
            Text(
              "Welcome back you've been missed!",
              style: AppStyles.kStyleNameChat16.copyWith(fontSize: 14.sp),
            ),
            const Spacer(),
            EmailField(
              onChanged: (gmail) {
                email = gmail;
              },
              controller: controllerEmail,
            ),
            SizedBox(
              height: 10.h,
            ),
            PasswordField(
              onChanged: (pass) {
                password = pass;
              },
              text: "Enter your password",
              controller: controllerPassword,
            ),
            const Spacer(
              flex: 2,
            ),
            InkWell(
              onTap: () async {
                if (email.isNotEmpty && password.isNotEmpty) {
                  await BlocProvider.of<SignInCubit>(context)
                      .signIn(email: email, password: password);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: AppColor.kBlue,
                      content: Text(
                        "Enter your email and password please ...",
                        style: TextStyle(color: Colors.white),
                      )));
                }
                setState(() {});
              },
              child: isLoading == true
                  ? Container(
                      width: 320.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColor.kBlue,
                      ),
                      child: const Center(
                          child: CircularProgressIndicator(
                        color: Colors.white,
                      )),
                    )
                  : const CustomButton(
                      text: "Sign in",
                    ),
            ),
            const Spacer(),
            Text(
              "Don't have an account?",
              style: AppStyles.kStyleBlack14,
            ),
            TextButton(
              onPressed: () {
                if (isLoading == false) {
                  GoRouter.of(context).push(AppRouter.kSignUpView);
                }
              },
              child: Text(
                "Sign up here",
                style: AppStyles.kStyleBlue14,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
