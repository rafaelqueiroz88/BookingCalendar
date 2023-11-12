import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:table_calendar/table_calendar.dart';

class Event {
  final String document;
  final String title;
  final bool isPaid;
  const Event({
    required this.document,
    required this.title,
    required this.isPaid,
  });

  @override
  String toString() => title;
}

class Overview extends StatefulWidget {
  const Overview({super.key});

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  var uuid = const Uuid();
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  final TextEditingController _controller = TextEditingController();
  Map<DateTime, List<Event>> events = {};
  late final ValueNotifier<List<Event>> _selectedEvents;

  @override
  void initState() {
    super.initState();
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay));
  }

  List<Event> _getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(':D'),
        backgroundColor: Colors.purple,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (ctx) {
                return AlertDialog(
                    scrollable: true,
                    title: const Text('Mensagem'),
                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(controller: _controller),
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          final selectedDayEvents =
                              _getEventsForDay(_selectedDay);
                          selectedDayEvents.add(Event(
                            title: _controller.text,
                            isPaid: false,
                            document: uuid.v4(),
                          ));
                          events.addAll({_selectedDay: selectedDayEvents});
                          Navigator.of(context).pop();
                          setState(() {
                            _selectedEvents.value =
                                _getEventsForDay(_selectedDay);
                          });
                        },
                        child: const Text('OK'),
                      ),
                    ]);
              });
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          TableCalendar<Event>(
            locale: 'pt_BR',
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            eventLoader: _getEventsForDay,
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                  _selectedEvents.value = _getEventsForDay(selectedDay);
                });
              }
            },
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ValueListenableBuilder(
                valueListenable: _selectedEvents,
                builder: (ctx, value, _) {
                  return ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (ctx, index) => Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        title: Text(
                          value[index].toString(),
                        ),
                        subtitle: Text(value[index].document),
                        leading: Icon(value[index].isPaid
                            ? Icons.paid
                            : Icons.paid_outlined),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
