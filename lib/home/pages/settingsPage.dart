import 'package:flutter/material.dart';
import 'package:gameguide/services/authService.dart';

class SettingsPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    AuthService _auth = AuthService();

    return Scaffold(
      body: Center(
        child:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 62.0),
          child: Row(
            children: <Widget>[
              FlatButton(
                color: Colors.green,
                onPressed: () async{
                await _auth.signOut();
                Navigator.pop(context);
              }, child: Text('Log Out')),
              SizedBox(width: 20.0),
              FlatButton(
                color: Colors.red,
                onPressed: () async{
                await _auth.deleteAccount();
                Navigator.pop(context);
              }, child: Text('Delete Account')),
            ],
          ),
        ),
      ),
    );
  }
}