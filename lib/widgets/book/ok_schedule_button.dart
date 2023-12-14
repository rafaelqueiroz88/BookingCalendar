import 'package:flutter/material.dart';

import 'package:booking_services/providers/calendar_provider.dart';

class OkScheduleButton extends StatefulWidget {
  final TextEditingController controller;
  final CalendarProvider schedule;
  const OkScheduleButton({
    required this.controller,
    required this.schedule,
    super.key,
  });

  @override
  State<OkScheduleButton> createState() => _OkScheduleButtonState();
}

class _OkScheduleButtonState extends State<OkScheduleButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.controller.text.isEmpty
          ? null
          : () {
              widget.schedule.addEvents(widget.controller.text, true);
              widget.controller.clear();
              Navigator.of(context).pop();
            },
      child: const Text('OK'),
    );
  }
}
