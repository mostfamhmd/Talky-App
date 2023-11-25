import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class MyNotification {
  void sendNotification(String token, String title, String body) async {
    try {
      await http.post(Uri.parse("https://fcm.googleapis.com/fcm/send"),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Authorization':
                'key=AAAAWjGTo8c:APA91bHyrBXpEo3HTPYwP_b5mkTTudyfSCmLv9gSBC1kM2ZNZQsmzMJz_SBYSoXz-HWxpBkmkb0I-59pHaoQXytSwX5IHf-YbD4lUCuJHyvPpxCaFNpoZu0i4Smpb0lOrZC9Elq7R8oO',
          },
          body: jsonEncode(
            <String, dynamic>{
              'priority': 'high',
              'data': <String, dynamic>{
                'click_action': 'FLUTTER_NOTIFICATION_CLICK',
                'status': 'done',
                'body': body,
                'title': title,
              },
              "notification": <String, dynamic>{
                "title": title,
                "body": body,
                "android_chanal_id": "dbfood",
              },
              "to": token,
            },
          ));
    } catch (err) {
      if (kDebugMode) {
        print("Errrrrrrrrrrrrrror : ${err.toString()}");
      }
    }
  }
}
