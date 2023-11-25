import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/planets_db_repository.dart';

class PlanetsFavouriteScreen extends StatelessWidget {
  const PlanetsFavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20.0),
        itemCount: _getList(context).length,
        itemBuilder: (context, index) {
          return Card(
            shadowColor: Colors.red,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(_getList(context)[index].name),
                Text(_getList(context)[index].diameter),
                Text(_getList(context)[index].population),
              ],
            ),
          );
        },
      ),
    );
  }

  _getList(BuildContext context) => context.read<PlanetsDBRepository>().getFavouriteObject();
}
