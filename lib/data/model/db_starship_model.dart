import 'package:hive/hive.dart';

import '../../presentation/constants/sw_hive.dart';

part 'db_starship_model.g.dart';

@HiveType(typeId: SWHive.hiveIdDbStarshipModel)
class DBStarshipModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String model;

  @HiveField(2)
  String manufacturer;

  @HiveField(3)
  String passengers;

  DBStarshipModel({
    required this.name,
    required this.model,
    required this.manufacturer,
    required this.passengers,
  });
}