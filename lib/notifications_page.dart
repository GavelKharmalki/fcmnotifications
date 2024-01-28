import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    //get the message and display it on screen
    final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
      ),
      body: Column(
        children: [
          Text(message.notification!.title.toString()),
          Text(message.notification!.body.toString()),
          Text(message.data.toString()),
        ],
      ),
    );
  }
}
