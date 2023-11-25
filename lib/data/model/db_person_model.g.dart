// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_person_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DBPersonModelAdapter extends TypeAdapter<DBPersonModel> {
  @override
  final int typeId = 1;

  @override
  DBPersonModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DBPersonModel(
      name: fields[0] as String,
      gender: fields[1] as String,
      starshipsLink: (fields[2] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, DBPersonModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.gender)
      ..writeByte(2)
      ..write(obj.starshipsLink);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DBPersonModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
