import 'dart:convert';

import 'package:autoecole/utils.dart';
import 'package:autoecole/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'api-projet/auth_calls.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var email = TextEditingController();
  var password = TextEditingController();
  bool isInCall = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                height: 180,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.blue, Colors.lightBlue],
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter),
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Text(
                    "AutoEcole",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 30, 100, 10),
              child: Text(
                'Login To Your Account',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            myInput(
              'Name',
              email,
              Icons.person,
              false,
            ),
            myInput(
              'Password',
              password,
              Icons.vpn_key_rounded,
              true,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                child: Text('Sign In'),
                onPressed: () {
                  setState(() {
                    isInCall = true;
                  });
                  AuthCalls.login(
                    email.text,
                    password.text,
                  ).then(
                    (result) {
                      setState(() {
                        isInCall = false;
                      });
                      if (result.statusCode == 200) {
                        // decode lel body : ken json wal dart
                        var body = jsonDecode(result.body);
                        // 5thina token mel body
                        String token = body['token'];
                        //save l token fi shared pref
                        Utils.saveTaken(token);
                        //mchina l main page
                        Navigator.pushReplacementNamed(context, '/meunAuto');
                      } else {
                        showMyDialog(
                          context,
                          "eroor !",
                          result.body,
                          () {
                            Navigator.pop(context);
                          },
                        );
                      }
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 130, vertical: 14),
                    elevation: 10,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.red),
                    ),
                    primary: Colors.lightBlue),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: GestureDetector(
                child: Text(
                  'Forget Password',
                  style: TextStyle(
                      color: Colors.lightBlueAccent,
                      decoration: TextDecoration.underline),
                ),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/forgetpassword');
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Text(
                '-Or sign up with-',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(100, 20, 0, 9),
                  child: Image.asset(
                    'assets/facebook.png',
                    width: 50,
                    height: 50,
                  ),
                ),
                SizedBox(
                  width: 80,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 0, 9),
                  child: Image.asset(
                    'assets/google.png',
                    width: 50,
                    height: 50,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 17,
            ),
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 100),
                    child: Text("Don't have an account?")),
                GestureDetector(
                  child: new Text(
                    "Sign Up!",
                    style: new TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/signUp');
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
