// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_activity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveActivityAdapter extends TypeAdapter<HiveActivity> {
  @override
  final int typeId = 0;

  @override
  HiveActivity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveActivity(
      title: fields[0] as String,
      maxValue: fields[1] as String,
      unit: fields[2] as String,
      svgPath: fields[3] as String,
      color: fields[4] as int,
      startDate: fields[5] as String,
      values: (fields[6] as Map).cast<String, String>(),
      min: fields[7] as String,
      max: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveActivity obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.maxValue)
      ..writeByte(2)
      ..write(obj.unit)
      ..writeByte(3)
      ..write(obj.svgPath)
      ..writeByte(4)
      ..write(obj.color)
      ..writeByte(5)
      ..write(obj.startDate)
      ..writeByte(6)
      ..write(obj.values)
      ..writeByte(7)
      ..write(obj.min)
      ..writeByte(8)
      ..write(obj.max);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveActivityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
