import 'dart:ffi';

import 'package:frontend/src/models/user.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/pages/home.dart';

getOffHome() {
  Get.off(() => const Home());
}

getHome() {
  Get.to(() => const Home());
}

isUserLoggedIn() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? userLoggedIn = prefs.getString('userLoggedIn');
  if (userLoggedIn == null) {
    return false;
  } else {
    return true;
  }
}

loadUserDataFromSharedPreferences() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final List<String>? userVars = prefs.getStringList('user');
  User user = User(id: userVars![0], email: userVars[1], name: userVars[2]);
  return user;
}

saveUserDataInSharedPreferences(User user) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('userLoggedIn', 'true');
  await prefs.setStringList('user', <String>[user.id, user.email, user.name]);
}
