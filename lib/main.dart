import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gameguide/home/pages/settingsPage.dart';
import 'package:gameguide/services/wrapper.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      initialRoute: 'home',
      routes: {
        'home': (context) => Wrapper(),
        'settings': (context) => SettingsPage(),
      },
      );
  }
}
