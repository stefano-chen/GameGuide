import 'package:flutter/material.dart';
import 'package:gameguide/services/authService.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  AuthService _auth = AuthService();
  String _email = '';
  String _password = '';
  String _error = '';

  Future _registration() async {
    FocusScope.of(context).unfocus();
    dynamic result;
    if (_email != '' && _password != '') {
      result = await _auth.registrationWithEmailAndPassword(_email, _password);
      if (result is int) {
        switch (result) {
          case 121:
            _error = 'Password isn\'t strong enough';
            break;
          case 83:
            _error = 'Email is not valid';
            break;
          case 108:
            _error = 'Email is already in use';
            break;
        }
      }else{
        Navigator.pop(context);
      }
    }else{
      _error = 'Email or Password can\'t be empty';
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
                        padding: EdgeInsets.fromLTRB(15.0, 50.0, 0.0, 0.0),
                        child: Text(
                          'Game',
                          style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    Container(
                        padding: EdgeInsets.fromLTRB(15.0, 120.0, 0.0, 0.0),
                        child: Text(
                          'Guide',
                          style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    Container(
                        padding: EdgeInsets.fromLTRB(220.0, 120.0, 0.0, 0.0),
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
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
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
                    SizedBox(height: 20.0),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'PASSWORD',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                      onChanged: (val) {
                        _password = val;
                      },
                    ),
                    SizedBox(height: 5),
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
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.greenAccent,
                        color: Colors.green,
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () async {
                            await _registration();
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 79.0),
                            child: Text(
                              'SIGN UP',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40.0),
                    Container(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Already have an account?',
                            style: TextStyle(
                              fontFamily: 'Monteserrat',
                            ),
                          ),
                          SizedBox(width: 5.0),
                          GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Monteserrat',
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
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
