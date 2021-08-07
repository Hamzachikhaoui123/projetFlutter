import 'dart:ffi';

class User {
  final String id;
  final String image;
  final String firstName;
  final String lastName;
  final String email;
  final Double age;

  User(
      this.id, this.image, this.firstName, this.lastName, this.email, this.age);

  factory User.fromJson(Map<String, dynamic> jsonObj) {
    return User(
      jsonObj['_id'],
      jsonObj["image"],
      jsonObj['firstname'],
      jsonObj['lastname'],
      jsonObj['email'],
      jsonObj['age'],
    );
  }
}
