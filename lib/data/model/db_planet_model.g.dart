// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_planet_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DBPlanetModelAdapter extends TypeAdapter<DBPlanetModel> {
  @override
  final int typeId = 2;

  @override
  DBPlanetModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DBPlanetModel(
      name: fields[0] as String,
      diameter: fields[1] as String,
      population: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DBPlanetModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.diameter)
      ..writeByte(2)
      ..write(obj.population);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DBPlanetModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
