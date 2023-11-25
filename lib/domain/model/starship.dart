import 'package:freezed_annotation/freezed_annotation.dart';

part 'starship.freezed.dart';

@freezed
class Starship with _$Starship {
  factory Starship({
    required String name,
    required String model,
    required String manufacturer,
    required String passengers,
  }) = _Starship;

  static Starship fromJson(Map<String, Object?> json) => Starship(
      name: json['name'] as String,
      model: json['model'] as String,
      manufacturer: json['manufacturer'] as String,
      passengers: json['passengers'] as String
      );
}
