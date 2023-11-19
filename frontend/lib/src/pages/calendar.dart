import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../controllers/calendar_controller.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final CalendarController _calendarController = Get.put(CalendarController());
  DateTime? _selectedDay;

  DateTime _focusedDay = DateTime.now();

  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TableCalendar(
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
              focusedDay: DateTime.now(),
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 12, 31),
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: onDaySelected,
              onFormatChanged: onFormatChanged,
              onPageChanged: onPageChanged,
              calendarFormat: _calendarFormat,
            ),
          ],
        ),
      ),
    );
  }

  void onPageChanged(focusedDay) {
    _focusedDay = focusedDay;
  }

  void onFormatChanged(format) {
    setState(() {
      _calendarFormat = format;
    });
  }

  void onDaySelected(selectedDay, focusedDay) {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
  }

  AppBar appBar() {
    return AppBar(
      toolbarHeight: 100,
      elevation: 0,
      backgroundColor: Colors.green,
      centerTitle: true,
      title: Text(
        DateFormat('MMMM').format(DateTime.now()),
        style: TextStyle(color: Colors.white, fontSize: 46),
      ),
    );
  }
}
