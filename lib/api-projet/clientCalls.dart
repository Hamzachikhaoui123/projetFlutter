import 'dart:convert';

import 'package:autoecole/models/User.dart';
import 'package:http/http.dart' as http;

import '../utils.dart';

class ClientCalls {
  static Future<List<User>> getAllUsers() async {
    List<User> users = [];

    var token = await Utils.getToken();
    var data = await http.get(
      "http://10.0.2.2:3000/user/all",
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );

    var usersJson = jsonDecode(data.body);

    for (var user in usersJson) {
      User newUser = User(user['_id'], user['_id'], user['firstName'],
          user['lastName'], user['email'], user['age']);
      users.add(newUser);
    }

    return users;
  }

  static Future<http.Response> deletUsers(String id) async {
    var response;
    await Utils.getToken().then((token) async {
      var myHeader = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      response = await http.delete(
        'http://10.0.2.2:3000/user/delete/$id',
        headers: myHeader,
      );
    });
    return response;
  }
}
