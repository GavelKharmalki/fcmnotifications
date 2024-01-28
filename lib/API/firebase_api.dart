import 'package:fcmnotifications/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  // create an instance of Firebase Messaging
  final _firebaseMessaging = FirebaseMessaging.instance;

  //function to initialize notifications
  Future<void> initNotifications() async {
    //request permisssion from user
    await _firebaseMessaging.requestPermission();

    //fetch the FCM token for this device
    final fcmToken = await _firebaseMessaging.getToken();

    //print the token
    print('Token: $fcmToken');

    //initialize further settings for push noti
    initPushNotifications();
  }

  //function to handle received messages
  void handleMessage(RemoteMessage? message) {
    //if message is null, do nothing
    if (message == null) return;

    //Navigate to new screen when message is received and user taps notification
    navigatorKey.currentState?.pushNamed(
      './notification_screen',
      arguments: message,
    );
  }

  //function to initialize background settings
  Future initPushNotifications() async {
    //handle notifications if the app was terminated and now opened
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    //attach event listeners fow when a notification opens the app
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
