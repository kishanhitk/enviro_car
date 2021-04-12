// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      name: fields[0] as String?,
      mail: fields[1] as String?,
      created: fields[2] as String?,
      modified: fields[3] as String?,
      acceptedPrivacyStatementVersion: fields[4] as String?,
      acceptedTermsOfUseVersion: fields[5] as String?,
      token: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.mail)
      ..writeByte(2)
      ..write(obj.created)
      ..writeByte(3)
      ..write(obj.modified)
      ..writeByte(4)
      ..write(obj.acceptedPrivacyStatementVersion)
      ..writeByte(5)
      ..write(obj.acceptedTermsOfUseVersion)
      ..writeByte(6)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
