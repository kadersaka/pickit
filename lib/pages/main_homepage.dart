import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pickit/pages/order_history.dart';
import 'package:pickit/pages/wallet_account.dart';
import 'package:pickit/pages/setting_screen.dart';
import 'package:pickit/pages/homepage.dart';
import 'package:pickit/pages/my_notifications.dart';
import 'package:page_transition/page_transition.dart';

class MainHomePage extends StatefulWidget {
  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  int _currentindex = 0;
  DateTime currentBackPressTime;

  Widget callpage(int currentindex) {
    switch (_currentindex) {
      case 0:
        return HomePage();
      case 1:
        return OrderHistory();
      case 2:
        return WalletAccount();
      case 3:
        return SettingScreen();
      default:
        return HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Zéwa"),
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(Icons.notification_important, ),
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(type: PageTransitionType.rightToLeft, child: MyNotifications()));
            },
          ),
          IconButton(
            icon: Icon(Icons.settings, ),
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(type: PageTransitionType.rightToLeft, child: MyNotifications()));
            },
          ),
        ],
      ),

      body: callpage(_currentindex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
//        unselectedItemColor: Colors.green,
//        backgroundColor: Colors.white,
//        selectedLabelStyle: Theme.of(context).textTheme.bodyText1,
//        unselectedLabelStyle:  TextStyle(color: Colors.red),
        currentIndex: _currentindex,
        onTap: (value) {
          setState(() { _currentindex = value;});
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), label: 'Mes courses'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: 'Portefeuille'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Paramètres'),
        ],
      ),

    );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Appuyer à nouveau pour quitter.',
      );
      return Future.value(false);
    }
    exit(0);
    return Future.value(true);
  }

}
