import 'package:chat_app/core/Utils/colors.dart';
import 'package:chat_app/core/Utils/styles.dart';
import 'package:chat_app/core/widgets/back.dart';
import 'package:chat_app/features/Auth/presentation/view/user_info.dart';
import 'package:chat_app/features/Auth/presentation/view/widgets/Custom_btn.dart';
import 'package:chat_app/features/Auth/presentation/view/widgets/email_field.dart';
import 'package:chat_app/features/Auth/presentation/view/widgets/logo.dart';
import 'package:chat_app/features/Auth/presentation/view/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  TextEditingController controllerEmail = TextEditingController();

  TextEditingController controllerName = TextEditingController();

  TextEditingController controllerPassword = TextEditingController();

  TextEditingController controllerConfirmPassword = TextEditingController();
  bool isLoading = false;
  String userName = "";
  String email = "";
  String password = "";
  String passwordConfirm = "";
  @override
  Widget build(BuildContext context) {
    return Padding(
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
            "Let's to create an account for you",
            style: AppStyles.kStyleNameChat16.copyWith(fontSize: 14.sp),
          ),
          const Spacer(),
          EmailField(
            hint: "Enter your name",
            controller: controllerName,
            onChanged: (name) {
              userName = name;
            },
          ),
          SizedBox(
            height: 10.h,
          ),
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
          SizedBox(
            height: 10.h,
          ),
          PasswordField(
            onChanged: (confirm) {
              passwordConfirm = confirm;
            },
            text: "Confirm your password",
            controller: controllerConfirmPassword,
          ),
          const Spacer(
            flex: 2,
          ),
          InkWell(
            onTap: () async {
              if (email.isNotEmpty &&
                  userName.isNotEmpty &&
                  password.isNotEmpty &&
                  password == passwordConfirm) {
                // await BlocProvider.of<SignUpCubit>(context).signUp(
                //     email: email, password: password, userName: userName);

                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => UserInfoView(
                      email: email,
                      password: password,
                      userName: userName,
                    ),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: AppColor.kBlue,
                    content: Text(
                      "Enter your name and email and password please ...",
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
                    text: "Sign Up",
                  ),
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
