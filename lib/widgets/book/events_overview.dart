import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:booking_services/widgets/book/event.dart';
import 'package:booking_services/providers/calendar_provider.dart';

class EventsOverview extends StatefulWidget {
  const EventsOverview({super.key});

  @override
  State<EventsOverview> createState() => _EventsOverviewState();
}

class _EventsOverviewState extends State<EventsOverview> {
  bool isInitialized = false;
  late final CalendarProvider schedule;

  @override
  void didChangeDependencies() {
    if (!isInitialized) {
      schedule = Provider.of<CalendarProvider>(context);
    }

    isInitialized = true;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: schedule.events.length,
        itemBuilder: (ctx, index) => Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 4,
          ),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Event(
            id: schedule.events[index].id,
            title: schedule.events[index].title,
            isPaid: schedule.events[index].isPaid,
          ),
        ),
      ),
    );
  }
}
