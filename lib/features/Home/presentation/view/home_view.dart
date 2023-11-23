import 'package:chat_app/features/Home/presentation/manager/Log%20Out/log_out_cubit.dart';
import 'package:chat_app/features/Home/presentation/view/widgets/home_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogOutCubit(),
      child: const Scaffold(
        body: HomeBody(),
      ),
    );
  }
}
