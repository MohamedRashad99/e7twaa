import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotifications{
  
  static Future<void> pushNotifications(String title,String body)async{
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = IOSInitializationSettings(
      onDidReceiveLocalNotification: _onDidReceiveLocalNotification,);
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: _selectNotification);
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.max, priority: Priority.high, ticker: 'ticker');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.show(0, title, body, platformChannelSpecifics);
  }

  static Future _selectNotification(String payload) async {
    // navigateAndPopUntilFirstPage(context, UserTripsView());
  }

  static Future _onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    // navigateAndPopUntilFirstPage(context, UserTripsView());
  }

}