import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:booking_services/providers/calendar_provider.dart';

class NotifierProviderList extends StatelessWidget {
  final Widget child;

  const NotifierProviderList({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => CalendarProvider()),
      ],
      child: child,
    );
  }
}
