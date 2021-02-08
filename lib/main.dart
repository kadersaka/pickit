/*
import 'dart:io';
//import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:signalr_core/signalr_core.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/io_client.dart';


String databasePath = 'demo.db';
String tableName = 'items';
Future<Database> database;
String addedBy = '';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    main1();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> main1() async {
    final connection = HubConnectionBuilder().withUrl('https://testzupg.minfo.com/messagehub',
        HttpConnectionOptions(
            accessTokenFactory: () => Future.value('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiaG9zdDEiLCJqdGkiOiI3M2FhMjFjMS1mN2IzLTQwMTgtODFhMS1mN2JjYjRiODQzNDAiLCJleHAiOjE2MTE4MDgwNTgsImlzcyI6Im1pbmZvLmNvbSIsImF1ZCI6Im1pbmZvLmNvbSJ9.6oM4G2D0saHxTDf4sKlpO0VfdD7rOfWDFviTwAzcb9k'),
//             client: IOClient(HttpClient()..badCertificateCallback = (x, y, z) => true),
            logging: (level, message) => print(message),
//            skipNegotiation: true,
//            transport: HttpTransportType.webSockets

        )).build();

    await connection.start();
    connection.on('ReceiveDirectMessage', (message) {
      print(message.toString());
    });
    await connection.invoke('SendToUser', args: ['host1', 'Says hi!']);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text('SignalR Plugin Example App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: RaisedButton(
                    onPressed: main1, child: Text("Invoke Method")),
              )
            ],
          ),
        ),

      ),
    );
  }
}
*/


import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pickit/pages/splash_screen.dart';
import 'package:pickit/themes/custom_theme.dart';
import 'package:pickit/themes/theme.dart';
import 'package:pickit/pages/main_homepage.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations( [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(
      CustomTheme(
        initialThemeKey: ThemeKeys.LIGHT,
        child: MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.of(context),
      darkTheme: Themes.darkTheme,

      title: 'Pickit',
//      home: SplashScreen(),
      home: MainHomePage(),
    );
  }
}
