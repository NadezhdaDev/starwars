import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../domain/model/planet.dart';
import '../../domain/repository/project_repository.dart';
import '../mapper/planet_maper.dart';
import '../model/db_planet_model.dart';

class PlanetsDBRepository implements FavouriteObjectRepository {
  static const _boxPlanets = 'planets';
  static late Box<DBPlanetModel> _planetsBox;
  final _projectPlanetMapper = PlanetMapper();

  @override
  Future<void> init() async {
    Hive.registerAdapter<DBPlanetModel>(DBPlanetModelAdapter());

    return Hive.openBox<DBPlanetModel>(_boxPlanets).then(
      (_) {
        _planetsBox = Hive.box<DBPlanetModel>(_boxPlanets);
      },
    );
  }

  @override
  List<Planet> getFavouriteObject() {
    final planet = _planetsBox.values;

    final planetList = planet
        .map<Planet>(
          (e) => _projectPlanetMapper.getProject(e),
        )
        .toList();
    return planetList;
  }

  @override
  Future<void> remove(favouriteObject) {
    var dbModel = _planetsBox.values
        .firstWhere((element) => element.name == favouriteObject.name);
    return dbModel.delete();
  }

  @override
  Future<void> add(favouriteObject,context) async {
    final favouriteList = getFavouriteObject();
    final model = _projectPlanetMapper.getDBModel(favouriteObject);
    if(favouriteList.contains(favouriteObject)){
      const snackBar = SnackBar(
        content: Text('Объект уже находится в избранном'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }else{
      await _planetsBox.add(model);
    }
  }
}
