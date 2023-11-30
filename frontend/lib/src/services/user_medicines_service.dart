import 'dart:convert';

import 'package:frontend/src/models/medicine.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserMedicinesService {
  loadUserMedicines() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var response = prefs.getStringList('userMedicines');
  if(response == null){
    return [];
  }
  List<Medicine> userMedicines = response.map((item) {
    var decodedItem = json.decode(item);
    if (decodedItem != null) {
      return Medicine.fromJson(decodedItem);
    } else {
      return null;
    }
  }).where((item) => item != null).toList().cast<Medicine>();
  return userMedicines;
}
  saveUserMedicines (List<Medicine> userMedicines) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('userMedicines', userMedicines.map((item) => json.encode(item.toJson())).toList());
  }
}