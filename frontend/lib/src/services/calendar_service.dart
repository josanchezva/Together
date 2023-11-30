import 'dart:convert';

import 'package:frontend/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalendarService {
  CalendarService();

  Future<Map<DateTime, List<Map<String, dynamic>>>> getCalendarEvents() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<DateTime, List<dynamic>> decodedMap = Map<DateTime, List<dynamic>>.from(decodeMap(json.decode(prefs.getString("events") ?? "{}")));

    Map<DateTime, List<Map<String, dynamic>>> convertedMap =
        decodedMap.map((key, value) {
      return MapEntry(
          key,
          List<Map<String, dynamic>>.from(
              value.map((e) => e as Map<String, dynamic>)));
    });

    return convertedMap;
  }
  /*return {
      DateTime.now().subtract(const Duration(days: 2)): [
        'Event A1',
        'Event B1'
      ],
      DateTime.now(): ['Event A2', 'Event B2', 'Event C1', 'Event D1'],
      DateTime.now().add(const Duration(days: 1)): [
        'Event A3',
        'Event B3',
        'Event C2',
        'Event D2'
      ],
      DateTime.now().add(const Duration(days: 3)):
          {'Event A4', 'Event A5', 'Event B4'}.toList(),
      DateTime.now().add(const Duration(days: 7)): [
        'Event A6',
        'Event B5',
        'Event C3'
      ],
    };*/
}
