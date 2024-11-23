// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CoinModelAdapter extends TypeAdapter<CoinModel> {
  @override
  final int typeId = 0;

  @override
  CoinModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CoinModel(
      id: fields[0] as String,
      title: fields[1] as String,
      country: fields[2] as String,
      years: fields[3] as String,
      coinType: fields[4] as String,
      shape: fields[5] as String,
      category: fields[6] as String,
      orientation: fields[7] as String,
      composition: fields[8] as String,
      obverse: fields[9] as String,
      reverse: fields[10] as String,
      minting: fields[11] as String,
      marketValue: fields[12] as String,
      rarity: fields[13] as String,
      size: fields[14] as String,
      picture: fields[15] as String,
      description: fields[16] as String?,
      weights: fields[17] as String?,
      diameters: fields[18] as String?,
      thickness: fields[19] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CoinModel obj) {
    writer
      ..writeByte(20)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.country)
      ..writeByte(3)
      ..write(obj.years)
      ..writeByte(4)
      ..write(obj.coinType)
      ..writeByte(5)
      ..write(obj.shape)
      ..writeByte(6)
      ..write(obj.category)
      ..writeByte(7)
      ..write(obj.orientation)
      ..writeByte(8)
      ..write(obj.composition)
      ..writeByte(9)
      ..write(obj.obverse)
      ..writeByte(10)
      ..write(obj.reverse)
      ..writeByte(11)
      ..write(obj.minting)
      ..writeByte(12)
      ..write(obj.marketValue)
      ..writeByte(13)
      ..write(obj.rarity)
      ..writeByte(14)
      ..write(obj.size)
      ..writeByte(15)
      ..write(obj.picture)
      ..writeByte(16)
      ..write(obj.description)
      ..writeByte(17)
      ..write(obj.weights)
      ..writeByte(18)
      ..write(obj.diameters)
      ..writeByte(19)
      ..write(obj.thickness);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoinModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
