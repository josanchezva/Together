import 'dart:collection';
import 'dart:developer';

import 'package:frontend/src/services/calendar_service.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarController extends GetxController {
  Rx isControllerReady = false.obs;
  CalendarService calendarService = CalendarService();
  RxMap<DateTime, List<Map<String, dynamic>>> eventsList = <DateTime, List<Map<String, dynamic>>>{}.obs;
  Rx focusedDay = DateTime.now().obs;
  Rx? selectedDay = DateTime.now().obs;
  Rx calendarFormat = CalendarFormat.month.obs;
  RxMap<DateTime, List<Map<String, dynamic>>> events = <DateTime, List<Map<String, dynamic>>>{}.obs;
  
  @override
  void onInit(){
    loadEvents();
    super.onInit();
  }

  loadEvents() async {
    eventsList.assignAll(await calendarService.getCalendarEvents());
    inspect(eventsList);
    events.value = LinkedHashMap<DateTime, List<Map<String, dynamic>>>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(eventsList);
    isControllerReady.value = true;
    update();
  }
  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }
}
