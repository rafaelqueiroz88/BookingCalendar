import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:booking_services/providers/calendar_provider.dart';

class AddScheduleButton extends StatelessWidget {
  final TextEditingController controller;
  const AddScheduleButton({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    final CalendarProvider schedule =
        Provider.of<CalendarProvider>(context, listen: false);

    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              scrollable: true,
              title: const Text('Mensagem'),
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(controller: controller),
              ),
              actions: [
                ValueListenableBuilder<TextEditingValue>(
                  valueListenable: controller,
                  builder: (_, value, child) {
                    return ElevatedButton(
                      onPressed: value.text.isEmpty
                          ? null
                          : () {
                              schedule.addEvents(controller.text, true);
                              controller.clear();
                              Navigator.of(context).pop();
                            },
                      child: const Text('OK'),
                    );
                  },
                ),
              ],
            );
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
