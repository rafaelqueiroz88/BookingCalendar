import 'package:booking_services/models/person.dart';

class Customer extends Person {
  final String personName;

  Customer({required this.personName}) : super(name: personName);
}
