// To parse this JSON data, do
//
//     final createMedicineDto = createMedicineDtoFromJson(jsonString);

import 'dart:convert';

CreateMedicineDto createMedicineDtoFromJson(String str) =>
    CreateMedicineDto.fromJson(json.decode(str));

String createMedicineDtoToJson(CreateMedicineDto data) =>
    json.encode(data.toJson());

class CreateMedicineDto {
  final String name;
  final String comercialName;
  final String composition;
  final bool requireFormula;
  final String dosage;
  final String usage;

  CreateMedicineDto({
    required this.name,
    required this.comercialName,
    required this.composition,
    required this.requireFormula,
    required this.dosage,
    required this.usage,
  });

  CreateMedicineDto copyWith({
    String? name,
    String? comercialName,
    String? composition,
    bool? requireFormula,
    String? dosage,
    String? usage,
  }) =>
      CreateMedicineDto(
        name: name ?? this.name,
        comercialName: comercialName ?? this.comercialName,
        composition: composition ?? this.composition,
        requireFormula: requireFormula ?? this.requireFormula,
        dosage: dosage ?? this.dosage,
        usage: usage ?? this.usage,
      );

  factory CreateMedicineDto.fromJson(Map<String, dynamic> json) =>
      CreateMedicineDto(
        name: json["entity"]["name"],
        comercialName: json["entity"]["comercialName"],
        composition: json["entity"]["composition"],
        requireFormula: json["entity"]["requireFormula"],
        dosage: json["entity"]["dosage"],
        usage: json["entity"]["usage"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "comercialName": comercialName,
        "composition": composition,
        "requireFormula": requireFormula,
        "dosage": dosage,
        "usage": usage,
      };
}
