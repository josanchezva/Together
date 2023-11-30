// To parse this JSON data, do
//
//     final createUserDto = createUserDtoFromJson(jsonString);

import 'dart:convert';

CreateUserDto createUserDtoFromJson(String str) => CreateUserDto.fromJson(json.decode(str));

String createUserDtoToJson(CreateUserDto data) => json.encode(data.toJson());

class CreateUserDto {
    final String firstName;
    final String secondName;
    final String surname;
    final String contactPhone;
    final String password;
    final String email;

    CreateUserDto({
        required this.firstName,
        required this.secondName,
        required this.surname,
        required this.contactPhone,
        required this.password,
        required this.email,
    });

    CreateUserDto copyWith({
        String? firstName,
        String? secondName,
        String? surname,
        String? contactPhone,
        String? password,
        String? email,
    }) => 
        CreateUserDto(
            firstName: firstName ?? this.firstName,
            secondName: secondName ?? this.secondName,
            surname: surname ?? this.surname,
            contactPhone: contactPhone ?? this.contactPhone,
            password: password ?? this.password,
            email: email ?? this.email,
        );

    factory CreateUserDto.fromJson(Map<String, dynamic> json) => CreateUserDto(
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
