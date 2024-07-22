import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService{
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
 static onTap(NotificationResponse notificationResponse){}
 static Future init() async{
    InitializationSettings settings= const InitializationSettings(
android: AndroidInitializationSettings('@mipmap/ic_launcher'),
iOS: DarwinInitializationSettings()    );
flutterLocalNotificationsPlugin.initialize(settings,onDidReceiveNotificationResponse: onTap,
onDidReceiveBackgroundNotificationResponse:onTap);
  }



static void showBasicNotification() async{
  NotificationDetails details =NotificationDetails(android: AndroidNotificationDetails(
    'id 1',
    "basic_noti",
    importance: Importance.max,
    priority: Priority.high
  ));
await flutterLocalNotificationsPlugin.show(0, "basic_noti", "body", details,payload: "payloaddata");
}


  }