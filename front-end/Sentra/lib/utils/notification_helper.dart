import 'dart:convert';
import 'dart:math';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import '../common/navigation.dart';
import '../data/models/art_and_province_model.dart';

final selectNotificationSubject = BehaviorSubject<String>();
final randomNotification = Random().nextInt(20);


class NotificationHelper {
  static NotificationHelper? _instance;
 
  NotificationHelper._internal() {
    _instance = this;
  }
 
  factory NotificationHelper() => _instance ?? NotificationHelper._internal();
 
  Future<void> initNotifications(
     FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('app_icon');
 
    var initializationSettingsIOS = const IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
 
    var initializationSettings = InitializationSettings(
       android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
 
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
       onSelectNotification: (String? payload) async {
      if (payload != null) {
        print('notification payload: $payload');
      }
      selectNotificationSubject.add(payload ?? 'empty payload');
    });
  }
 
  Future<void> showNotification(
     FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
     ArtAndProvinceModel data) async {
    var channelId = "1";
    var channelName = "channel_01";
    var channelDescription = "SENTRA"; 
 
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        channelId, channelName,
        channelDescription: channelDescription,
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
        styleInformation: const DefaultStyleInformation(true, true));
 
    var iOSPlatformChannelSpecifics = const IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
 
    var titleNotification = "<b>Sentra</b>";
    // var titleNotification = "<b>" + data.name + "</b>";
    var titleNews = "Hai we have a recommendation art for you";
 
    await flutterLocalNotificationsPlugin.show(
        0, titleNotification, titleNews, platformChannelSpecifics,
        payload: json.encode(data.toJson()));
  }
 
  void configureSelectNotificationSubject(String route) {
    selectNotificationSubject.stream.listen(
          (String payload) async {
        var data = ArtAndProvinceModel.fromJson(json.decode(payload));
        var artId = data.data[randomNotification];
        Navigation.intentWithData(route, artId);
      },
    );
  }
}