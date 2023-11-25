import 'package:starwars/data/model/db_starship_model.dart';

import '../../domain/model/starship.dart';

class StarshipMapper {
  DBStarshipModel getDBModel(Starship person) {
    final DBStarshipModel dbModel = DBStarshipModel(
        name: person.name,
        model: person.model,
        manufacturer: person.manufacturer,
        passengers: person.passengers
    );

    return dbModel;
  }

  Starship getProject(DBStarshipModel dbModel) {
    return Starship(
        name: dbModel.name,
        model: dbModel.model,
        manufacturer: dbModel.manufacturer,
        passengers: dbModel.passengers
    );
  }
}