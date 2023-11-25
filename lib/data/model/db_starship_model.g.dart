// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_starship_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DBStarshipModelAdapter extends TypeAdapter<DBStarshipModel> {
  @override
  final int typeId = 3;

  @override
  DBStarshipModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DBStarshipModel(
      name: fields[0] as String,
      model: fields[1] as String,
      manufacturer: fields[2] as String,
      passengers: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DBStarshipModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.model)
      ..writeByte(2)
      ..write(obj.manufacturer)
      ..writeByte(3)
      ..write(obj.passengers);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DBStarshipModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
