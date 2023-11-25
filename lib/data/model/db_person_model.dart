import 'package:hive/hive.dart';

import '../../presentation/constants/sw_hive.dart';

part 'db_person_model.g.dart';

@HiveType(typeId: SWHive.hiveIdDbPersonModel)
class DBPersonModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String gender;

  @HiveField(2)
  List<String> starshipsLink;

  DBPersonModel({
    required this.name,
    required this.gender,
    required this.starshipsLink,
  });
}
