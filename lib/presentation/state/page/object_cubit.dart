import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars/domain/model/person_object.dart';
import 'package:starwars/domain/model/starship.dart';
import 'package:starwars/presentation/state/page/object_state.dart';

import '../../../api/api_request.dart';
import '../../../domain/model/person.dart';
import '../../../domain/model/planet.dart';
import '../../../domain/model/planets_object.dart';
import '../../../domain/model/starships_object.dart';

class ObjectCubit extends Cubit<ObjectState> {
  PersonObject? _peopleAllObject;
  PersonObject? _peopleSearchObject;
  PersonObject? _peopleObject;
  String _pagePeopleAll;
  String _pagePeopleSearch;

  PlanetsObject? _planetsAllObject;
  PlanetsObject? _planetsSearchObject;
  PlanetsObject? _planetsObject;
  String _pagePlanetsAll;
  String _pagePlanetsSearch;

  StarshipsObject? _starshipsAllObject;
  StarshipsObject? _starshipsSearchObject;
  StarshipsObject? _starshipsObject;
  String _pageStarshipsAll;
  String _pageStarshipsSearch;

  PersonObject? get peopleAllObject => _peopleAllObject;

  PersonObject? get peopleSearchObject => _peopleSearchObject;

  PersonObject? get peopleObject => _peopleObject;

  String get pagePeopleAll => _pagePeopleAll;

  String get pagePeopleSearch => _pagePeopleSearch;

  PlanetsObject? get planetsAllObject => _planetsAllObject;

  PlanetsObject? get planetsSearchObject => _planetsSearchObject;

  PlanetsObject? get planetsObject => _planetsObject;

  String get pagePlanetsAll => _pagePlanetsAll;

  String get pagePlanetsSearch => _pagePlanetsSearch;

  StarshipsObject? get starshipsAllObject => _starshipsAllObject;

  StarshipsObject? get starshipsSearchObject => _starshipsSearchObject;

  StarshipsObject? get starshipsObject => _starshipsObject;

  String get pageStarshipsAll => _pageStarshipsAll;

  String get pageStarshipsSearch => _pageStarshipsSearch;

  ObjectCubit(
      this._peopleAllObject,
      this._peopleSearchObject,
      this._peopleObject,
      this._pagePeopleAll,
      this._pagePeopleSearch,
      this._planetsAllObject,
      this._planetsSearchObject,
      this._planetsObject,
      this._pagePlanetsAll,
      this._pagePlanetsSearch,
      this._starshipsAllObject,
      this._starshipsSearchObject,
      this._starshipsObject,
      this._pageStarshipsAll,
      this._pageStarshipsSearch)
      : super(ObjectState(
          peopleAllObject: _peopleAllObject,
          peopleSearchObject: _peopleSearchObject,
          peopleObject: _peopleObject,
          pagePeopleAll: _pagePeopleAll,
          pagePeopleSearch: _pagePeopleSearch,
          planetsAllObject: _planetsAllObject,
          planetsSearchObject: _planetsSearchObject,
          planetsObject: _planetsObject,
          pagePlanetsAll: _pagePlanetsAll,
          pagePlanetsSearch: _pagePlanetsSearch,
          starshipsAllObject: _starshipsAllObject,
          starshipsSearchObject: _starshipsSearchObject,
          starshipsObject: _starshipsObject,
          pageStarshipsAll: _pageStarshipsAll,
          pageStarshipsSearch: _pageStarshipsSearch,
        )) {
    emit(ObjectState(
      peopleAllObject: _peopleAllObject,
      peopleSearchObject: _peopleSearchObject,
      peopleObject: _peopleObject,
      pagePeopleAll: _pagePeopleAll,
      pagePeopleSearch: _pagePeopleSearch,
      planetsAllObject: _planetsAllObject,
      planetsSearchObject: _planetsSearchObject,
      planetsObject: _planetsObject,
      pagePlanetsAll: _pagePlanetsAll,
      pagePlanetsSearch: _pagePlanetsSearch,
      starshipsAllObject: _starshipsAllObject,
      starshipsSearchObject: _starshipsSearchObject,
      starshipsObject: _starshipsObject,
      pageStarshipsAll: _pageStarshipsAll,
      pageStarshipsSearch: _pageStarshipsSearch,
    ));
  }

  Future<void> changeNext(String? value,
      {bool isPerson = false,
      bool isPlanet = false,
      bool isStarship = false}) async {
    if (value == null) return;
    if (isPerson) {
      _pagePeopleAll = value;
    }
    if (isPlanet) {
      _pagePlanetsAll = value;
    }
    if (isStarship) {
      _pageStarshipsAll = value;
    }

    emitMethod();
  }

  void emitMethod() {
    emit(ObjectState(
      peopleAllObject: _peopleAllObject,
      peopleSearchObject: _peopleSearchObject,
      peopleObject: _peopleObject,
      pagePeopleAll: _pagePeopleAll,
      pagePeopleSearch: _pagePeopleSearch,
      planetsAllObject: _planetsAllObject,
      planetsSearchObject: _planetsSearchObject,
      planetsObject: _planetsObject,
      pagePlanetsAll: _pagePlanetsAll,
      pagePlanetsSearch: _pagePlanetsSearch,
      starshipsAllObject: _starshipsAllObject,
      starshipsSearchObject: _starshipsSearchObject,
      starshipsObject: _starshipsObject,
      pageStarshipsAll: _pageStarshipsAll,
      pageStarshipsSearch: _pageStarshipsSearch,
    ));
  }

