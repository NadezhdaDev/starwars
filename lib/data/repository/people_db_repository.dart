import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:starwars/domain/model/person.dart';

import '../../domain/repository/project_repository.dart';
import '../mapper/person_maper.dart';
import '../model/db_person_model.dart';

class PeopleDBRepository implements FavouriteObjectRepository {
  static const _boxPeople = 'people';
  static late Box<DBPersonModel> _peopleBox;
  final _projectPersonMapper = PersonMapper();

  @override
  Future<void> init() async {
    Hive.registerAdapter<DBPersonModel>(DBPersonModelAdapter());

    return Hive.openBox<DBPersonModel>(_boxPeople).then(
      (_) {
        _peopleBox = Hive.box<DBPersonModel>(_boxPeople);
      },
    );
  }

  @override
  List<Person> getFavouriteObject() {
    final person = _peopleBox.values;

    final peopleList = person
        .map<Person>(
          (e) => _projectPersonMapper.getProject(e),
        )
        .toList();
    return peopleList;
  }

  @override
  Future<void> remove(favouriteObject) {
    var dbModel = _peopleBox.values
        .firstWhere((element) => element.name == favouriteObject.name);
    return dbModel.delete();
  }

  @override
  Future<void> add(favouriteObject, context) async {
    final favouriteList = getFavouriteObject();
    final model = _projectPersonMapper.getDBModel(favouriteObject);
    if (favouriteList.contains(favouriteObject)) {
      const snackBar = SnackBar(
        content: Text('Объект уже находится в избранном'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      await _peopleBox.add(model);
    }
  }
}
