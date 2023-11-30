// To parse this JSON data, do
//
//     final medicine = medicineFromJson(jsonString);

import 'dart:convert';

User medicineFromJson(String str) => User.fromJson(json.decode(str));

String medicineToJson(User data) => json.encode(data.toJson());

class User {
    final String userId;
    final String firstName;
    final String secondName;
    final String surname;
    final String contactPhone;
    final String role;
    final String creationDate;
    final String email;
    final String password;

    User({
        required this.userId,
        required this.firstName,
        required this.secondName,
        required this.surname,
        required this.contactPhone,
        required this.role,
        required this.creationDate,
        required this.email,
        required this.password,
    });

    User copyWith({
        String? userId,
        String? firstName,
        String? secondName,
        String? surname,
        String? contactPhone,
        String? role,
        String? creationDate,
        String? email,
        String? password,
    }) => 
        User(
            userId: userId ?? this.userId,
            firstName: firstName ?? this.firstName,
            secondName: secondName ?? this.secondName,
            surname: surname ?? this.surname,
            contactPhone: contactPhone ?? this.contactPhone,
            role: role ?? this.role,
            creationDate: creationDate ?? this.creationDate,
            email: email ?? this.email,
            password: password ?? this.password,
        );

    factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["entity"]["userId"],
        firstName: json["entity"]["firstName"],
        secondName: json["entity"]["secondName"],
        surname: json["entity"]["surname"],
        contactPhone: json["entity"]["contactPhone"],
        role: json["entity"]["role"],
        creationDate: json["entity"]["creationDate"],
        email: json["entity"]["email"],
        password: json["entity"]["password"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "firstName": firstName,
        "secondName": secondName,
        "surname": surname,
        "contactPhone": contactPhone,
        "role": role,
        "creationDate": creationDate,
        "email": email,
        "password": password,
    };
}
