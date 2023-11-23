import 'package:chat_app/core/Utils/colors.dart';
import 'package:chat_app/features/Splash/widgets/body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashBody(),
      backgroundColor: AppColor.kBlue,
    );
  }
}
