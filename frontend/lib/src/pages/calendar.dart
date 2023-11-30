import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../utils.dart';
import '../controllers/calendar_controller.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final CalendarController calendarController = Get.put(CalendarController());
  final TextEditingController _eventController = TextEditingController();
  SharedPreferences? prefs;

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  @override
  Widget build(BuildContext context) {
    List getEventForDay(DateTime day) {
      return calendarController.events[day] ?? [];
    }

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: _showAddDialog,
          child: const Icon(Icons.add),
        ),
        body: Column(
          children: [
            Obx(() {
              if (!calendarController.isControllerReady.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return TableCalendar(
                  daysOfWeekHeight: 50,
                  daysOfWeekStyle: DaysOfWeekStyle(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      border: Border.all(width: 0),
                    ),
                    weekendStyle: const TextStyle(color: Colors.white),
                    weekdayStyle: const TextStyle(color: Colors.white),
                  ),
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  headerStyle: HeaderStyle(
                    leftChevronIcon: const Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                    ),
                    rightChevronIcon: const Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    ),
                    headerPadding: const EdgeInsets.symmetric(vertical: 30),
                    titleTextFormatter: (date, locale) =>
                        DateFormat.MMMM(locale).format(date),
                    titleTextStyle:
                        const TextStyle(color: Colors.white, fontSize: 46),
                    formatButtonDecoration: const BoxDecoration(
                      border: Border.fromBorderSide(
                        BorderSide(color: Colors.white),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    formatButtonTextStyle: const TextStyle(color: Colors.white),
                    titleCentered: true,
                    formatButtonVisible: false,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      border: Border.all(width: 0),
                    ),
                  ),
                  focusedDay: calendarController.focusedDay.value,
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 12, 31),
                  selectedDayPredicate: (day) {
                    return isSameDay(
                        calendarController.selectedDay!.value, day);
                  },
                  onDaySelected: onDaySelected,
                  onFormatChanged: onFormatChanged,
                  onPageChanged: onPageChanged,
                  eventLoader: getEventForDay,
                  calendarFormat: calendarController.calendarFormat.value,
                );
              }
            }),
            Obx(() => ListView(
                  shrinkWrap: true,
                  children:
                      getEventForDay(calendarController.selectedDay?.value)
                          .map(
                            (event) => ListTile(
                              leading: const Icon(Icons.event,
                                  color: Colors.green, size: 30),
                              title: Text(
                                event['name'],
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Additional attribute: ${event['additionalAttribute']}',
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                  // Add more attributes here
                                ],
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      event['completed']
                                          ? Icons.check_box
                                          : Icons.check_box_outline_blank,
                                      color: event['completed']
                                          ? Colors.green
                                          : Colors.grey,
                                    ),
                                    onPressed: () async {
                                      event['completed'] = !event['completed'];
                                      await saveEventsInSharedPreferences();
                                      setState(() {});
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.green),
                                    onPressed: () {
                                      setState(() {
                                        calendarController.events[
                                                calendarController
                                                    .selectedDay!.value]!
                                            .remove(event);
                                      });
                                    },
                                  ),
                                ],
                              ),
                              isThreeLine: true,
                            ),
                          )
                          .toList(),
                ))
          ],
        ),
      ),
    );
  }

  void onPageChanged(focusedDay) {
    calendarController.focusedDay.value = focusedDay;
  }

  void onFormatChanged(format) {
    calendarController.calendarFormat.value = format;
  }

  void onDaySelected(selectedDay, focusedDay) {
    if (!isSameDay(calendarController.selectedDay!.value, selectedDay)) {
      calendarController.selectedDay!.value = selectedDay;
      calendarController.focusedDay.value = focusedDay;
    }
  }

  _showAddDialog() async {
    await showDialog(
        context: context,
        builder: (context) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: AlertDialog(
                backgroundColor: Colors.white70,
                title: const Text("Add Events"),
                content: TextField(
                  controller: _eventController,
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text(
                      "Save",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () async {
                      if (_eventController.text.isEmpty) return;
                      setState(() {
                        if (calendarController.events[
                                calendarController.selectedDay!.value] !=
                            null) {
                          calendarController
                              .events[calendarController.selectedDay!.value]!
                              .add({
                            'name': _eventController.text,
                            'completed': false,
                          });
                        } else {
                          calendarController
                              .events[calendarController.selectedDay!.value] = [
                            {
                              'name': _eventController.text,
                              'completed': false,
                              // Add more attributes here
                            }
                          ];
                        }
                        _eventController.clear();
                      });
                      await saveEventsInSharedPreferences();
                    },
                  )
                ],
              ),
            ));
  }

  saveEventsInSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonEvents = json.encode(encodeMap(calendarController.events));
    await prefs.setString('events', jsonEvents);
  }

  AppBar appBar() {
    return AppBar(
      toolbarHeight: 100,
      elevation: 0,
      backgroundColor: Colors.green,
      centerTitle: true,
      title: Text(
        DateFormat('MMMM').format(DateTime.now()),
        style: const TextStyle(color: Colors.white, fontSize: 46),
      ),
    );
  }
}
