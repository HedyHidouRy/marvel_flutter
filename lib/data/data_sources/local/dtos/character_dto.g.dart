// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CharacterDtoAdapter extends TypeAdapter<CharacterDto> {
  @override
  final int typeId = 0;

  @override
  CharacterDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CharacterDto(
      id: fields[0] as int?,
      name: fields[1] as String?,
      description: fields[2] as String?,
      thumbnail: fields[3] as String?,
      availaleComics: fields[4] as int?,
      availaleSeries: fields[5] as int?,
      availaleEvents: fields[6] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, CharacterDto obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.thumbnail)
      ..writeByte(4)
      ..write(obj.availaleComics)
      ..writeByte(5)
      ..write(obj.availaleSeries)
      ..writeByte(6)
      ..write(obj.availaleEvents);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CharacterDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
