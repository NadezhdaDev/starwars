import 'package:starwars/domain/model/planet.dart';

class PlanetsObject{
  final List<Planet> planetsList;
  final String? nextPage;
  PlanetsObject({required this.planetsList, required this.nextPage});
}