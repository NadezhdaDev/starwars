// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'planet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Planet {
  String get name => throw _privateConstructorUsedError;
  String get diameter => throw _privateConstructorUsedError;
  String get population => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlanetCopyWith<Planet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanetCopyWith<$Res> {
  factory $PlanetCopyWith(Planet value, $Res Function(Planet) then) =
      _$PlanetCopyWithImpl<$Res, Planet>;
  @useResult
  $Res call({String name, String diameter, String population});
}

/// @nodoc
class _$PlanetCopyWithImpl<$Res, $Val extends Planet>
    implements $PlanetCopyWith<$Res> {
  _$PlanetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? diameter = null,
    Object? population = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      diameter: null == diameter
          ? _value.diameter
          : diameter // ignore: cast_nullable_to_non_nullable
              as String,
      population: null == population
          ? _value.population
          : population // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlanetImplCopyWith<$Res> implements $PlanetCopyWith<$Res> {
  factory _$$PlanetImplCopyWith(
          _$PlanetImpl value, $Res Function(_$PlanetImpl) then) =
      __$$PlanetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String diameter, String population});
}

/// @nodoc
class __$$PlanetImplCopyWithImpl<$Res>
    extends _$PlanetCopyWithImpl<$Res, _$PlanetImpl>
    implements _$$PlanetImplCopyWith<$Res> {
  __$$PlanetImplCopyWithImpl(
      _$PlanetImpl _value, $Res Function(_$PlanetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? diameter = null,
    Object? population = null,
  }) {
    return _then(_$PlanetImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      diameter: null == diameter
          ? _value.diameter
          : diameter // ignore: cast_nullable_to_non_nullable
              as String,
      population: null == population
          ? _value.population
          : population // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PlanetImpl implements _Planet {
  _$PlanetImpl(
      {required this.name, required this.diameter, required this.population});

  @override
  final String name;
  @override
  final String diameter;
  @override
  final String population;

  @override
  String toString() {
    return 'Planet(name: $name, diameter: $diameter, population: $population)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlanetImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.diameter, diameter) ||
                other.diameter == diameter) &&
            (identical(other.population, population) ||
                other.population == population));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, diameter, population);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlanetImplCopyWith<_$PlanetImpl> get copyWith =>
      __$$PlanetImplCopyWithImpl<_$PlanetImpl>(this, _$identity);
}

abstract class _Planet implements Planet {
  factory _Planet(
      {required final String name,
      required final String diameter,
      required final String population}) = _$PlanetImpl;

  @override
  String get name;
  @override
  String get diameter;
  @override
  String get population;
  @override
  @JsonKey(ignore: true)
  _$$PlanetImplCopyWith<_$PlanetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
