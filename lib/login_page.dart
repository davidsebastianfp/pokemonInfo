import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pokeinfo/common_widgets.dart';
import 'package:pokeinfo/constants.dart';
import 'package:pokeinfo/wrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  bool isFirstOpen;
  Login(this.isFirstOpen);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String pswd = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(8),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  validator: (val) =>
                      val.isEmpty ? "This field can't be empty" : null,
                  keyboardType: TextInputType.emailAddress,
                  decoration: textInputDecoration.copyWith(hintText: 'Email'),
                  style: contentTextStyle,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  validator: (val) =>
                      val.length < 6 ? "This fiel can't be empty" : null,
                  decoration:
                      textInputDecoration.copyWith(hintText: 'Password'),
                  style: contentTextStyle,
                  onChanged: (val) {
                    setState(() => pswd = val);
                  },
                ),
                SizedBox(height: 16.0),
                Container(
                  width: double.infinity,
                  height: 40,
                  child: RaisedButton(
                    color: secondaryColor,
                    child: Text(
                      'Sign in',
                      style: buttonTextStyle,
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        if (email == "test@test.com" && pswd == "test12345") {
                          //User logged in succesfully
                          SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                          await prefs.setBool(loggedInKey, true);
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (BuildContext context) => Wrapper(true, widget.isFirstOpen)));
                        } else {
                          showSingleButtonDialog(
                              "Error",
                              "The email or password doesn't match",
                              "Ok",
                              context);
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
