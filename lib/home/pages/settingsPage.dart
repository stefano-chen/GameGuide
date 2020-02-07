import 'package:flutter/material.dart';
import 'package:gameguide/services/authService.dart';
import 'package:gameguide/services/ThemeChanger.dart';
import 'package:gameguide/services/saveManager.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  AuthService _auth = AuthService();
  String url ="https://github.com/stefano-chen/GameGuide";
  String urlEmail = 'mailto:stefanochen01@gmail.com'; 

  void _showDialog(
      BuildContext context, String title, String message, Function f) {
    showDialog(
        context: context,
        builder: (cont) {
          return AlertDialog(
            title: Text(
              title,
              style: TextStyle(color: Colors.redAccent),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(message),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () async {
                        await f();
                      },
                      color: Colors.greenAccent,
                      child: Text('OK'),
                    ),
                    FlatButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Cancel'),
                    ),
                  ],
                )
              ],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    ThemeChanger _theme = Provider.of<ThemeChanger>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.email),
            title: Text('stefanochen01@gmail.com'),
            onTap: ()async{
              if(await canLaunch(urlEmail)){
                launch(urlEmail);
              }else{
                Fluttertoast.showToast(
                  msg: 'Could not open the link',
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  fontSize: 20.0,
                );
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.brightness_4),
            title: Text('Change Theme'),
            onTap: () {
              if (_theme.getBool()) {
                _theme.setTheme(ThemeData(primaryColor: Colors.white));
                SaveManager.writeTheme(false);
              } else{
                _theme.setTheme(ThemeData.dark());
                SaveManager.writeTheme(true);
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.link),
            title: Text('Source Code'),
            onTap: ()async{
              if(await canLaunch(url)){
                launch(url);
              }else{
                Fluttertoast.showToast(
                  msg: 'Could not open the link',
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  fontSize: 20.0,
                );
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text(
              'Logout',
              style: TextStyle(color: Colors.red),
            ),
            onTap: () =>
                _showDialog(context, 'LOGOUT', 'Are you Sure?', () async {
              await _auth.signOut();
              Navigator.pop(context);
              Navigator.pop(context);
            }),
          ),
          ListTile(
            leading: Icon(Icons.delete_forever),
            title: Text(
              'Delete Account',
              style: TextStyle(color: Colors.red),
            ),
            onTap: () => _showDialog(context, 'Delete Account',
                'Are you Sure? \nYou will lose all data', () async {
              await _auth.deleteAccount();
              await SaveManager.removeAllFavorites();
              Navigator.pop(context);
              Navigator.pop(context);
            }),
          ),
        ],
      ),
    );
  }
}
