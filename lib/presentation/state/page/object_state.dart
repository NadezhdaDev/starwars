

import '../../../domain/model/person_object.dart';
import '../../../domain/model/planets_object.dart';
import '../../../domain/model/starships_object.dart';

class ObjectState {
  PersonObject? peopleAllObject;
  PersonObject? peopleSearchObject;
  PersonObject? peopleObject;
  String pagePeopleAll;
  String pagePeopleSearch;

  PlanetsObject? planetsAllObject;
  PlanetsObject? planetsSearchObject;
  PlanetsObject? planetsObject;
  String pagePlanetsAll;
  String pagePlanetsSearch;

  StarshipsObject? starshipsAllObject;
  StarshipsObject? starshipsSearchObject;
  StarshipsObject? starshipsObject;
  String pageStarshipsAll;
  String pageStarshipsSearch;

  ObjectState({
    required this.peopleAllObject,
    required this.peopleSearchObject,
    required this.peopleObject,
    required this.pagePeopleAll,
    required this.pagePeopleSearch,
    required this.planetsAllObject,
    required this.planetsSearchObject,
    required this.planetsObject,
    required this.pagePlanetsAll,
    required this.pagePlanetsSearch,
    required this.starshipsAllObject,
    required this.starshipsSearchObject,
    required this.starshipsObject,
    required this.pageStarshipsAll,
    required this.pageStarshipsSearch
  });
}