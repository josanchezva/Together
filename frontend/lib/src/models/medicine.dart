// To parse this JSON data, do
//
//     final medicine = medicineFromJson(jsonString);

import 'dart:convert';

Medicine medicineFromJson(String str) => Medicine.fromJson(json.decode(str));

String medicineToJson(Medicine data) => json.encode(data.toJson());

class Medicine {
    final String id;
    final String name;
    final String comercialName;
    final String composition;
    final bool requireFormula;
    final String dosage;
    final String usage;
    final dynamic pharmaceuticalLabs;

    Medicine({
        required this.id,
        required this.name,
        required this.comercialName,
        required this.composition,
        required this.requireFormula,
        required this.dosage,
        required this.usage,
        required this.pharmaceuticalLabs,
    });

    Medicine copyWith({
        String? id,
        String? name,
        String? comercialName,
        String? composition,
        bool? requireFormula,
        String? dosage,
        String? usage,
        dynamic pharmaceuticalLabs,
    }) => 
        Medicine(
            id: id ?? this.id,
            name: name ?? this.name,
            comercialName: comercialName ?? this.comercialName,
            composition: composition ?? this.composition,
            requireFormula: requireFormula ?? this.requireFormula,
            dosage: dosage ?? this.dosage,
            usage: usage ?? this.usage,
            pharmaceuticalLabs: pharmaceuticalLabs ?? this.pharmaceuticalLabs,
        );

    factory Medicine.fromJson(Map<String, dynamic> json) => Medicine(
        id: json["id"],
        name: json["name"],
        comercialName: json["comercialName"],
        composition: json["composition"],
        requireFormula: json["requireFormula"],
        dosage: json["dosage"],
        usage: json["usage"],
        pharmaceuticalLabs: json["pharmaceuticalLabs"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "comercialName": comercialName,
        "composition": composition,
        "requireFormula": requireFormula,
        "dosage": dosage,
        "usage": usage,
        "pharmaceuticalLabs": pharmaceuticalLabs,
    };
}
