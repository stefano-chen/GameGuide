import 'package:flutter/material.dart';
import 'package:gameguide/authentication/loginPage.dart';
import 'package:gameguide/home/home.dart';
import 'package:gameguide/services/authService.dart';

class Wrapper extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _auth.user,
      builder: (context,user){
        return (user.data != null) ? Home() : LoginPage();
      }
    );
  }
}