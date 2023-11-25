import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars/presentation/state/page/object_state.dart';

import '../../../data/repository/planets_db_repository.dart';
import '../../../domain/model/planet.dart';
import '../../../domain/model/planets_object.dart';
import '../../state/page/object_cubit.dart';

class PlanetSearchScreen extends StatefulWidget {
  final BuildContext objectCubitContext;

  const PlanetSearchScreen({super.key, required this.objectCubitContext});

  @override
  State<PlanetSearchScreen> createState() => _PlanetSearchScreenState();
}

class _PlanetSearchScreenState extends State<PlanetSearchScreen> {
  bool isSearch = false;
  String search = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<ObjectCubit>.value(
        value: widget.objectCubitContext.read<ObjectCubit>(),
        child: BlocBuilder<ObjectCubit, ObjectState>(
            bloc: widget.objectCubitContext.read<ObjectCubit>(),
            builder: (contextCubitObject, state) {
              return FutureBuilder<PlanetsObject?>(
                future: _getPage(contextCubitObject),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    return Column(
                      children: [
                        Expanded(
                          child: _listView(
                              contextCubitObject, snapshot.data!.planetsList),
                        ),
                        snapshot.data!.nextPage != null
                            ? Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    final pageCubit =
                                        contextCubitObject.read<ObjectCubit>();
                                    pageCubit.changeNext(
                                        snapshot.data!.nextPage!,
                                        isPlanet: true);
                                  },
                                  child: const Text('Next'),
                                ),
                              )
                            : const SizedBox.shrink(),
                        Container(
                          color: Colors.blue[200],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              onChanged: (a) {
                                search = a;

                                if (a.length >= 2) {
                                  isSearch = true;
                                  contextCubitObject
                                      .read<ObjectCubit>()
                                      .setSearch();
                                }
                                if (a.length == 1 && isSearch) {
                                  isSearch = false;
                                  contextCubitObject
                                      .read<ObjectCubit>()
                                      .setSearch();
                                }
                              },
                              decoration: const InputDecoration(
                                hintText: 'Search',
                                prefixIcon: Icon(Icons.search),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text('Error'),
                    );
                  } else {
                    return const Center(
                      child: Text('Loading data...'),
                    );
                  }
                },
              );
            }),
      ),
    );
  }

  Widget _listView(BuildContext contextCubitObject, List<Planet> planetsList) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20.0),
        itemCount: planetsList.length,
        itemBuilder: (context, index) {
          return Card(
            shadowColor: Colors.red,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(planetsList[index].name),
                Text(planetsList[index].diameter),
                Text(planetsList[index].population),
                TextButton(onPressed: () {
                  final dbRepo = context
                      .read<PlanetsDBRepository>();
                  dbRepo
                      .add(planetsList[index],context);
                }, child: const Text('Save'),),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<PlanetsObject?> _getPage(BuildContext contextObject) async {
    final objectCubit = contextObject.read<ObjectCubit>();
    await objectCubit.setProject(
        isPlanet: true, isSearch: isSearch, search: search);
    return objectCubit.planetsObject;
  }
}
