import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pickit/pages/auth/login_start.dart';
import 'package:pickit/utils/constants.dart';
import 'package:pickit/pages/main_homepage.dart';
class  SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 3),
        () => Navigator.push(
              context,
//          MaterialPageRoute(builder: (context) => LoginStart()),
          MaterialPageRoute(builder: (context) => MainHomePage()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(CustomTextStyle().fixPadding),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'CourierPro',
                style: CustomTextStyle().splashBigTextStyle,
              ),
              CustomTextStyle().heightSpace,
              Text(
                'on-demand delivery available 24x7',
                style: CustomTextStyle().whiteNormalTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
