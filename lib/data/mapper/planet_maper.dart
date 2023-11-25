
import '../../domain/model/planet.dart';
import '../model/db_planet_model.dart';

class PlanetMapper {
  DBPlanetModel getDBModel(Planet planet) {
    final DBPlanetModel dbModel = DBPlanetModel(
        name: planet.name,
        diameter: planet.diameter,
        population: planet.population);

    return dbModel;
  }

  Planet getProject(DBPlanetModel dbModel) {
    return Planet(
        name: dbModel.name,
        diameter: dbModel.diameter,
        population: dbModel.population);
  }
}