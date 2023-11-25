import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/starships_db_repository.dart';

class StarshipsFavouriteScreen extends StatelessWidget {
  const StarshipsFavouriteScreen({super.key});

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
                Text(_getList(context)[index].model),
                Text(_getList(context)[index].manufacturer),
                Text(_getList(context)[index].passengers),
              ],
            ),
          );
        },
      ),
    );
  }

  _getList(BuildContext context) => context.read<StarshipsDBRepository>().getFavouriteObject();

}
