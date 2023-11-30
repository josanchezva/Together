// To parse this JSON data, do
//
//     final createUserDto = createUserDtoFromJson(jsonString);

import 'dart:convert';

UpdateUserDto updateUserDtoFromJson(String str) => UpdateUserDto.fromJson(json.decode(str));

String updateUserDtoToJson(UpdateUserDto data) => json.encode(data.toJson());

class UpdateUserDto {
  final String? firstName;
  final String? secondName;
  final String? surname;
  final String? contactPhone;
  final String? password;
  final String? email;

  UpdateUserDto({
    this.firstName,
    this.secondName,
    this.surname,
    this.contactPhone,
    this.password,
    this.email,
  });

  UpdateUserDto copyWith({
    String? firstName,
    String? secondName,
    String? surname,
    String? contactPhone,
    String? password,
    String? email,
  }) => 
    UpdateUserDto(
      firstName: firstName ?? this.firstName,
      secondName: secondName ?? this.secondName,
      surname: surname ?? this.surname,
      contactPhone: contactPhone ?? this.contactPhone,
      password: password ?? this.password,
      email: email ?? this.email,
    );

  factory UpdateUserDto.fromJson(Map<String, dynamic> json) => UpdateUserDto(
    firstName: json["firstName"],
    secondName: json["secondName"],
    surname: json["surname"],
    contactPhone: json["contactPhone"],
    password: json["password"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "secondName": secondName,
    "surname": surname,
    "contactPhone": contactPhone,
    "password": password,
    "email": email,
  };
}
