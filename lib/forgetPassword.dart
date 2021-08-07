import 'package:autoecole/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  var email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          SizedBox(
            height: 50,
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(left: 50),
              child: Text(
                'Entre the username you use to log into your Account,usually your email address',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    fontStyle: FontStyle.normal),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          myInput('Email', email, Icons.email, false),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: ElevatedButton(
              child: Text('Send'),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 130, vertical: 14),
                  elevation: 10,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                    side: BorderSide(color: Colors.red),
                  ),
                  primary: Colors.lightBlue),
            ),
          ),
        ],
      ),
    );
  }
}
