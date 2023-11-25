import 'package:freezed_annotation/freezed_annotation.dart';

part 'person.freezed.dart';

@freezed
class Person with _$Person {
  factory Person({
    required String name,
    required String gender,
    required List<String> starshipsLink,
  }) = _Person;

  static Person fromJson(Map<String, Object?> json) => Person(
      name: json['name'] as String,
      gender: json['gender'] as String,
      starshipsLink: (json['starships'] as List<dynamic>).map((e) => e.toString()).toList());
}
