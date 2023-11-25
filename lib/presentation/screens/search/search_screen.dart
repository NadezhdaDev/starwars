import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars/domain/model/person_object.dart';
import 'package:starwars/domain/model/planets_object.dart';
import 'package:starwars/presentation/screens/search/person_search_screen.dart';
import 'package:starwars/presentation/screens/search/planet_search_screen.dart';
import 'package:starwars/presentation/screens/search/starship_search_screen.dart';
import 'package:starwars/presentation/state/page/object_cubit.dart';
import 'package:starwars/presentation/state/page/object_state.dart';

import '../../../domain/model/starships_object.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  List<Widget> _tabs(BuildContext objectCubitContext) => [
    PersonSearchScreen(
      objectCubitContext: objectCubitContext,
    ),
    PlanetSearchScreen(
      objectCubitContext: objectCubitContext,
    ),
    StarshipSearchScreen(
      objectCubitContext: objectCubitContext,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<ObjectCubit>(
        create: (contextCubit) => ObjectCubit(
          PersonObject(peopleList: [], nextPage: ''),
          PersonObject(peopleList: [], nextPage: ''),
          PersonObject(peopleList: [], nextPage: ''),
          '1',
          '1',
          PlanetsObject(planetsList: [], nextPage: ''),
          PlanetsObject(planetsList: [], nextPage: ''),
          PlanetsObject(planetsList: [], nextPage: ''),
          '1',
          '1',
          StarshipsObject(starshipsList: [], nextPage: ''),
          StarshipsObject(starshipsList: [], nextPage: ''),
          StarshipsObject(starshipsList: [], nextPage: ''),
          '1',
          '1',
        ),
        child: BlocBuilder<ObjectCubit, ObjectState>(
            builder: (objectContextCubit, state) {
          return DefaultTabController(
            length: _tabs(objectContextCubit).length,
            child: Scaffold(
              appBar: AppBar(
                title: const Text('StarWars'),
                bottom: const TabBar(
                  tabs: [
                    Tab(text: 'Персонажы'),
                    Tab(text: 'Планеты'),
                    Tab(text: 'Звездолеты'),
                  ],
                ),
              ),
              body: TabBarView(
                children: _tabs(objectContextCubit),
              ),
            ),
          );
        }),
      ),
    );
  }
}
