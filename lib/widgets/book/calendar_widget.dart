import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:booking_services/providers/calendar_provider.dart';
import 'package:booking_services/models/event.dart';

class CalendarWidget extends StatelessWidget {
  final CalendarProvider schedule;
  const CalendarWidget({required this.schedule, super.key});

  @override
  Widget build(BuildContext context) {
    return TableCalendar<Event>(
      locale: 'pt_BR',
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: schedule.focusedDay,
      calendarFormat: CalendarFormat.month,
      selectedDayPredicate: (day) => isSameDay(schedule.selectedDay, day),
      eventLoader: schedule.getDayEvents,
      onPageChanged: (focused) => schedule.setFocusedDay(focused),
      onDaySelected: (selected, focused) {
        if (!isSameDay(schedule.selectedDay, selected)) {
          schedule.setSelectedDay(selected);
          schedule.setFocusedDay(focused);
          schedule.updateSelectedEvents();
        }
      },
    );
  }
}
