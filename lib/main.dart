import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gameguide/home/pages/settingsPage.dart';
import 'package:gameguide/services/ThemeChanger.dart';
import 'package:gameguide/services/saveManager.dart';
import 'package:gameguide/services/wrapper.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SaveManager.init();
  runApp(MyApp());
} 

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return ChangeNotifierProvider<ThemeChanger>(
      create: (cont){
        return ThemeChanger( SaveManager.readTheme() ? ThemeData.dark() : ThemeData(primaryColor: Colors.white));
      },
          child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
        theme: theme.getTheme(),
        initialRoute: 'home',
        routes: {
    'home': (context) => Wrapper(),
    'settings': (context) => SettingsPage(),
        },
        );
  }
}
