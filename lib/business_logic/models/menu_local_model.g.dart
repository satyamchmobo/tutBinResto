// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MenuLocalAdapter extends TypeAdapter<MenuLocal> {
  @override
  final int typeId = 1;

  @override
  MenuLocal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MenuLocal(
      listOfItemCategoryMaps: (fields[0] as List)
          .map((dynamic e) => (e as Map).map((dynamic k, dynamic v) =>
              MapEntry(k as String, (v as List).cast<ItemDetails>())))
          .toList(),
    );
  }

  @override
  void write(BinaryWriter writer, MenuLocal obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.listOfItemCategoryMaps);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MenuLocalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
