// To parse this JSON data, do
//
//     final createUserDto = createUserDtoFromJson(jsonString);

import 'dart:convert';

CreateUserDto createUserDtoFromJson(String str) => CreateUserDto.fromJson(json.decode(str));

String createUserDtoToJson(CreateUserDto data) => json.encode(data.toJson());

class CreateUserDto {
    CreateUserDto({
        required this.email,
        required this.name,
        required this.password,
    });

    final String email;
    final String name;
    final String password;

    factory CreateUserDto.fromJson(Map<String, dynamic> json) => CreateUserDto(
        email: json["email"],
        name: json["username"],
        password: json["password"]
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "username": name,
        "password": password,
    };
}
