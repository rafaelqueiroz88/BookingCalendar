import 'package:booking_services/models/person.dart';

class Admin extends Person {
  final String personName;

  Admin({required this.personName}) : super(name: personName);
}
