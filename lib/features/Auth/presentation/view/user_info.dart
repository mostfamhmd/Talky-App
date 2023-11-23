import 'package:chat_app/features/Auth/presentation/manager/About%20Me/about_me_cubit.dart';
import 'package:chat_app/features/Auth/presentation/manager/Sign%20Up/sign_up_cubit.dart';
import 'package:chat_app/features/Auth/presentation/view/widgets/User%20Info%20Widgets/user_info_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInfoView extends StatelessWidget {
  const UserInfoView({
    super.key,
    required this.userName,
    required this.email,
    required this.password,
  });
  final String userName;
  final String email;
  final String password;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AboutMeCubit(),
        ),
        BlocProvider(
          create: (context) => SignUpCubit(),
        ),
      ],
      child: Scaffold(
        body: UserInfoBody(
          email: email,
          password: password,
          userName: userName,
        ),
      ),
    );
  }
}
