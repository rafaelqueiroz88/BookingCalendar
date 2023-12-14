import 'package:flutter/material.dart';

class Event extends StatelessWidget {
  final String id;
  final String title;
  final bool isPaid;
  const Event({
    required this.id,
    required this.title,
    required this.isPaid,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(id),
      leading: Icon(
        isPaid ? Icons.paid : Icons.paid_outlined,
      ),
    );
  }
}
