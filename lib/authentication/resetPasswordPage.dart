import 'package:flutter/material.dart';
import 'package:gameguide/services/authService.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  AuthService _auth = AuthService();
  String _email = '';
  String _error = '';

  Future _reset() async {
    FocusScope.of(context).unfocus();
    if (_email != '') {
      dynamic result = await _auth.resetPassword(_email);
      if (result is int) {
        _error = (result == 83) ? 'Email is not valid' : 'email is not found';
      } else {
        Navigator.pop(context);
      }
    } else {
      _error = 'Email can\'t be Empty';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.fromLTRB(15.0, 60.0, 0.0, 0.0),
                        child: Text(
                          'Reset',
                          style: TextStyle(
                            fontSize: 65.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    Container(
                        padding: EdgeInsets.fromLTRB(15.0, 130.0, 0.0, 0.0),
                        child: Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 65.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    Container(
                        padding: EdgeInsets.fromLTRB(300.0, 117.0, 0.0, 0.0),
                        child: Text(
                          '.',
                          style: TextStyle(
                              fontSize: 80.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        )),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 70.0, left: 20.0, right: 20.0),
                child: Column(
                  children: [
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: 'EMAIL',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                      onChanged: (val) {
                        _email = val;
                      },
                    ),
                    SizedBox(height: 10),
                    Text(
                      _error,
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    SizedBox(height: 57.0),
                    Container(
                      height: 40.0,
                      width: 220.0,
                      child: GestureDetector(
                        onTap: () async {
                          await _reset();
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.greenAccent,
                          color: Colors.green,
                          elevation: 7.0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 89.0),
                            child: Text(
                              'SEND',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
