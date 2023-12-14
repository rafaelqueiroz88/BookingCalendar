import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:booking_services/providers/calendar_provider.dart';
import 'package:booking_services/widgets/book/calendar_widget.dart';
import 'package:booking_services/widgets/book/events_overview.dart';
import 'package:booking_services/widgets/book/add_schedule_button.dart';
import 'package:booking_services/views/book/date_manage.dart';

class Overview extends StatefulWidget {
  const Overview({super.key});

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> with DateManage {
  @override
  void didChangeDependencies() {
    schedule = Provider.of<CalendarProvider>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(':D'),
        backgroundColor: Colors.purple,
      ),
      floatingActionButton: AddScheduleButton(controller: controller),
      body: Column(
        children: [
          CalendarWidget(schedule: schedule),
          const SizedBox(height: 10),
          const EventsOverview(),
        ],
      ),
    );
  }
}
