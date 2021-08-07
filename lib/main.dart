import 'package:autoecole/Sign%20up.dart';
import 'package:autoecole/compte.dart';
import 'package:autoecole/forgetPassword.dart';
import 'package:autoecole/list.dart';
import 'package:autoecole/listeClient.dart';
import 'package:autoecole/login.dart';
import 'package:autoecole/meun.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => Login(),
        '/signUp': (context) => SignUp(),
        '/AppBar': (context) => Compte(),
        '/forgetpassword': (context) => ForgetPassword(),
        '/meunAuto': (context) => Meun(),
        '/list': (context) => Liste(),
        '/examen': (context) => Examen()
      },
    );
  }
}
