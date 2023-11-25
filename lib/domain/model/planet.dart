import 'package:freezed_annotation/freezed_annotation.dart';

part 'planet.freezed.dart';

@freezed
class Planet with _$Planet {
  factory Planet({
    required String name,
    required String diameter,
    required String population,
  }) = _Planet;

  static Planet fromJson(Map<String, Object?> json) => Planet(
      name: json['name'] as String,
  diameter: json['diameter'] as String,
  population: json['population'] as String);
}
