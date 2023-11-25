import 'package:flutter/cupertino.dart';

abstract class FavouriteObjectRepository<T> {
  Future<void> init();

  List<T> getFavouriteObject();

  Future<void> add(T favouriteObject, BuildContext context);

  Future<void> remove(T favouriteObject);

}
