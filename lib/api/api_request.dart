import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:starwars/domain/model/person.dart';

import '../domain/model/person_object.dart';
import '../domain/model/planet.dart';
import '../domain/model/planets_object.dart';
import '../domain/model/starship.dart';
import '../domain/model/starships_object.dart';

const String domen = 'swapi.dev';
const String queryParamGetPeople = '/api/people/';
const String queryParamGetPlanet = '/api/planets/';
const String queryParamGetStarship = '/api/starships/';

Future<PersonObject?> loadPeople(String nextPage) async {
  String? jsonString = await _loadJSONPeople(nextPage);
  if(jsonString!=null){
    PersonObject personObject = _parseJsonPeople(jsonString);
    return personObject;
  }
  return null;
}

Future<String?> _loadJSONPeople(String nextPage) async {
  var url = Uri.https(domen, '/api/people/',  {"page":nextPage[nextPage.length - 1]});
  var response = await http.get(url);

  if(response.statusCode == 200){
    return response.body;
  }
  return null;
}

PersonObject _parseJsonPeople(String jsonString) {
  final decoded = jsonDecode(jsonString);


  final nextPage  = decoded['next'] as String?;

  final peopleList = (decoded['results'] as List<dynamic>)
      .map((e) => Person.fromJson(e))
      .toList();

  return PersonObject(peopleList: peopleList, nextPage: nextPage);
}

Future<PlanetsObject?> loadPlanets(String nextPage) async {
  String? jsonString = await _loadJSONPlanets(nextPage);
  if(jsonString!=null){
    PlanetsObject planetsObject = _parseJsonPlanets(jsonString);
    return planetsObject;
  }
  return null;
}

Future<String?> _loadJSONPlanets(String nextPage) async {
  var url = Uri.https(domen, '/api/planets/',  {"page":nextPage[nextPage.length - 1]});
  var response = await http.get(url);

  if(response.statusCode == 200){
    return response.body;
  }
  return null;
}

PlanetsObject _parseJsonPlanets(String jsonString) {
  final decoded = jsonDecode(jsonString);


  final nextPage  = decoded['next'] as String?;

  final planetsList = (decoded['results'] as List<dynamic>)
      .map((e) => Planet.fromJson(e))
      .toList();

  return PlanetsObject(planetsList: planetsList, nextPage: nextPage);
}


Future<StarshipsObject?> loadStarships(String nextPage) async {
  String? jsonString = await _loadJSONStarships(nextPage);
  if(jsonString!=null){
    StarshipsObject starshipsObject = _parseJsonStarships(jsonString);
    return starshipsObject;
  }
  return null;
}

Future<String?> _loadJSONStarships(String nextPage) async {
  var url = Uri.https(domen, '/api/starships/',  {"page":nextPage[nextPage.length - 1]});
  var response = await http.get(url);

  if(response.statusCode == 200){
    return response.body;
  }
  return null;
}

StarshipsObject _parseJsonStarships(String jsonString) {
  final decoded = jsonDecode(jsonString);


  final nextPage  = decoded['next'] as String?;

  final starshipsList = (decoded['results'] as List<dynamic>)
      .map((e) => Starship.fromJson(e))
      .toList();

  return StarshipsObject(starshipsList: starshipsList, nextPage: nextPage);
}

Future<PersonObject?> loadPeopleSearch(String nextPage, String search) async {
  String? jsonString = await _loadJSONPeopleSearch(nextPage, search);
  if(jsonString!=null){
    PersonObject personObject = _parseJsonPeopleSearch(jsonString);
    return personObject;
  }
  return null;
}

PersonObject _parseJsonPeopleSearch(String jsonString) {
  final decoded = jsonDecode(jsonString);

  final nextPage  = decoded['next'] as String?;

  final peopleList = (decoded['results'] as List<dynamic>)
      .map((e) => Person.fromJson(e))
      .toList();

  return PersonObject(peopleList: peopleList, nextPage: nextPage);
}

Future<String?> _loadJSONPeopleSearch(String nextPage, String search) async {
  var url = Uri.https(domen, '/api/people/',  {"search":search});
  var response = await http.get(url);
  if(response.statusCode == 200){
    return response.body;
  }
  return null;
}

Future<PlanetsObject?> loadPlanetsSearch(String nextPage, String search) async {
  String? jsonString = await _loadJSONPlanetsSearch(nextPage, search);
  if(jsonString!=null){
    PlanetsObject planetsObject = _parseJsonPlanetsSearch(jsonString);
    return planetsObject;
  }
  return null;
}

PlanetsObject _parseJsonPlanetsSearch(String jsonString) {
  final decoded = jsonDecode(jsonString);

  final nextPage  = decoded['next'] as String?;

  final planetsList = (decoded['results'] as List<dynamic>)
      .map((e) => Planet.fromJson(e))
      .toList();

  return PlanetsObject(planetsList: planetsList, nextPage: nextPage);
}

Future<String?> _loadJSONPlanetsSearch(String nextPage, String search) async {
  var url = Uri.https(domen, '/api/planets/',  {"search":search});
  var response = await http.get(url);
  if(response.statusCode == 200){
    return response.body;
  }
  return null;
}

Future<StarshipsObject?> loadStarshipsSearch(String nextPage, String search) async {
  String? jsonString = await _loadJSONStarshipsSearch(nextPage, search);
  if(jsonString!=null){
    StarshipsObject starshipsObject = _parseJsonStarshipsSearch(jsonString);
    return starshipsObject;
  }
  return null;
}

StarshipsObject _parseJsonStarshipsSearch(String jsonString) {
  final decoded = jsonDecode(jsonString);

  final nextPage  = decoded['next'] as String?;

  final starshipsList = (decoded['results'] as List<dynamic>)
      .map((e) => Starship.fromJson(e))
      .toList();

  return StarshipsObject(starshipsList: starshipsList, nextPage: nextPage);
}

Future<String?> _loadJSONStarshipsSearch(String nextPage, String search) async {
  var url = Uri.https(domen, '/api/starships/',  {"search":search});
  var response = await http.get(url);
  if(response.statusCode == 200){
    return response.body;
  }
  return null;
}

