import 'package:chat_app/features/Auth/presentation/manager/Sign%20In/sign_in_cubit.dart';
import 'package:chat_app/features/Auth/presentation/manager/Sign%20Up/sign_up_cubit.dart';
import 'package:chat_app/features/Auth/presentation/view/widgets/Sign%20In%20Google%20Widgets/sign_in_google_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInGoogleView extends StatelessWidget {
  const SignInGoogleView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignInCubit(),
        ),
        BlocProvider(
          create: (context) => SignUpCubit(),
        ),
      ],
      child: const Scaffold(
        body: SignInGoogleBody(),
      ),
    );
  }
}
