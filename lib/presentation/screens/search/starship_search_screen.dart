import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars/presentation/state/page/object_state.dart';
import '../../../data/repository/starships_db_repository.dart';
import '../../../domain/model/starship.dart';
import '../../../domain/model/starships_object.dart';
import '../../state/page/object_cubit.dart';

class StarshipSearchScreen extends StatefulWidget {
  final BuildContext objectCubitContext;

  const StarshipSearchScreen({super.key, required this.objectCubitContext});

  @override
  State<StarshipSearchScreen> createState() => _StarshipSearchScreenState();
}

class _StarshipSearchScreenState extends State<StarshipSearchScreen> {
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
              return FutureBuilder<StarshipsObject?>(
                future: _getPage(contextCubitObject),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    return Column(
                      children: [
                        Expanded(
                          child: _listView(
                              contextCubitObject, snapshot.data!.starshipsList),
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
                                        isStarship: true);
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

  Widget _listView(
      BuildContext contextCubitObject, List<Starship> starshipsList) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20.0),
        itemCount: starshipsList.length,
        itemBuilder: (context, index) {
          return Card(
            shadowColor: Colors.red,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(starshipsList[index].name),
                Text(starshipsList[index].model),
                Text(starshipsList[index].manufacturer),
                Text(starshipsList[index].passengers),
                TextButton(onPressed: () {
                  context
                      .read<StarshipsDBRepository>()
                      .add(starshipsList[index],context);
                }, child: const Text('Save'),),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<StarshipsObject?> _getPage(BuildContext contextObject) async {
    final objectCubit = contextObject.read<ObjectCubit>();
    await objectCubit.setProject(
        isStarship: true, isSearch: isSearch, search: search);
    return objectCubit.starshipsObject;
  }
}
