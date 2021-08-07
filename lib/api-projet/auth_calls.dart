import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthCalls {
  /*static Future<http.Response> login(String email, String pass) async {
    var myBody = {"email": email, "password": pass};
    var reponse = await http.post(
        'https://api-nodejs-todolist.herokuapp.com/user/login',
        body: jsonEncode(myBody),
        headers: {'Content-Type': 'application/json'});
    return reponse;
  }
*/
  static Future<http.Response> login(String email, String pass) async {
    var myBody = {"email": email, "password": pass};
    var reponse = await http.post('http://10.0.2.2:3000/user/login',
        body: jsonEncode(myBody),
        headers: {'Content-Type': 'application/json'});
    return reponse;
  }

  /*static Future<http.Response> Register(
      String email, String pass, String name) async {
    var myBody = {"email": email, "password": pass, "name": name, "age": 98};
    var reponse = await http.post(
        'https://api-nodejs-todolist.herokuapp.com/user/register',
        body: jsonEncode(myBody),
        headers: {'Content-Type': 'application/json'});
    return reponse;
  }*/
  static Future<http.Response> Register(String firstname, String lastname,
      String email, double age, String pass) async {
    var myBody = {
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'age': age,
      'password': pass,
    };
    var reponse = await http.post('http://10.0.2.2:3000/user/register',
        body: jsonEncode(myBody),
        headers: {'Content-Type': 'application/json'});
    return reponse;
  }
}
