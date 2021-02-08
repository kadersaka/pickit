import 'package:flutter/material.dart';
class MyNotifications extends StatefulWidget {
  @override
  _MyNotificationsState createState() => _MyNotificationsState();
}

class _MyNotificationsState extends State<MyNotifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("My notifications"),
        ),
      ),
    );
  }
}
