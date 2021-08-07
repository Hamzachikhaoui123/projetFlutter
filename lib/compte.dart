import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../utils.dart';

class Compte extends StatefulWidget {
  @override
  _CompteState createState() => _CompteState();
}

class _CompteState extends State<Compte> {
  Future<List<dynamic>> getAllUsers() async {
    var token = await Utils.getToken();
    var data = await http.get(
      "http://10.0.2.2:3000/user/all",
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );

    return jsonDecode(data.body);
  }

  String _firstName(dynamic user) {
    return user["firstname"].toString();
  }

  String _email(dynamic user) {
    return user['email'].toString();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: getAllUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print(snapshot.data);
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(_firstName(snapshot.data[index])),
                      subtitle: Text(_email(snapshot.data[index])),
                    );
                  });
            }
            return Container(
              child: Center(child: Text("Loading...")),
            );
          },
        ),
      ),
    );
  }
}
