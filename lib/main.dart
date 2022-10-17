import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutteriosfcm/PushNotificationManager.dart';
import 'package:flutteriosfcm/common/routes/app_pages.dart';
import 'package:flutteriosfcm/controller_binding.dart';
import 'package:get/get.dart';

// 設定 APP 在背景程式或還沒執行時的通知
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage m) async {
  await Firebase.initializeApp();
  print("Handling a background message: ${m.messageId}");
}

void main() async {
  // 初始化 APP 設定
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await PushNotificationManager.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBindings(),
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
