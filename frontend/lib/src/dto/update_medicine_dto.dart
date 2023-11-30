// To parse this JSON data, do
//
//     final updateMedicineDto = updateMedicineDtoFromJson(jsonString);

import 'dart:convert';

UpdateMedicineDto updateMedicineDtoFromJson(String str) => UpdateMedicineDto.fromJson(json.decode(str));

String updateMedicineDtoToJson(UpdateMedicineDto data) => json.encode(data.toJson());

class UpdateMedicineDto {
  final String? name;
    final String? comercialName;
      final String? composition;
      final bool? requireFormula;
      final String? dosage;
      final String? usage;

      UpdateMedicineDto({
        this.name,
        this.comercialName,
        this.composition,
        this.requireFormula,
        this.dosage,
        this.usage,
      });

      UpdateMedicineDto copyWith({
        String? name,
        String? comercialName,
        String? composition,
        bool? requireFormula,
        String? dosage,
        String? usage,
      }) => 
        UpdateMedicineDto(
          name: name ?? this.name,
          comercialName: comercialName ?? this.comercialName,
          composition: composition ?? this.composition,
          requireFormula: requireFormula ?? this.requireFormula,
          dosage: dosage ?? this.dosage,
          usage: usage ?? this.usage,
        );

      factory UpdateMedicineDto.fromJson(Map<String, dynamic> json) => UpdateMedicineDto(
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
