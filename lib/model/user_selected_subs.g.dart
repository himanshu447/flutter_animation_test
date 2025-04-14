// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_selected_subs.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserSelectedSubsAdapter extends TypeAdapter<UserSelectedSubs> {
  @override
  final int typeId = 1;

  @override
  UserSelectedSubs read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserSelectedSubs(
      name: fields[0] as String,
      userId: fields[1] as String,
      selectedSubscriptions: (fields[2] as List).cast<SubscriptionDm>(),
    );
  }

  @override
  void write(BinaryWriter writer, UserSelectedSubs obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.selectedSubscriptions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserSelectedSubsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
