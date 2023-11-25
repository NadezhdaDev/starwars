import 'package:hive/hive.dart';

import '../../presentation/constants/sw_hive.dart';

part 'db_planet_model.g.dart';

@HiveType(typeId: SWHive.hiveIdDbPlanetModel)
class DBPlanetModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String diameter;

  @HiveField(2)
  String population;

  DBPlanetModel({
    required this.name,
    required this.diameter,
    required this.population,
  });
}