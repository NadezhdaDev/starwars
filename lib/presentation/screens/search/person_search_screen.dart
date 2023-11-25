import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars/domain/model/person.dart';
import 'package:starwars/domain/model/person_object.dart';
import 'package:starwars/presentation/state/page/object_state.dart';

import '../../../data/repository/people_db_repository.dart';
import '../../state/page/object_cubit.dart';

class PersonSearchScreen extends StatefulWidget {
  final BuildContext objectCubitContext;

  const PersonSearchScreen(
      {super.key, required this.objectCubitContext});

  @override
  State<PersonSearchScreen> createState() => _PersonSearchScreenState();
}

class _PersonSearchScreenState extends State<PersonSearchScreen> {

  bool isSearch = false;
  String search ='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<ObjectCubit>.value(
        value: widget.objectCubitContext.read<ObjectCubit>(),
        child: BlocBuilder<ObjectCubit, ObjectState>(
            bloc: widget.objectCubitContext.read<ObjectCubit>(),
            builder: (contextCubitObject, state) {
              return FutureBuilder<PersonObject?>(
                future: _getPage(contextCubitObject),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    return Column(
                      children: [
                        Expanded(
                          child: _listView(
                              contextCubitObject, snapshot.data!.peopleList),
                        ),
                        snapshot.data!.nextPage != null? Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: ElevatedButton(
                              onPressed: () {
                                final pageCubit = contextCubitObject.read<ObjectCubit>();
                                pageCubit.changeNext(snapshot.data!.nextPage!, isPerson: true);
                              },
                              child: const Text('Next'),),
                        ):const SizedBox.shrink(),
                        Container(
                          color: Colors.blue[200],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              onChanged: (a) {
                                search = a;

                                if(a.length >= 2){
                                  isSearch = true;
                                  contextCubitObject.read<ObjectCubit>().setSearch();
                                }
                                if(a.length ==1 && isSearch){
                                  isSearch = false;
                                  contextCubitObject.read<ObjectCubit>().setSearch();
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
                  }else if (snapshot.hasError) {
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

  Widget _listView( BuildContext contextCubitObject,
      List<Person> personList) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20.0),
        itemCount: personList.length,
        itemBuilder: (context, index) {
          return Card(
            shadowColor: Colors.red,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(personList[index].name),
                Text(personList[index].gender),
                Text(((personList[index].starshipsLink))
                    .length
                    .toString()),
                TextButton(onPressed: () {
                  context
                      .read<PeopleDBRepository>()
                      .add(personList[index], context);
                }, child: const Text('Save'),),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<PersonObject?> _getPage(
      BuildContext contextObject) async {
    final objectCubit = contextObject.read<ObjectCubit>();
    await objectCubit.setProject(isPerson: true, isSearch: isSearch, search: search);
    return objectCubit.peopleObject;
  }
}
