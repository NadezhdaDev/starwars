import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repository/people_db_repository.dart';
import '../../data/repository/planets_db_repository.dart';
import '../../data/repository/starships_db_repository.dart';
import '../../presentation/attributes/sw_app_config.dart';
import '../../presentation/screens/application.dart';
import 'package:hive_flutter/adapters.dart';

class EntryPoints {
  static late SWAppConfig ppAppConfig;

  static Future<void> main(SWAppConfig appConfig) async {
    ppAppConfig = appConfig;
    WidgetsFlutterBinding.ensureInitialized();

    final personRepo = PeopleDBRepository();
    final planetRepo = PlanetsDBRepository();
    final starshipRepo = StarshipsDBRepository();
    await Hive.initFlutter().then((_) async {
          await personRepo.init();
          await planetRepo.init();
          await starshipRepo.init();
    });

    return runApp(MultiRepositoryProvider(
      providers: [
        RepositoryProvider<PeopleDBRepository>.value(value: personRepo),
        RepositoryProvider<PlanetsDBRepository>.value(value: planetRepo),
        RepositoryProvider<StarshipsDBRepository>.value(value: starshipRepo),
      ],
      child: const MaterialApp(
        home: Application(),
      ),
    ));
  }
}
