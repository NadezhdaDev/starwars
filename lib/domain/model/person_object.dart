import 'package:starwars/domain/model/person.dart';

class PersonObject{
  final List<Person> peopleList;
  final String? nextPage;
  PersonObject({required this.peopleList, required this.nextPage});
}