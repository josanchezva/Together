// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';


User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({required this.email, required this.name, required this.id});

  final String id;
  final String email;
  final String name;

  factory User.fromJson(Map<String, dynamic> json) =>
      User(id: json["_id"], email: json["email"], name: json["username"]);

  Map<String, dynamic> toJson() =>
      {"_id": id, "email": email, "username": name};
}
