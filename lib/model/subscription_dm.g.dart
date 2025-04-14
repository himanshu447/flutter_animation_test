// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_dm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubscriptionDmAdapter extends TypeAdapter<SubscriptionDm> {
  @override
  final int typeId = 2;

  @override
  SubscriptionDm read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubscriptionDm(
      name: fields[0] as String,
      subImage: fields[1] as String,
      type: fields[2] as String?,
      amount: fields[3] as double?,
      isSelected: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, SubscriptionDm obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.subImage)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.amount)
      ..writeByte(4)
      ..write(obj.isSelected);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubscriptionDmAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
