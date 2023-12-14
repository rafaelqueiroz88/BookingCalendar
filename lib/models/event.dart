class Event {
  final String id;
  final String title;
  final bool isPaid;
  const Event({
    required this.id,
    required this.title,
    required this.isPaid,
  });

  @override
  String toString() => title;
}
