import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../../domain/model/starship.dart';
import '../../domain/repository/project_repository.dart';
import '../mapper/starship_mapper.dart';
import '../model/db_starship_model.dart';

class StarshipsDBRepository implements FavouriteObjectRepository {
  static const _boxStarships = 'starships';
  static late Box<DBStarshipModel> _starshipsBox;
  final _projectStarshipMapper = StarshipMapper();

  @override
  Future<void> init() async {
    Hive.registerAdapter<DBStarshipModel>(DBStarshipModelAdapter());

    return Hive.openBox<DBStarshipModel>(_boxStarships).then(
      (_) {
        _starshipsBox = Hive.box<DBStarshipModel>(_boxStarships);
      },
    );
  }

  @override
  List<Starship> getFavouriteObject() {
    final starship = _starshipsBox.values;

    final starshipList = starship
        .map<Starship>(
          (e) => _projectStarshipMapper.getProject(e),
        )
        .toList();
    return starshipList;
  }

  @override
  Future<void> remove(favouriteObject) {
    var dbModel = _starshipsBox.values
        .firstWhere((element) => element.name == favouriteObject.name);
    return dbModel.delete();
  }

  @override
  Future<void> add(favouriteObject, context) async {
    final favouriteList = getFavouriteObject();
    final model = _projectStarshipMapper.getDBModel(favouriteObject);

    if (favouriteList.contains(favouriteObject)) {
      const snackBar = SnackBar(
        content: Text('Объект уже находится в избранном'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      await _starshipsBox.add(model);
    }
  }
}
