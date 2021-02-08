import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pickit/pages/auth/login.dart';
import 'package:pickit/utils/constants.dart';

class LoginStart extends StatefulWidget {
  @override
  _LoginStartState createState() => _LoginStartState();
}

class _LoginStartState extends State<LoginStart> {
  DateTime currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: WillPopScope(
        child: SingleChildScrollView(
          child: Container(
            width: width,
            height: height,
            color: Theme.of(context).primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   SizedBox(height: 50.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset("assets/logos/pc.png", height: 50.0,),
                        Text('PickIt',
                          style: Theme.of(context).textTheme.headline1.merge(TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                    CustomTextStyle().heightSpace,
                    Text('Vos courses et Livraisons Non-Stop',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                Container(
                  width: width - CustomTextStyle().fixPadding * 4.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getItems('assets/icons/courier.png', 'Courses', 'Récupération et livraison de vos paquets et courriers partout au Bénin'),
                      SizedBox(height: 20.0,),
                      getItems('assets/icons/food.png', 'Restaurants', 'Commandez dans votre restaurant préféré et faites vous livré'),
                      SizedBox(height: 20.0,),
                      getItems('assets/icons/grocery.png', 'Supermarchés', 'Commandez vos produits dans votre supermarché et nous vous livrons'),
                      SizedBox(height: 20.0,),
                      getItems('assets/images/movingtruck.png', 'Déménagements', 'Nous Transportons vos colis: en Tricycle, Camionette ou camion'),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    print("_________________________________________clicked");
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: Login()));
                  },
                  child: Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    padding: EdgeInsets.all(CustomTextStyle().fixPadding * 2.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Rejoignez-nous',
                          style: Theme.of(context).textTheme.headline5.merge(TextStyle(color: Colors.black)),
                        ),
                        SizedBox(height: 20.0,),
                        Container(
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '+229',
                                style: CustomTextStyle().blackSmallTextStyle,
                              ),
                              CustomTextStyle().widthSpace,
                              CustomTextStyle().widthSpace,
                              Text(
                                '96062448',
                                style: CustomTextStyle().greySmallTextStyle,
                              ),
                            ],
                          ),
                        ),
                        CustomTextStyle().heightSpace,
                        Container(
                          width: width - CustomTextStyle().fixPadding * 4.0,
                          height: 1.3,
                          color: CustomTextStyle().greyColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        onWillPop: onWillPop,
      ),
    );
  }

  getItems(String image, String title, String desc) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 70.0,
          height: 70.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: CustomTextStyle().whiteColor,
            borderRadius: BorderRadius.circular(35.0),
          ),
          child: Image.asset(
            image,
            width: 40.0,
            height: 40.0,
            fit: BoxFit.scaleDown,
          ),
        ),
        CustomTextStyle().widthSpace,
        CustomTextStyle().widthSpace,
        CustomTextStyle().widthSpace,
        Container(
          width: width - (CustomTextStyle().fixPadding * 4.0 + 70.0 + 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.black)),
              ),
              CustomTextStyle().heightSpace,
              Text(
                desc,
                style: CustomTextStyle().whiteSmallTextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press Back Once Again to Exit.',
        backgroundColor: Colors.black,
        textColor: CustomTextStyle().whiteColor,
      );
      return Future.value(false);
    }
    exit(0);
    return Future.value(true);
  }
}
