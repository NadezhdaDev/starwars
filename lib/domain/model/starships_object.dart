import 'package:starwars/domain/model/starship.dart';

class StarshipsObject{
  final List<Starship> starshipsList;
  final String? nextPage;
  StarshipsObject({required this.starshipsList, required this.nextPage});
}