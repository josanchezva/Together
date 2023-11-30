import 'dart:convert';
import 'dart:developer';

import 'package:frontend/src/models/user.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
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
  User user = User(
      userId: userVars![0],
      email: userVars[1],
      firstName: userVars[2],
      surname: userVars[3],
      secondName: userVars[4],
      contactPhone: userVars[5],
      role: userVars[6],
      creationDate: userVars[7],
      password: userVars[8]);
  return user;
}

saveUserDataInSharedPreferences(User user) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('userLoggedIn', 'true');
  await prefs.setStringList('user', <String>[
    user.userId,
    user.email,
    user.firstName,
    user.surname,
    user.secondName,
    user.contactPhone,
    user.role,
    user.creationDate,
    user.password
  ]);
  Logger().i('Saved user data in shared preferences');
}

deleteUserDataFromSharedPreferences() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('userLoggedIn');
  await prefs.remove('user');
  Logger().i('Deleted user data from shared preferences');
}

deleteCalendarEventsFromSharedPreferences() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('events');
  Logger().i('Deleted calendar events from shared preferences');
}

Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
  Map<String, dynamic> newMap = {};
  map.forEach((key, value) {
    newMap[key.toString()] = map[key];
  });
  return newMap;
}

Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
  Map<DateTime, dynamic> newMap = {};
  map.forEach((key, value) {
    newMap[DateTime.parse(key)] = map[key];
  });
  return newMap;
}

deleteMedicinesFromSharedPreferences() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('userMedicines');
  Logger().i('Deleted user medicines from shared preferences');
}

saveMessagesInSharedPreferences(List<types.Message> messages) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setStringList('messages',
      messages.map((message) => json.encode(message.toJson())).toList());
  Logger().i('Saved messages in shared preferences');
  inspect(prefs.getStringList('messages'));
}

Future<List<types.Message>> loadMessagesFromSharedPreferences() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final List<String>? messages = prefs.getStringList('messages');
  if (messages == null || messages.isEmpty) {
    return [];
  } else {
    List<types.Message> messagesList = messages
        .map((message) => types.Message.fromJson(json.decode(message)))
        .toList();
    Logger().i('Loaded messages from shared preferences');
    return messagesList;
  }
}
