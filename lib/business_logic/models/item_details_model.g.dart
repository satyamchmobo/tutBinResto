// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_details_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemDetailsAdapter extends TypeAdapter<ItemDetails> {
  @override
  final int typeId = 0;

  @override
  ItemDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemDetails(
      name: fields[0] as String?,
      price: fields[1] as int?,
      instock: fields[2] as bool?,
      isBestseller: fields[3] as bool?,
      orderedCount: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, ItemDetails obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.instock)
      ..writeByte(3)
      ..write(obj.isBestseller)
      ..writeByte(4)
      ..write(obj.orderedCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