  Future<void> changeNextSearch(String? value,
      {bool isPerson = false,
      bool isPlanet = false,
      bool isStarship = false}) async {
    if (value == null) return;
    if (isPerson) {
      _pagePeopleSearch = value;
    }

    if (isPlanet) {
      _pagePlanetsSearch = value;
    }

    if (isStarship) {
      _pageStarshipsSearch = value;
    }

    emitMethod();
  }

  Future<void> setSearch(
      {bool isPerson = false,
      bool isPlanet = false,
      bool isStarship = false}) async {
    if(isPerson){
      _pagePeopleSearch = '1';
      _peopleSearchObject = null;
    }

    if(isPlanet){
      _pagePlanetsSearch = '1';
      _planetsSearchObject = null;
    }

    if(isStarship){
      _pageStarshipsSearch = '1';
      _starshipsSearchObject = null;
    }

    emitMethod();
  }

  Future<void> setProject(
      {bool isPerson = false,
      bool isPlanet = false,
      bool isStarship = false,
      required bool isSearch,
      required String search}) async {

    _peopleAllObject ??= PersonObject(peopleList: [], nextPage: '');
    _peopleSearchObject ??= PersonObject(peopleList: [], nextPage: '');

    _planetsAllObject ??= PlanetsObject(planetsList: [], nextPage: '');
    _planetsSearchObject ??= PlanetsObject(planetsList: [], nextPage: '');

    _starshipsAllObject ??= StarshipsObject(starshipsList: [], nextPage: '');
    _starshipsSearchObject ??= StarshipsObject(starshipsList: [], nextPage: '');



    if (isPerson && !isSearch) {
      final newListPeople = await loadPeople(_pagePeopleAll);

      if (newListPeople != null) {
        final List<Person> list = [];
        list.addAll(_peopleAllObject!.peopleList);
        for (var person in newListPeople.peopleList) {
          if (!_peopleAllObject!.peopleList.contains(person)) {
            list.add(person);
          }
        }

        _peopleAllObject =
            PersonObject(peopleList: list, nextPage: newListPeople.nextPage);
        _peopleObject = _peopleAllObject;
      }
    }

    if (isPerson && isSearch) {
      final newListPeople = await loadPeopleSearch(_pagePeopleAll, search);

      if (newListPeople != null) {
        if(newListPeople.nextPage == null){
          _peopleSearchObject =
              PersonObject(peopleList: newListPeople.peopleList, nextPage: newListPeople.nextPage);
          _peopleObject = _peopleSearchObject;
        }else{
          final List<Person> list = [];
          list.addAll(_peopleSearchObject!.peopleList);
          for (var person in newListPeople.peopleList) {
            if (!_peopleSearchObject!.peopleList.contains(person)) {
              list.add(person);
            }
          }

          _peopleSearchObject =
              PersonObject(peopleList: list, nextPage: newListPeople.nextPage);
          _peopleObject = _peopleSearchObject;
        }
      }
    }

    if (isPlanet && !isSearch) {
      final newListPlanet = await loadPlanets(_pagePlanetsAll);

      if (newListPlanet != null) {
        final List<Planet> list = [];
        list.addAll(_planetsAllObject!.planetsList);
        for (var planet in newListPlanet.planetsList) {
          if (!_planetsAllObject!.planetsList.contains(planet)) {
            list.add(planet);
          }
        }

        _planetsAllObject =
            PlanetsObject(planetsList: list, nextPage: newListPlanet.nextPage);
        _planetsObject = _planetsAllObject;
      }
    }

    if (isPlanet && isSearch) {
      final newListPlanets = await loadPlanetsSearch(_pagePlanetsAll, search);

      if (newListPlanets != null) {
        if(newListPlanets.nextPage == null){
          _planetsSearchObject =
              PlanetsObject(planetsList: newListPlanets.planetsList, nextPage: newListPlanets.nextPage);
          _planetsObject = _planetsSearchObject;
        }else{
          final List<Planet> list = [];

          list.addAll(_planetsSearchObject!.planetsList);
          for (var planet in newListPlanets.planetsList) {
            if (!_planetsSearchObject!.planetsList.contains(planet)) {
              list.add(planet);
            }
          }

          _planetsSearchObject =
              PlanetsObject(planetsList: list, nextPage: newListPlanets.nextPage);
          _planetsObject = _planetsSearchObject;
        }
      }
    }

    if (isStarship && !isSearch) {
      final newListStarship = await loadStarships(_pageStarshipsAll);

      if (newListStarship != null) {
        final List<Starship> list = [];
        list.addAll(_starshipsAllObject!.starshipsList);
        for (var starship in newListStarship.starshipsList) {
          if (!_starshipsAllObject!.starshipsList.contains(starship)) {
            list.add(starship);
          }
        }

        _starshipsAllObject =
            StarshipsObject(starshipsList: list, nextPage: newListStarship.nextPage);
        _starshipsObject = _starshipsAllObject;
      }
    }

    if (isStarship && isSearch) {
      final newListStarship = await loadStarshipsSearch(_pageStarshipsAll, search);

      if (newListStarship != null) {
        if(newListStarship.nextPage == null){
          _starshipsSearchObject =
              StarshipsObject(starshipsList: newListStarship.starshipsList, nextPage: newListStarship.nextPage);
          _starshipsObject = _starshipsSearchObject;
        }else{
          final List<Starship> list = [];

          list.addAll(_starshipsSearchObject!.starshipsList);
          for (var starship in newListStarship.starshipsList) {
            if (!_starshipsSearchObject!.starshipsList.contains(starship)) {
              list.add(starship);
            }
          }

          _starshipsSearchObject =
              StarshipsObject(starshipsList: list, nextPage: newListStarship.nextPage);
          _starshipsObject = _starshipsSearchObject;
        }
      }
    }


  }
}
