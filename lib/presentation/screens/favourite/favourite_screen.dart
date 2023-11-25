import 'package:flutter/material.dart';
import 'package:starwars/presentation/screens/favourite/person_favourite_screen.dart';
import 'package:starwars/presentation/screens/favourite/planets_favoourite_screen.dart';
import 'package:starwars/presentation/screens/favourite/starships_favourite_screen.dart';


class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  List<Widget> _tabs() =>
      [
        const PeopleFavouriteScreen(),
        const PlanetsFavouriteScreen(),
        const StarshipsFavouriteScreen(),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
          length: _tabs().length,
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
              children: _tabs(),
            ),
          ),
        )
    );
  }

}