import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationManager {
  static Future<void> init() async {
    await Firebase.initializeApp();
    await requestPermission();
    await getToken();

    //iOS啟用前台通知
    if (Platform.isIOS) {
      // Required to display a heads up notification
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }

    //從關掉狀態點開推播
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        print("從關掉狀態點開推播");
        print('on Resume(getInitial): $message');
        pushToPage(message);
      }
    });

    //App打開在前景時
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        print("-------收到前景推播--------");
        print(message.notification!.body);
        print(message.notification!.title);
      }
    });

    // 點選通知開啟
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      //AndroidNotification? android = message.notification?.android;
      if (message.notification != null) {
        // TODO: 接收推播通知訊息
      }
      pushToPage(message);
    });

    ///後台消息
    FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);
  }

  // 取得 APNs Token
  static getToken() async {
    if (Platform.isIOS) {
      String apnstoken = await FirebaseMessaging.instance.getAPNSToken() ?? "";
    }
    String fcmToken = await FirebaseMessaging.instance.getToken() ?? "";
  }

  static requestPermission() async {
    if (Platform.isIOS) {
      NotificationSettings settings =
          await FirebaseMessaging.instance.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
    }
  }
}

Future<void> backgroundMessageHandler(RemoteMessage message) async {
  // 當未開啟 APP 時執行
  await Firebase.initializeApp();
  pushToPage(message);
}

pushToPage(RemoteMessage message) {
  // TODO: 接收到訊息後判斷要跳至的頁面
  // Get.offAll(() => HomeView());
}
