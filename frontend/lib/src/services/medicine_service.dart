import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend/src/dto/create_medicine_dto.dart';
import '../models/medicine.dart';
import 'package:http/http.dart' as http;

final url = Uri.parse('${dotenv.env['BACKEND_URL']}/user');
var headers = {'Content-Type': 'application/json'};

class MedicineService {
  MedicineService();
  late Medicine medicine;
  final Medicine _nullMedicine = Medicine(
    id: 'null',
    name: 'null',
    comercialName: 'null',
    composition: 'null',
    requireFormula: false,
    dosage: 'null',
    usage: 'null',
    pharmaceuticalLabs: 'null',
  );

  createMedicine(CreateMedicineDto medicine) async {
    final url = Uri.parse('${dotenv.env['BACKEND_URL']}/medicament/create');
    var res = await http.post(url,
        headers: headers, body: createMedicineDtoToJson(medicine));
    if (res.statusCode == 200) {
      medicine = CreateMedicineDto.fromJson(jsonDecode(res.body));
    } else {
      this.medicine = _nullMedicine;
    }
    return medicine;
  }
}
