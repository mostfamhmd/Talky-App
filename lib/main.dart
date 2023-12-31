import 'package:chat_app/core/Utils/colors.dart';
import 'package:chat_app/core/Utils/routes.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> notificationBackgroundHandler(RemoteMessage message) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(notificationBackgroundHandler);
  if (kDebugMode) {
    print(message.messageId);
  }
  DateTime timeNotification = DateTime.now();
  FirebaseFirestore.instance
      .collection("Notifications")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("myNotifications")
      .add({
    "Name": message.notification!.title,
    "Body": message.notification!.body,
    "TimeNotification": timeNotification,
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(notificationBackgroundHandler);
  runApp(const TalkyApp());
}

class TalkyApp extends StatefulWidget {
  const TalkyApp({super.key});

  @override
  State<TalkyApp> createState() => _TalkyAppState();
}

class _TalkyAppState extends State<TalkyApp> {
  void requestPermissionsNotifications() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (kDebugMode) {
      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        print('User granted permission');
      } else if (settings.authorizationStatus ==
          AuthorizationStatus.provisional) {
        print('User granted provisional permission');
      } else {
        print('User declined or has not accepted permission');
      }
    }
  }

  @override
  void initState() {
    requestPermissionsNotifications();
    super.initState();
  }

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
