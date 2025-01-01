import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotification {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications () async {
    await _firebaseMessaging.requestPermission();

    final fCMToken = await _firebaseMessaging.getToken();

    print('Token nya = $fCMToken');
  }

  // Future initPushNotification() async {
  //   FirebaseMessaging.instance.getInitialMessage().then((value) => null);

  //   FirebaseMessaging.onMessageOpenedApp.listen((event) => null);
  // }
}