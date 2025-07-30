// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reference_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReferenceModelAdapter extends TypeAdapter<ReferenceModel> {
  @override
  final int typeId = 0;

  @override
  ReferenceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReferenceModel(
      code: fields[0] as String?,
      success: fields[1] as bool?,
      data: (fields[2] as List?)?.cast<ReferenceDatum>(),
      message: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ReferenceModel obj) {
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
      other is ReferenceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ReferenceDatumAdapter extends TypeAdapter<ReferenceDatum> {
  @override
  final int typeId = 1;

  @override
  ReferenceDatum read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReferenceDatum(
      referenceName: fields[0] as String?,
      referenceData: (fields[1] as List?)?.cast<ReferenceData>(),
    );
  }

  @override
  void write(BinaryWriter writer, ReferenceDatum obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.referenceName)
      ..writeByte(1)
      ..write(obj.referenceData);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReferenceDatumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ReferenceDataAdapter extends TypeAdapter<ReferenceData> {
  @override
  final int typeId = 2;

  @override
  ReferenceData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReferenceData(
      bbmKdBbm: fields[0] as String?,
      bbmNmBbm: fields[1] as String?,
      bbmPrsnBbm: fields[2] as String?,
      jeniskbKdJenisKb: fields[3] as String?,
      jeniskbNmJenisKb: fields[4] as String?,
      jeniskbIdProgresif: fields[5] as String?,
      jeniskbIdJeniskbPolri: fields[6] as String?,
      fungsikbKdFungsi: fields[7] as String?,
      fungsikbNmFungsi: fields[8] as String?,
      fungsikbTarif: fields[9] as String?,
      jenisIdentitasJenisIdentitas: fields[10] as String?,
      jenisIdentitasNmJenisIdentitas: fields[11] as String?,
      wiluppdIndukKdWil: fields[12] as String?,
      wiluppdIndukNmWil: fields[13] as String?,
      wiluppdIndukDefaultKdKabKota: fields[14] as String?,
      wiluppdIdWiluppd: fields[15] as String?,
      wiluppdKdWil: fields[16] as String?,
      wiluppdKdWil1: fields[17] as String?,
      wiluppdNmWil: fields[18] as String?,
      wiluppdAlUppd: fields[19] as String?,
      wiluppdKabKota: fields[20] as String?,
      wiluppdPropinsi: fields[21] as String?,
      wiluppdTelp: fields[22] as String?,
      wiluppdNmWilEri: fields[23] as String?,
      wiluppdKdKotaEri: fields[24] as String?,
      wiluppdKdSubmarkasEri: fields[25] as String?,
      wiluppdKdWilInduk: fields[26] as String?,
      wiluppdSubKdWil: fields[27] as String?,
      wiluppdKdWilLama: fields[28] as String?,
      wiluppdDefaultNoPolisi1: fields[29] as String?,
      wiluppdPoldaType: fields[30] as String?,
      wiluppdIsKasirAvail: fields[31] as String?,
      tarifProgresifMilikKe: fields[32] as String?,
      tarifProgresifTarif: fields[33] as String?,
      kabKotaIdKabKota: fields[34] as String?,
      kabKotaKdKabKota: fields[35] as String?,
      kabKotaNmKabKota: fields[36] as String?,
      kabKotaCreatedAt: fields[37] as String?,
      kabKotaUpdatedAt: fields[38] as String?,
      idMetodePembayaran: fields[39] as String?,
      namaMetodePembayaran: fields[40] as String?,
      createdAt: fields[41] as String?,
      updatedAt: fields[42] as String?,
      jeniskbPolriIdJeniskbPolri: fields[43] as String?,
      jeniskbPolriNmJeniskbPolri: fields[44] as String?,
      jeniskbPolriBeaAdmStnk: fields[45] as String?,
      jeniskbPolriBeaAdmTnkb: fields[46] as String?,
      kdMohonKdMohon: fields[47] as String?,
      kdMohonNmMohon: fields[48] as String?,
      kdMohonKdKohir: fields[49] as String?,
      kdMohonKdMohon1: fields[50] as String?,
      kdMohonKdMohon2: fields[51] as String?,
      kdMohonKdMohon3: fields[52] as String?,
      kdMohonKdMohon4: fields[53] as String?,
      kdMohonKdMohon5: fields[54] as String?,
      kdMohonKdMohon6: fields[55] as String?,
      idJenisLayanan: fields[56] as String?,
      namaJenisLayanan: fields[57] as String?,
      jenisBlokirKdBlokir: fields[58] as String?,
      jenisBlokirNmBlokir: fields[59] as String?,
      jenisProteksiKdProteksi: fields[60] as String?,
      jenisProteksiNmProteksi: fields[61] as String?,
      idKategoriSistem: fields[62] as String?,
      namaKategoriSistem: fields[63] as String?,
      progresifIdProgresif: fields[64] as String?,
      progresifNmProgresif: fields[65] as String?,
      jeniskbDefaultBobot: fields[66] as String?,
      jeniskbDefaultPembulatan: fields[67] as String?,
      fungsikbTarifProteksi: fields[68] as String?,
      wiluppdIndukDefaultNoRek: fields[69] as String?,
      wiluppdIndukNmKabKota: fields[70] as String?,
      wiluppdKdKabKota: fields[71] as String?,
      wiluppdJudulDip1: fields[72] as String?,
      wiluppdJudulDip2: fields[73] as String?,
      wiluppdJudulDip3: fields[74] as String?,
      wiluppdJudulDip4: fields[75] as String?,
      wiluppdJudulDip5: fields[76] as String?,
      wiluppdJudulDip6: fields[77] as String?,
      wiluppdJudulDip7: fields[78] as String?,
      wiluppdJudulDip8: fields[79] as String?,
      wiluppdJudulPol1: fields[80] as String?,
      wiluppdJudulPol2: fields[81] as String?,
      wiluppdJudulPol3: fields[82] as String?,
      wiluppdIsBlocked: fields[83] as String?,
      kodeBank: fields[86] as String?,
      namaBank: fields[87] as String?,
      statusAdmin: fields[84] as bool?,
      statusRc: fields[85] as bool?,
      idBank: fields[88] as String?,
      jeniskbNmTipeKb: fields[89] as String?,
      jeniskbIdJeniskbPermendagri: fields[90] as String?,
      fungsikbDiskonPkbPlat1: fields[91] as String?,
      fungsikbDiskonBbnkb1Plat1: fields[92] as String?,
      fungsikbDiskonPkbPlat2: fields[93] as String?,
      fungsikbDiskonBbnkb1Plat2: fields[94] as String?,
      fungsikbDiskonPkbPlat3: fields[95] as String?,
      fungsikbDiskonBbnkb1Plat3: fields[96] as String?,
      fungsikbDiskonPkbPlat1Blokir: fields[97] as String?,
      fungsikbDiskonPkbPlat2Blokir: fields[98] as String?,
      fungsikbDiskonPkbPlat3Blokir: fields[99] as String?,
      fungsikbIdFungsikbPermendagri: fields[100] as String?,
      fungsikbKdPlat: fields[101] as String?,
      wiluppdIndukIsSingleKabKota: fields[102] as String?,
      tarifProgresifDiskonPkb: fields[103] as String?,
      enableJabar: fields[104] as bool?,
      enableMetro: fields[105] as bool?,
      collectingAgentIdCollectingAgent: fields[106] as String?,
      collectingAgentKodeCollectingAgent: fields[107] as String?,
      collectingAgentNamaCollectingAgent: fields[108] as String?,
      collectingAgentIsEnable: fields[109] as bool?,
      collectingAgentIsEsamsat: fields[110] as bool?,
      collectingAgentIdBank: fields[111] as String?,
      collectingAgentCreatedAt: fields[112] as String?,
      collectingAgentUpdatedAt: fields[113] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ReferenceData obj) {
    writer
      ..writeByte(114)
      ..writeByte(0)
      ..write(obj.bbmKdBbm)
      ..writeByte(1)
      ..write(obj.bbmNmBbm)
      ..writeByte(2)
      ..write(obj.bbmPrsnBbm)
      ..writeByte(3)
      ..write(obj.jeniskbKdJenisKb)
      ..writeByte(4)
      ..write(obj.jeniskbNmJenisKb)
      ..writeByte(5)
      ..write(obj.jeniskbIdProgresif)
      ..writeByte(6)
      ..write(obj.jeniskbIdJeniskbPolri)
      ..writeByte(7)
      ..write(obj.fungsikbKdFungsi)
      ..writeByte(8)
      ..write(obj.fungsikbNmFungsi)
      ..writeByte(9)
      ..write(obj.fungsikbTarif)
      ..writeByte(10)
      ..write(obj.jenisIdentitasJenisIdentitas)
      ..writeByte(11)
      ..write(obj.jenisIdentitasNmJenisIdentitas)
      ..writeByte(12)
      ..write(obj.wiluppdIndukKdWil)
      ..writeByte(13)
      ..write(obj.wiluppdIndukNmWil)
      ..writeByte(14)
      ..write(obj.wiluppdIndukDefaultKdKabKota)
      ..writeByte(15)
      ..write(obj.wiluppdIdWiluppd)
      ..writeByte(16)
      ..write(obj.wiluppdKdWil)
      ..writeByte(17)
      ..write(obj.wiluppdKdWil1)
      ..writeByte(18)
      ..write(obj.wiluppdNmWil)
      ..writeByte(19)
      ..write(obj.wiluppdAlUppd)
      ..writeByte(20)
      ..write(obj.wiluppdKabKota)
      ..writeByte(21)
      ..write(obj.wiluppdPropinsi)
      ..writeByte(22)
      ..write(obj.wiluppdTelp)
      ..writeByte(23)
      ..write(obj.wiluppdNmWilEri)
      ..writeByte(24)
      ..write(obj.wiluppdKdKotaEri)
      ..writeByte(25)
      ..write(obj.wiluppdKdSubmarkasEri)
      ..writeByte(26)
      ..write(obj.wiluppdKdWilInduk)
      ..writeByte(27)
      ..write(obj.wiluppdSubKdWil)
      ..writeByte(28)
      ..write(obj.wiluppdKdWilLama)
      ..writeByte(29)
      ..write(obj.wiluppdDefaultNoPolisi1)
      ..writeByte(30)
      ..write(obj.wiluppdPoldaType)
      ..writeByte(31)
      ..write(obj.wiluppdIsKasirAvail)
      ..writeByte(32)
      ..write(obj.tarifProgresifMilikKe)
      ..writeByte(33)
      ..write(obj.tarifProgresifTarif)
      ..writeByte(34)
      ..write(obj.kabKotaIdKabKota)
      ..writeByte(35)
      ..write(obj.kabKotaKdKabKota)
      ..writeByte(36)
      ..write(obj.kabKotaNmKabKota)
      ..writeByte(37)
      ..write(obj.kabKotaCreatedAt)
      ..writeByte(38)
      ..write(obj.kabKotaUpdatedAt)
      ..writeByte(39)
      ..write(obj.idMetodePembayaran)
      ..writeByte(40)
      ..write(obj.namaMetodePembayaran)
      ..writeByte(41)
      ..write(obj.createdAt)
      ..writeByte(42)
      ..write(obj.updatedAt)
      ..writeByte(43)
      ..write(obj.jeniskbPolriIdJeniskbPolri)
      ..writeByte(44)
      ..write(obj.jeniskbPolriNmJeniskbPolri)
      ..writeByte(45)
      ..write(obj.jeniskbPolriBeaAdmStnk)
      ..writeByte(46)
      ..write(obj.jeniskbPolriBeaAdmTnkb)
      ..writeByte(47)
      ..write(obj.kdMohonKdMohon)
      ..writeByte(48)
      ..write(obj.kdMohonNmMohon)
      ..writeByte(49)
      ..write(obj.kdMohonKdKohir)
      ..writeByte(50)
      ..write(obj.kdMohonKdMohon1)
      ..writeByte(51)
      ..write(obj.kdMohonKdMohon2)
      ..writeByte(52)
      ..write(obj.kdMohonKdMohon3)
      ..writeByte(53)
      ..write(obj.kdMohonKdMohon4)
      ..writeByte(54)
      ..write(obj.kdMohonKdMohon5)
      ..writeByte(55)
      ..write(obj.kdMohonKdMohon6)
      ..writeByte(56)
      ..write(obj.idJenisLayanan)
      ..writeByte(57)
      ..write(obj.namaJenisLayanan)
      ..writeByte(58)
      ..write(obj.jenisBlokirKdBlokir)
      ..writeByte(59)
      ..write(obj.jenisBlokirNmBlokir)
      ..writeByte(60)
      ..write(obj.jenisProteksiKdProteksi)
      ..writeByte(61)
      ..write(obj.jenisProteksiNmProteksi)
      ..writeByte(62)
      ..write(obj.idKategoriSistem)
      ..writeByte(63)
      ..write(obj.namaKategoriSistem)
      ..writeByte(64)
      ..write(obj.progresifIdProgresif)
      ..writeByte(65)
      ..write(obj.progresifNmProgresif)
      ..writeByte(66)
      ..write(obj.jeniskbDefaultBobot)
      ..writeByte(67)
      ..write(obj.jeniskbDefaultPembulatan)
      ..writeByte(68)
      ..write(obj.fungsikbTarifProteksi)
      ..writeByte(69)
      ..write(obj.wiluppdIndukDefaultNoRek)
      ..writeByte(70)
      ..write(obj.wiluppdIndukNmKabKota)
      ..writeByte(71)
      ..write(obj.wiluppdKdKabKota)
      ..writeByte(72)
      ..write(obj.wiluppdJudulDip1)
      ..writeByte(73)
      ..write(obj.wiluppdJudulDip2)
      ..writeByte(74)
      ..write(obj.wiluppdJudulDip3)
      ..writeByte(75)
      ..write(obj.wiluppdJudulDip4)
      ..writeByte(76)
      ..write(obj.wiluppdJudulDip5)
      ..writeByte(77)
      ..write(obj.wiluppdJudulDip6)
      ..writeByte(78)
      ..write(obj.wiluppdJudulDip7)
      ..writeByte(79)
      ..write(obj.wiluppdJudulDip8)
      ..writeByte(80)
      ..write(obj.wiluppdJudulPol1)
      ..writeByte(81)
      ..write(obj.wiluppdJudulPol2)
      ..writeByte(82)
      ..write(obj.wiluppdJudulPol3)
      ..writeByte(83)
      ..write(obj.wiluppdIsBlocked)
      ..writeByte(84)
      ..write(obj.statusAdmin)
      ..writeByte(85)
      ..write(obj.statusRc)
      ..writeByte(86)
      ..write(obj.kodeBank)
      ..writeByte(87)
      ..write(obj.namaBank)
      ..writeByte(88)
      ..write(obj.idBank)
      ..writeByte(89)
      ..write(obj.jeniskbNmTipeKb)
      ..writeByte(90)
      ..write(obj.jeniskbIdJeniskbPermendagri)
      ..writeByte(91)
      ..write(obj.fungsikbDiskonPkbPlat1)
      ..writeByte(92)
      ..write(obj.fungsikbDiskonBbnkb1Plat1)
      ..writeByte(93)
      ..write(obj.fungsikbDiskonPkbPlat2)
      ..writeByte(94)
      ..write(obj.fungsikbDiskonBbnkb1Plat2)
      ..writeByte(95)
      ..write(obj.fungsikbDiskonPkbPlat3)
      ..writeByte(96)
      ..write(obj.fungsikbDiskonBbnkb1Plat3)
      ..writeByte(97)
      ..write(obj.fungsikbDiskonPkbPlat1Blokir)
      ..writeByte(98)
      ..write(obj.fungsikbDiskonPkbPlat2Blokir)
      ..writeByte(99)
      ..write(obj.fungsikbDiskonPkbPlat3Blokir)
      ..writeByte(100)
      ..write(obj.fungsikbIdFungsikbPermendagri)
      ..writeByte(101)
      ..write(obj.fungsikbKdPlat)
      ..writeByte(102)
      ..write(obj.wiluppdIndukIsSingleKabKota)
      ..writeByte(103)
      ..write(obj.tarifProgresifDiskonPkb)
      ..writeByte(104)
      ..write(obj.enableJabar)
      ..writeByte(105)
      ..write(obj.enableMetro)
      ..writeByte(106)
      ..write(obj.collectingAgentIdCollectingAgent)
      ..writeByte(107)
      ..write(obj.collectingAgentKodeCollectingAgent)
      ..writeByte(108)
      ..write(obj.collectingAgentNamaCollectingAgent)
      ..writeByte(109)
      ..write(obj.collectingAgentIsEnable)
      ..writeByte(110)
      ..write(obj.collectingAgentIsEsamsat)
      ..writeByte(111)
      ..write(obj.collectingAgentIdBank)
      ..writeByte(112)
      ..write(obj.collectingAgentCreatedAt)
      ..writeByte(113)
      ..write(obj.collectingAgentUpdatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReferenceDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
