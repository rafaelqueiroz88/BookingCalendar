import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:booking_services/models/event.dart';

class CalendarProvider with ChangeNotifier {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  final Map<DateTime, List<Event>> _events = {};
  List<Event> _selectedEvents = [];

  CalendarProvider();

  CalendarFormat get calendarFormat => _calendarFormat;

  DateTime get selectedDay => _selectedDay;

  void setSelectedDay(DateTime selectedDay) {
    _selectedDay = selectedDay;
    notifyListeners();
  }

  DateTime get focusedDay => _focusedDay;

  void setFocusedDay(DateTime focusedDay) {
    _focusedDay = focusedDay;
    notifyListeners();
  }

  Map<DateTime, List<Event>> get eventList => _events;

  List<Event> get events => _events[_selectedDay] ?? [];

  List<Event> getDayEvents(DateTime day) => _events[day] ?? [];

  void addEvents(String title, bool isPaid) {
    const uuid = Uuid();
    final selectedDayEvents = getDayEvents(_selectedDay);
    selectedDayEvents.add(
      Event(
        id: uuid.v4(),
        title: title,
        isPaid: isPaid,
      ),
    );
    _events.addAll({_selectedDay: selectedDayEvents});
    notifyListeners();
  }

  List<Event> get selectedEvents => _selectedEvents;

  void updateSelectedEvents() {
    _selectedEvents = getDayEvents(_selectedDay);
    notifyListeners();
  }
}
