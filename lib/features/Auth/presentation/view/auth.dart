import 'package:chat_app/features/Auth/presentation/view/widgets/Auth%20Widgets/auth_body.dart';
import 'package:chat_app/features/Home/presentation/view/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomeView();
          } else {
            return const AuthBody();
          }
        },
      ),
    );
  }
}
