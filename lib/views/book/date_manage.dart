import 'package:flutter/material.dart';
import 'package:booking_services/providers/calendar_provider.dart';

mixin DateManage {
  bool initializing = true;
  bool loading = false;
  String locale = 'pt_BR';
  late CalendarProvider schedule;
  final TextEditingController controller = TextEditingController();

  void initialized() => initializing = false;

  void isLoading() => loading = true;

  void isLoaded() => loading = false;
}
