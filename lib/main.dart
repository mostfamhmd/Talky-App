import 'package:chat_app/core/Utils/colors.dart';
import 'package:chat_app/core/Utils/routes.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const TalkyApp());
}

class TalkyApp extends StatelessWidget {
  const TalkyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      designSize: const Size(375, 812),
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          //fontFamily: AppFonts.kFont,
          colorScheme: const ColorScheme.light(),
          scaffoldBackgroundColor: AppColor.kGray,
        ),
      ),
    );
  }
}
