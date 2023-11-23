import 'package:chat_app/features/Auth/presentation/manager/Sign%20In/sign_in_cubit.dart';
import 'package:chat_app/features/Auth/presentation/manager/Sign%20Up/sign_up_cubit.dart';
import 'package:chat_app/features/Auth/presentation/view/widgets/Sign%20Up/sign_up_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignUpCubit(),
        ),
        BlocProvider(
          create: (context) => SignInCubit(),
        ),
      ],
      child: const Scaffold(
        body: SignUpBody(),
      ),
    );
  }
}
