// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'starship.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Starship {
  String get name => throw _privateConstructorUsedError;
  String get model => throw _privateConstructorUsedError;
  String get manufacturer => throw _privateConstructorUsedError;
  String get passengers => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StarshipCopyWith<Starship> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StarshipCopyWith<$Res> {
  factory $StarshipCopyWith(Starship value, $Res Function(Starship) then) =
      _$StarshipCopyWithImpl<$Res, Starship>;
  @useResult
  $Res call(
      {String name, String model, String manufacturer, String passengers});
}

/// @nodoc
class _$StarshipCopyWithImpl<$Res, $Val extends Starship>
    implements $StarshipCopyWith<$Res> {
  _$StarshipCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? model = null,
    Object? manufacturer = null,
    Object? passengers = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      manufacturer: null == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String,
      passengers: null == passengers
          ? _value.passengers
          : passengers // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StarshipImplCopyWith<$Res>
    implements $StarshipCopyWith<$Res> {
  factory _$$StarshipImplCopyWith(
          _$StarshipImpl value, $Res Function(_$StarshipImpl) then) =
      __$$StarshipImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name, String model, String manufacturer, String passengers});
}

/// @nodoc
class __$$StarshipImplCopyWithImpl<$Res>
    extends _$StarshipCopyWithImpl<$Res, _$StarshipImpl>
    implements _$$StarshipImplCopyWith<$Res> {
  __$$StarshipImplCopyWithImpl(
      _$StarshipImpl _value, $Res Function(_$StarshipImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? model = null,
    Object? manufacturer = null,
    Object? passengers = null,
  }) {
    return _then(_$StarshipImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      manufacturer: null == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String,
      passengers: null == passengers
          ? _value.passengers
          : passengers // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StarshipImpl implements _Starship {
  _$StarshipImpl(
      {required this.name,
      required this.model,
      required this.manufacturer,
      required this.passengers});

  @override
  final String name;
  @override
  final String model;
  @override
  final String manufacturer;
  @override
  final String passengers;

  @override
  String toString() {
    return 'Starship(name: $name, model: $model, manufacturer: $manufacturer, passengers: $passengers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StarshipImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.manufacturer, manufacturer) ||
                other.manufacturer == manufacturer) &&
            (identical(other.passengers, passengers) ||
                other.passengers == passengers));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, model, manufacturer, passengers);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StarshipImplCopyWith<_$StarshipImpl> get copyWith =>
      __$$StarshipImplCopyWithImpl<_$StarshipImpl>(this, _$identity);
}

abstract class _Starship implements Starship {
  factory _Starship(
      {required final String name,
      required final String model,
      required final String manufacturer,
      required final String passengers}) = _$StarshipImpl;

  @override
  String get name;
  @override
  String get model;
  @override
  String get manufacturer;
  @override
  String get passengers;
  @override
  @JsonKey(ignore: true)
  _$$StarshipImplCopyWith<_$StarshipImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
