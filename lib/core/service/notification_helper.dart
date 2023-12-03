import 'dart:convert';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_treezy/gen/assets.gen.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_treezy/ui.dart';
import 'package:injectable/injectable.dart';

import '../../data/repository/repository.dart';

typedef PayloadCallback = Function(Map<String, dynamic> data);

class NotificationHelper {
  final UserRepository? userRepo;
  final PayloadCallback onInitMessage;
  final PayloadCallback onBackgroundMessage;
  final PayloadCallback onLocalNotificationMessage;
  final PayloadCallback onForeGroundMessage;

  NotificationHelper(
      {required this.userRepo,
      required this.onInitMessage,
      required this.onBackgroundMessage,
      required this.onLocalNotificationMessage,
      required this.onForeGroundMessage});

  void init() async {
    await _initLocalNotificationListener(
        onForeGroundMessage: onLocalNotificationMessage);

    if (Platform.isIOS) {
      await _setupIosNotification();
    }

    //when app killed
    await FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        onInitMessage.call(message.data);
        _showLocalNotification(message);
      }
    });

    //when app on background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      onBackgroundMessage.call(message.data);
      try {
        onSelectNotification(json.encode(message.data));
      } catch (e) {
        rethrow;
      }
      //_showLocalNotification(message);
    });

    //when app on foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      final notification = message.notification;
      print('notification -- ${message.notification?.body}');
      try {
        _handlePayload(json.encode(message.data));
      } catch (e) {
        rethrow;
      }
      onForeGroundMessage.call(message.data);
      //final isAndroid = message.notification?.android;
      if (Platform.isAndroid) {
        if (notification != null) {
          _showLocalNotification(message);
        }
      }
    });
  }

  Future<void> unRegister() async {
    return await FirebaseMessaging.instance.deleteToken();
  }

  Future<void> _initLocalNotificationListener(
      {required Function(Map<String, dynamic> data)
          onForeGroundMessage}) async {
    var initializationSettingsAndroid =
        AndroidInitializationSettings(Assets.png.icBrandOutlined.path);
    var initializationSettingsIOs = DarwinInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    var initSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOs);

    await FlutterLocalNotificationsPlugin().initialize(initSettings,
        onDidReceiveNotificationResponse: (response) async {
      onSelectNotification(response.payload);
      //onForeGroundMessage(json.decode(payload!));
      return;
    });
  }

  void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {
    // display a dialog with the notification details, tap ok to go to another page
    if (body != null) {
      _showLocalNotification(RemoteMessage(data: jsonDecode(body)));
    }
  }

  void onSelectNotification(String? payload) {
    if (payload != null) {
      Map<String, dynamic> body = json.decode(payload);
      Map<String, dynamic> data = json.decode(body['data']);
      print('body -- $body');
    }
  }

  void _handlePayload(String? payload) {
    if (payload != null) {
      Map<String, dynamic> body = json.decode(payload);

      ///do sth with payload
    }
  }

  void _showLocalNotification(RemoteMessage message) async {
    String? payload;
    payload = json.encode(message.data);
    print('_showLocalNotification -- $payload');
    await FlutterLocalNotificationsPlugin()
        .show(
            message.notification?.hashCode ?? 0,
            'App name',
            Platform.isAndroid
                ? message.notification?.title
                : message.notification?.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                '1',
                'App notification',
                channelDescription: 'General notification',
                icon: Assets.png.icBrandOutlined.path,
              ),
            ),
            payload: payload)
        .then((value) {})
        .catchError((e) {
      print('messaging error -- $e');
    });
  }

  Future<void> _setupIosNotification() async {
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  Future<void> subscribeToTopic(String topic) async {
    await FirebaseMessaging.instance.subscribeToTopic(topic);
  }

  Future<String?> get token async =>
      await FirebaseMessaging.instance.getToken();
}
