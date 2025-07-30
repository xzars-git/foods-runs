// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_pejabat_pengawas_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ListPejabatPengawasAdapter extends TypeAdapter<ListPejabatPengawas> {
  @override
  final int typeId = 39;

  @override
  ListPejabatPengawas read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ListPejabatPengawas(
      code: fields[0] as String?,
      success: fields[1] as bool?,
      data: (fields[2] as List?)?.cast<DataPejabatPengawas>(),
      message: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ListPejabatPengawas obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.success)
      ..writeByte(2)
      ..write(obj.data)
      ..writeByte(3)
      ..write(obj.message);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListPejabatPengawasAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DataPejabatPengawasAdapter extends TypeAdapter<DataPejabatPengawas> {
  @override
  final int typeId = 40;

  @override
  DataPejabatPengawas read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataPejabatPengawas(
      id: fields[0] as int?,
      name: fields[1] as String?,
      email: fields[2] as String?,
      username: fields[3] as String?,
      emailVerifiedAt: fields[4] as String?,
      password: fields[5] as String?,
      userData: fields[6] as String?,
      rememberToken: fields[7] as String?,
      createdAt: fields[8] as String?,
      updatedAt: fields[9] as String?,
      idWiluppdKerja: fields[10] as String?,
      kdWil: fields[11] as String?,
      idJenisLayanan: fields[12] as String?,
      idLoket: fields[13] as String?,
      idTapping: fields[14] as String?,
      noWa: fields[15] as String?,
      bayarQris: fields[16] as String?,
      bayarVa: fields[17] as String?,
      bayarEdc: fields[18] as String?,
      bayarTunai: fields[19] as String?,
      idRole: fields[20] as String?,
      layanan1: fields[21] as String?,
      layanan2: fields[22] as String?,
      layanan3: fields[23] as String?,
      layanan4: fields[24] as String?,
      layanan5: fields[25] as String?,
      layanan6: fields[26] as String?,
      layanan7: fields[27] as String?,
      idEdc: fields[28] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DataPejabatPengawas obj) {
    writer
      ..writeByte(29)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.username)
      ..writeByte(4)
      ..write(obj.emailVerifiedAt)
      ..writeByte(5)
      ..write(obj.password)
      ..writeByte(6)
      ..write(obj.userData)
      ..writeByte(7)
      ..write(obj.rememberToken)
      ..writeByte(8)
      ..write(obj.createdAt)
      ..writeByte(9)
      ..write(obj.updatedAt)
      ..writeByte(10)
      ..write(obj.idWiluppdKerja)
      ..writeByte(11)
      ..write(obj.kdWil)
      ..writeByte(12)
      ..write(obj.idJenisLayanan)
      ..writeByte(13)
      ..write(obj.idLoket)
      ..writeByte(14)
      ..write(obj.idTapping)
      ..writeByte(15)
      ..write(obj.noWa)
      ..writeByte(16)
      ..write(obj.bayarQris)
      ..writeByte(17)
      ..write(obj.bayarVa)
      ..writeByte(18)
      ..write(obj.bayarEdc)
      ..writeByte(19)
      ..write(obj.bayarTunai)
      ..writeByte(20)
      ..write(obj.idRole)
      ..writeByte(21)
      ..write(obj.layanan1)
      ..writeByte(22)
      ..write(obj.layanan2)
      ..writeByte(23)
      ..write(obj.layanan3)
      ..writeByte(24)
      ..write(obj.layanan4)
      ..writeByte(25)
      ..write(obj.layanan5)
      ..writeByte(26)
      ..write(obj.layanan6)
      ..writeByte(27)
      ..write(obj.layanan7)
      ..writeByte(28)
      ..write(obj.idEdc);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataPejabatPengawasAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
