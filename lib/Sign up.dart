import 'dart:convert';

import 'package:autoecole/utils.dart';
import 'package:autoecole/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'api-projet/auth_calls.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var FirstName = TextEditingController();
  var LastName = TextEditingController();
  var Age = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();

  bool isInCall = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        child: SingleChildScrollView(
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
                transform: Matrix4.translationValues(-120, -90, 0),
                child: Image.asset(
                  'assets/logoeco.png',
                  width: 90,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 170, 10),
                child: Text(
                  'Create Your Account',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              myInput(
                'FirstName',
                FirstName,
                Icons.person,
                false,
              ),
              myInput(
                'LastName',
                LastName,
                Icons.person_outline,
                false,
              ),
              myInput(
                'Email',
                email,
                Icons.email,
                false,
              ),
              myInput(
                'Age',
                Age,
                Icons.date_range,
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
                    AuthCalls.Register(
                      FirstName.text,
                      LastName.text,
                      email.text,
                      double.parse(Age.text),
                      password.text,
                    ).then(
                      (result) {
                        if (result.statusCode == 201) {
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
                    Fluttertoast.showToast(
                        msg: "User Add",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 2,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
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
                    margin: EdgeInsets.fromLTRB(105, 20, 0, 9),
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
            ],
          ),
        ),
        inAsyncCall: isInCall,
        opacity: 0.5,
        progressIndicator: CircularProgressIndicator(),
      ),
    );
  }
}
