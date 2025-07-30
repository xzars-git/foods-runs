import 'package:core/core.dart';

part 'reference_model.g.dart';

@HiveType(typeId: 0)
class ReferenceModel {
  @HiveField(0)
  String? code;

  @HiveField(1)
  bool? success;

  @HiveField(2)
  List<ReferenceDatum>? data;

  @HiveField(3)
  String? message;

  ReferenceModel({this.code, this.success, this.data, this.message});

  ReferenceModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    success = json['success'];
    if (json['data'] != null) {
      data = <ReferenceDatum>[];
      json['data'].forEach((v) {
        data!.add(ReferenceDatum.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

@HiveType(typeId: 1)
class ReferenceDatum {
  @HiveField(0)
  String? referenceName;

  @HiveField(1)
  List<ReferenceData>? referenceData;

  ReferenceDatum({this.referenceName, this.referenceData});

  ReferenceDatum.fromJson(Map<String, dynamic> json) {
    referenceName = json['reference_name'];
    if (json['reference_data'] != null) {
      referenceData = <ReferenceData>[];
      json['reference_data'].forEach((v) {
        referenceData!.add(ReferenceData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['reference_name'] = referenceName;
    if (referenceData != null) {
      data['reference_data'] = referenceData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@HiveType(typeId: 2)
class ReferenceData {
  @HiveField(0)
  String? bbmKdBbm;
  @HiveField(1)
  String? bbmNmBbm;
  @HiveField(2)
  String? bbmPrsnBbm;
  @HiveField(3)
  String? jeniskbKdJenisKb;
  @HiveField(4)
  String? jeniskbNmJenisKb;
  @HiveField(5)
  String? jeniskbIdProgresif;
  @HiveField(6)
  String? jeniskbIdJeniskbPolri;
  @HiveField(7)
  String? fungsikbKdFungsi;
  @HiveField(8)
  String? fungsikbNmFungsi;
  @HiveField(9)
  String? fungsikbTarif;
  @HiveField(10)
  String? jenisIdentitasJenisIdentitas;
  @HiveField(11)
  String? jenisIdentitasNmJenisIdentitas;
  @HiveField(12)
  String? wiluppdIndukKdWil;
  @HiveField(13)
  String? wiluppdIndukNmWil;
  @HiveField(14)
  String? wiluppdIndukDefaultKdKabKota;
  @HiveField(15)
  String? wiluppdIdWiluppd;
  @HiveField(16)
  String? wiluppdKdWil;
  @HiveField(17)
  String? wiluppdKdWil1;
  @HiveField(18)
  String? wiluppdNmWil;
  @HiveField(19)
  String? wiluppdAlUppd;
  @HiveField(20)
  String? wiluppdKabKota;
  @HiveField(21)
  String? wiluppdPropinsi;
  @HiveField(22)
  String? wiluppdTelp;
  @HiveField(23)
  String? wiluppdNmWilEri;
  @HiveField(24)
  String? wiluppdKdKotaEri;
  @HiveField(25)
  String? wiluppdKdSubmarkasEri;
  @HiveField(26)
  String? wiluppdKdWilInduk;
  @HiveField(27)
  String? wiluppdSubKdWil;
  @HiveField(28)
  String? wiluppdKdWilLama;
  @HiveField(29)
  String? wiluppdDefaultNoPolisi1;
  @HiveField(30)
  String? wiluppdPoldaType;
  @HiveField(31)
  String? wiluppdIsKasirAvail;
  @HiveField(32)
  String? tarifProgresifMilikKe;
  @HiveField(33)
  String? tarifProgresifTarif;
  @HiveField(34)
  String? kabKotaIdKabKota;
  @HiveField(35)
  String? kabKotaKdKabKota;
  @HiveField(36)
  String? kabKotaNmKabKota;
  @HiveField(37)
  String? kabKotaCreatedAt;
  @HiveField(38)
  String? kabKotaUpdatedAt;
  @HiveField(39)
  String? idMetodePembayaran;
  @HiveField(40)
  String? namaMetodePembayaran;
  @HiveField(41)
  String? createdAt;
  @HiveField(42)
  String? updatedAt;
  @HiveField(43)
  String? jeniskbPolriIdJeniskbPolri;
  @HiveField(44)
  String? jeniskbPolriNmJeniskbPolri;
  @HiveField(45)
  String? jeniskbPolriBeaAdmStnk;
  @HiveField(46)
  String? jeniskbPolriBeaAdmTnkb;
  @HiveField(47)
  String? kdMohonKdMohon;
  @HiveField(48)
  String? kdMohonNmMohon;
  @HiveField(49)
  String? kdMohonKdKohir;
  @HiveField(50)
  String? kdMohonKdMohon1;
  @HiveField(51)
  String? kdMohonKdMohon2;
  @HiveField(52)
  String? kdMohonKdMohon3;
  @HiveField(53)
  String? kdMohonKdMohon4;
  @HiveField(54)
  String? kdMohonKdMohon5;
  @HiveField(55)
  String? kdMohonKdMohon6;
  @HiveField(56)
  String? idJenisLayanan;
  @HiveField(57)
  String? namaJenisLayanan;
  @HiveField(58)
  String? jenisBlokirKdBlokir;
  @HiveField(59)
  String? jenisBlokirNmBlokir;
  @HiveField(60)
  String? jenisProteksiKdProteksi;
  @HiveField(61)
  String? jenisProteksiNmProteksi;
  @HiveField(62)
  String? idKategoriSistem;
  @HiveField(63)
  String? namaKategoriSistem;
  @HiveField(64)
  String? progresifIdProgresif;
  @HiveField(65)
  String? progresifNmProgresif;
  @HiveField(66)
  String? jeniskbDefaultBobot;
  @HiveField(67)
  String? jeniskbDefaultPembulatan;
  @HiveField(68)
  String? fungsikbTarifProteksi;
  @HiveField(69)
  String? wiluppdIndukDefaultNoRek;
  @HiveField(70)
  String? wiluppdIndukNmKabKota;
  @HiveField(71)
  String? wiluppdKdKabKota;
  @HiveField(72)
  String? wiluppdJudulDip1;
  @HiveField(73)
  String? wiluppdJudulDip2;
  @HiveField(74)
  String? wiluppdJudulDip3;
  @HiveField(75)
  String? wiluppdJudulDip4;
  @HiveField(76)
  String? wiluppdJudulDip5;
  @HiveField(77)
  String? wiluppdJudulDip6;
  @HiveField(78)
  String? wiluppdJudulDip7;
  @HiveField(79)
  String? wiluppdJudulDip8;
  @HiveField(80)
  String? wiluppdJudulPol1;
  @HiveField(81)
  String? wiluppdJudulPol2;
  @HiveField(82)
  String? wiluppdJudulPol3;
  @HiveField(83)
  String? wiluppdIsBlocked;
  @HiveField(84)
  bool? statusAdmin;
  @HiveField(85)
  bool? statusRc;
  @HiveField(86)
  String? kodeBank;
  @HiveField(87)
  String? namaBank;
  @HiveField(88)
  String? idBank;
  @HiveField(89)
  String? jeniskbNmTipeKb;
  @HiveField(90)
  String? jeniskbIdJeniskbPermendagri;
  @HiveField(91)
  String? fungsikbDiskonPkbPlat1;
  @HiveField(92)
  String? fungsikbDiskonBbnkb1Plat1;
  @HiveField(93)
  String? fungsikbDiskonPkbPlat2;
  @HiveField(94)
  String? fungsikbDiskonBbnkb1Plat2;
  @HiveField(95)
  String? fungsikbDiskonPkbPlat3;
  @HiveField(96)
  String? fungsikbDiskonBbnkb1Plat3;
  @HiveField(97)
  String? fungsikbDiskonPkbPlat1Blokir;
  @HiveField(98)
  String? fungsikbDiskonPkbPlat2Blokir;
  @HiveField(99)
  String? fungsikbDiskonPkbPlat3Blokir;
  @HiveField(100)
  String? fungsikbIdFungsikbPermendagri;
  @HiveField(101)
  String? fungsikbKdPlat;
  @HiveField(102)
  String? wiluppdIndukIsSingleKabKota;
  @HiveField(103)
  String? tarifProgresifDiskonPkb;
  @HiveField(104)
  bool? enableJabar;
  @HiveField(105)
  bool? enableMetro;
  @HiveField(106)
  String? collectingAgentIdCollectingAgent;
  @HiveField(107)
  String? collectingAgentKodeCollectingAgent;
  @HiveField(108)
  String? collectingAgentNamaCollectingAgent;
  @HiveField(109)
  bool? collectingAgentIsEnable;
  @HiveField(110)
  bool? collectingAgentIsEsamsat;
  @HiveField(111)
  String? collectingAgentIdBank;
  @HiveField(112)
  String? collectingAgentCreatedAt;
  @HiveField(113)
  String? collectingAgentUpdatedAt;

  ReferenceData({
    this.bbmKdBbm,
    this.bbmNmBbm,
    this.bbmPrsnBbm,
    this.jeniskbKdJenisKb,
    this.jeniskbNmJenisKb,
    this.jeniskbIdProgresif,
    this.jeniskbIdJeniskbPolri,
    this.fungsikbKdFungsi,
    this.fungsikbNmFungsi,
    this.fungsikbTarif,
    this.jenisIdentitasJenisIdentitas,
    this.jenisIdentitasNmJenisIdentitas,
    this.wiluppdIndukKdWil,
    this.wiluppdIndukNmWil,
    this.wiluppdIndukDefaultKdKabKota,
    this.wiluppdIdWiluppd,
    this.wiluppdKdWil,
    this.wiluppdKdWil1,
    this.wiluppdNmWil,
    this.wiluppdAlUppd,
    this.wiluppdKabKota,
    this.wiluppdPropinsi,
    this.wiluppdTelp,
    this.wiluppdNmWilEri,
    this.wiluppdKdKotaEri,
    this.wiluppdKdSubmarkasEri,
    this.wiluppdKdWilInduk,
    this.wiluppdSubKdWil,
    this.wiluppdKdWilLama,
    this.wiluppdDefaultNoPolisi1,
    this.wiluppdPoldaType,
    this.wiluppdIsKasirAvail,
    this.tarifProgresifMilikKe,
    this.tarifProgresifTarif,
    this.kabKotaIdKabKota,
    this.kabKotaKdKabKota,
    this.kabKotaNmKabKota,
    this.kabKotaCreatedAt,
    this.kabKotaUpdatedAt,
    this.idMetodePembayaran,
    this.namaMetodePembayaran,
    this.createdAt,
    this.updatedAt,
    this.jeniskbPolriIdJeniskbPolri,
    this.jeniskbPolriNmJeniskbPolri,
    this.jeniskbPolriBeaAdmStnk,
    this.jeniskbPolriBeaAdmTnkb,
    this.kdMohonKdMohon,
    this.kdMohonNmMohon,
    this.kdMohonKdKohir,
    this.kdMohonKdMohon1,
    this.kdMohonKdMohon2,
    this.kdMohonKdMohon3,
    this.kdMohonKdMohon4,
    this.kdMohonKdMohon5,
    this.kdMohonKdMohon6,
    this.idJenisLayanan,
    this.namaJenisLayanan,
    this.jenisBlokirKdBlokir,
    this.jenisBlokirNmBlokir,
    this.jenisProteksiKdProteksi,
    this.jenisProteksiNmProteksi,
    this.idKategoriSistem,
    this.namaKategoriSistem,
    this.progresifIdProgresif,
    this.progresifNmProgresif,
    this.jeniskbDefaultBobot,
    this.jeniskbDefaultPembulatan,
    this.fungsikbTarifProteksi,
    this.wiluppdIndukDefaultNoRek,
    this.wiluppdIndukNmKabKota,
    this.wiluppdKdKabKota,
    this.wiluppdJudulDip1,
    this.wiluppdJudulDip2,
    this.wiluppdJudulDip3,
    this.wiluppdJudulDip4,
    this.wiluppdJudulDip5,
    this.wiluppdJudulDip6,
    this.wiluppdJudulDip7,
    this.wiluppdJudulDip8,
    this.wiluppdJudulPol1,
    this.wiluppdJudulPol2,
    this.wiluppdJudulPol3,
    this.wiluppdIsBlocked,
    this.kodeBank,
    this.namaBank,
    this.statusAdmin,
    this.statusRc,
    this.idBank,
    this.jeniskbNmTipeKb,
    this.jeniskbIdJeniskbPermendagri,
    this.fungsikbDiskonPkbPlat1,
    this.fungsikbDiskonBbnkb1Plat1,
    this.fungsikbDiskonPkbPlat2,
    this.fungsikbDiskonBbnkb1Plat2,
    this.fungsikbDiskonPkbPlat3,
    this.fungsikbDiskonBbnkb1Plat3,
    this.fungsikbDiskonPkbPlat1Blokir,
    this.fungsikbDiskonPkbPlat2Blokir,
    this.fungsikbDiskonPkbPlat3Blokir,
    this.fungsikbIdFungsikbPermendagri,
    this.fungsikbKdPlat,
    this.wiluppdIndukIsSingleKabKota,
    this.tarifProgresifDiskonPkb,
    this.enableJabar,
    this.enableMetro,
    this.collectingAgentIdCollectingAgent,
    this.collectingAgentKodeCollectingAgent,
    this.collectingAgentNamaCollectingAgent,
    this.collectingAgentIsEnable,
    this.collectingAgentIsEsamsat,
    this.collectingAgentIdBank,
    this.collectingAgentCreatedAt,
    this.collectingAgentUpdatedAt,
  });

  ReferenceData.fromJson(Map<String, dynamic> json) {
    bbmKdBbm = StringUtils.checkModel(json['bbm_kd_bbm']);
    bbmNmBbm = StringUtils.checkModel(json['bbm_nm_bbm']);
    bbmPrsnBbm = StringUtils.checkModel(json['bbm_prsn_bbm']);
    jeniskbKdJenisKb = StringUtils.checkModel(json['jeniskb_kd_jenis_kb']);
    jeniskbNmJenisKb = StringUtils.checkModel(json['jeniskb_nm_jenis_kb']);
    jeniskbIdProgresif = StringUtils.checkModel(json['jeniskb_id_progresif']);
    jeniskbIdJeniskbPolri =
        StringUtils.checkModel(json['jeniskb_id_jeniskb_polri']);
    jeniskbIdJeniskbPolri =
        StringUtils.checkModel(json['jeniskb_id_jeniskb_polri']);
    fungsikbKdFungsi = StringUtils.checkModel(json['fungsikb_kd_fungsi']);
    fungsikbNmFungsi = StringUtils.checkModel(json['fungsikb_nm_fungsi']);
    fungsikbTarif = StringUtils.checkModel(json['fungsikb_tarif']);
    jenisIdentitasJenisIdentitas =
        StringUtils.checkModel(json['jenis_identitas_jenis_identitas']);
    jenisIdentitasJenisIdentitas =
        StringUtils.checkModel(json['jenis_identitas_jenis_identitas']);
    jenisIdentitasNmJenisIdentitas =
        StringUtils.checkModel(json['jenis_identitas_nm_jenis_identitas']);
    wiluppdIndukKdWil = StringUtils.checkModel(json['wiluppd_induk_kd_wil']);
    wiluppdIndukNmWil = StringUtils.checkModel(json['wiluppd_induk_nm_wil']);
    wiluppdIndukDefaultKdKabKota =
        StringUtils.checkModel(json['wiluppd_induk_default_kd_kab_kota']);
    wiluppdIdWiluppd = StringUtils.checkModel(json['wiluppd_id_wiluppd']);
    wiluppdKdWil = StringUtils.checkModel(json['wiluppd_kd_wil']);
    wiluppdKdWil1 = StringUtils.checkModel(json['wiluppd_kd_wil1']);
    wiluppdNmWil = StringUtils.checkModel(json['wiluppd_nm_wil']);
    wiluppdAlUppd = StringUtils.checkModel(json['wiluppd_al_uppd']);
    wiluppdKabKota = StringUtils.checkModel(json['wiluppd_kab_kota']);
    wiluppdPropinsi = StringUtils.checkModel(json['wiluppd_propinsi']);
    wiluppdTelp = StringUtils.checkModel(json['wiluppd_telp']);
    wiluppdNmWilEri = StringUtils.checkModel(json['wiluppd_nm_wil_eri']);
    wiluppdKdKotaEri = StringUtils.checkModel(json['wiluppd_kd_kota_eri']);
    wiluppdKdSubmarkasEri =
        StringUtils.checkModel(json['wiluppd_kd_submarkas_eri']);
    wiluppdKdSubmarkasEri =
        StringUtils.checkModel(json['wiluppd_kd_submarkas_eri']);
    wiluppdKdWilInduk = StringUtils.checkModel(json['wiluppd_kd_wil_induk']);
    wiluppdSubKdWil = StringUtils.checkModel(json['wiluppd_sub_kd_wil']);
    wiluppdKdWilLama = StringUtils.checkModel(json['wiluppd_kd_wil_lama']);
    wiluppdDefaultNoPolisi1 =
        StringUtils.checkModel(json['wiluppd_default_no_polisi1']);
    wiluppdPoldaType = StringUtils.checkModel(json['wiluppd_polda_type']);
    wiluppdIsKasirAvail =
        StringUtils.checkModel(json['wiluppd_is_kasir_avail']);
    tarifProgresifMilikKe =
        StringUtils.checkModel(json['tarif_progresif_milik_ke']);
    tarifProgresifTarif = StringUtils.checkModel(json['tarif_progresif_tarif']);
    kabKotaIdKabKota = StringUtils.checkModel(json['kab_kota_id_kab_kota']);
    kabKotaKdKabKota = StringUtils.checkModel(json['kab_kota_kd_kab_kota']);
    kabKotaNmKabKota = StringUtils.checkModel(json['kab_kota_nm_kab_kota']);
    kabKotaCreatedAt = StringUtils.checkModel(json['kab_kota_created_at']);
    kabKotaUpdatedAt = StringUtils.checkModel(json['kab_kota_updated_at']);
    idMetodePembayaran = StringUtils.checkModel(json['id_metode_pembayaran']);
    namaMetodePembayaran =
        StringUtils.checkModel(json['nama_metode_pembayaran']);
    createdAt = StringUtils.checkModel(json['created_at']);
    updatedAt = StringUtils.checkModel(json['updated_at']);
    jeniskbPolriIdJeniskbPolri =
        StringUtils.checkModel(json['jeniskb_polri_id_jeniskb_polri']);
    jeniskbPolriNmJeniskbPolri =
        StringUtils.checkModel(json['jeniskb_polri_nm_jeniskb_polri']);
    jeniskbPolriBeaAdmStnk =
        StringUtils.checkModel(json['jeniskb_polri_bea_adm_stnk']);
    jeniskbPolriBeaAdmTnkb =
        StringUtils.checkModel(json['jeniskb_polri_bea_adm_tnkb']);
    kdMohonKdMohon = StringUtils.checkModel(json['kd_mohon_kd_mohon']);
    kdMohonNmMohon = StringUtils.checkModel(json['kd_mohon_nm_mohon']);
    kdMohonKdKohir = StringUtils.checkModel(json['kd_mohon_kd_kohir']);
    kdMohonKdMohon1 = StringUtils.checkModel(json['kd_mohon_kd_mohon1']);
    kdMohonKdMohon2 = StringUtils.checkModel(json['kd_mohon_kd_mohon2']);
    kdMohonKdMohon3 = StringUtils.checkModel(json['kd_mohon_kd_mohon3']);
    kdMohonKdMohon4 = StringUtils.checkModel(json['kd_mohon_kd_mohon4']);
    kdMohonKdMohon5 = StringUtils.checkModel(json['kd_mohon_kd_mohon5']);
    kdMohonKdMohon6 = StringUtils.checkModel(json['kd_mohon_kd_mohon6']);
    idJenisLayanan = StringUtils.checkModel(json['id_jenis_layanan']);
    namaJenisLayanan = StringUtils.checkModel(json['nama_jenis_layanan']);
    jenisBlokirKdBlokir =
        StringUtils.checkModel(json['jenis_blokir_kd_blokir']);
    jenisBlokirNmBlokir =
        StringUtils.checkModel(json['jenis_blokir_nm_blokir']);
    jenisProteksiKdProteksi =
        StringUtils.checkModel(json['jenis_proteksi_kd_proteksi']);
    jenisProteksiNmProteksi =
        StringUtils.checkModel(json['jenis_proteksi_nm_proteksi']);
    idKategoriSistem = StringUtils.checkModel(json['id_kategori_sistem']);
    namaKategoriSistem = StringUtils.checkModel(json['nama_kategori_sistem']);
    progresifIdProgresif =
        StringUtils.checkModel(json['progresif_id_progresif']);
    progresifNmProgresif =
        StringUtils.checkModel(json['progresif_nm_progresif']);
    progresifIdProgresif =
        StringUtils.checkModel(json['progresif_id_progresif']);
    progresifNmProgresif =
        StringUtils.checkModel(json['progresif_nm_progresif']);
    jeniskbDefaultBobot = StringUtils.checkModel(json['jeniskb_default_bobot']);
    jeniskbDefaultPembulatan =
        StringUtils.checkModel(json['jeniskb_default_pembulatan']);
    fungsikbTarifProteksi =
        StringUtils.checkModel(json['fungsikb_tarif_proteksi']);
    wiluppdIndukDefaultNoRek =
        StringUtils.checkModel(json['wiluppd_induk_default_no_rek']);
    wiluppdIndukNmKabKota =
        StringUtils.checkModel(json['wiluppd_induk_nm_kab_kota']);
    wiluppdKdKabKota = StringUtils.checkModel(json['wiluppd_kd_kab_kota']);
    wiluppdJudulDip1 = StringUtils.checkModel(json['wiluppd_judul_dip1']);
    wiluppdJudulDip2 = StringUtils.checkModel(json['wiluppd_judul_dip2']);
    wiluppdJudulDip3 = StringUtils.checkModel(json['wiluppd_judul_dip3']);
    wiluppdJudulDip4 = StringUtils.checkModel(json['wiluppd_judul_dip4']);
    wiluppdJudulDip5 = StringUtils.checkModel(json['wiluppd_judul_dip5']);
    wiluppdJudulDip6 = StringUtils.checkModel(json['wiluppd_judul_dip6']);
    wiluppdJudulDip7 = StringUtils.checkModel(json['wiluppd_judul_dip7']);
    wiluppdJudulDip8 = StringUtils.checkModel(json['wiluppd_judul_dip8']);
    wiluppdJudulPol1 = StringUtils.checkModel(json['wiluppd_judul_pol1']);
    wiluppdJudulPol2 = StringUtils.checkModel(json['wiluppd_judul_pol2']);
    wiluppdJudulPol3 = StringUtils.checkModel(json['wiluppd_judul_pol3']);
    wiluppdIsBlocked = StringUtils.checkModel(json['wiluppd_is_blocked']);
    statusAdmin = StringUtils.checkModel(json['status_admin']);
    statusRc = StringUtils.checkModel(json['status_rc']);
    kodeBank = StringUtils.checkModel(json['kode_bank']);
    namaBank = StringUtils.checkModel(json['nama_bank']);
    idBank = StringUtils.checkModel(json['id_bank']);
    jeniskbNmTipeKb = StringUtils.checkModel(json['jeniskb_nm_tipe_kb']);
    jeniskbIdJeniskbPermendagri =
        StringUtils.checkModel(json['jeniskb_id_jeniskb_permendagri']);
    fungsikbDiskonPkbPlat1 =
        StringUtils.checkModel(json['fungsikb_diskon_pkb_plat1']);
    fungsikbDiskonBbnkb1Plat1 =
        StringUtils.checkModel(json['fungsikb_diskon_bbnkb1_plat1']);
    fungsikbDiskonPkbPlat2 =
        StringUtils.checkModel(json['fungsikb_diskon_pkb_plat2']);
    fungsikbDiskonBbnkb1Plat2 =
        StringUtils.checkModel(json['fungsikb_diskon_bbnkb1_plat2']);
    fungsikbDiskonPkbPlat3 =
        StringUtils.checkModel(json['fungsikb_diskon_pkb_plat3']);
    fungsikbDiskonBbnkb1Plat3 =
        StringUtils.checkModel(json['fungsikb_diskon_bbnkb1_plat3']);
    fungsikbDiskonPkbPlat1Blokir =
        StringUtils.checkModel(json['fungsikb_diskon_pkb_plat1_blokir']);
    fungsikbDiskonPkbPlat2Blokir =
        StringUtils.checkModel(json['fungsikb_diskon_pkb_plat2_blokir']);
    fungsikbDiskonPkbPlat3Blokir =
        StringUtils.checkModel(json['fungsikb_diskon_pkb_plat3_blokir']);
    fungsikbIdFungsikbPermendagri =
        StringUtils.checkModel(json['fungsikb_id_fungsikb_permendagri']);
    fungsikbKdPlat = StringUtils.checkModel(json['fungsikb_kd_plat']);
    wiluppdIndukIsSingleKabKota =
        StringUtils.checkModel(json['wiluppd_induk_is_single_kab_kota']);
    tarifProgresifDiskonPkb =
        StringUtils.checkModel(json['tarif_progresif_diskon_pkb']);
    enableJabar = StringUtils.checkModel(json['enable_jabar']);
    enableMetro = StringUtils.checkModel(json['enable_metro']);
    collectingAgentIdCollectingAgent =
        StringUtils.checkModel(json['collecting_agent_id_collecting_agent']);
    collectingAgentKodeCollectingAgent =
        StringUtils.checkModel(json['collecting_agent_kode_collecting_agent']);
    collectingAgentNamaCollectingAgent =
        StringUtils.checkModel(json['collecting_agent_nama_collecting_agent']);
    collectingAgentIsEnable =
        StringUtils.checkModel(json['collecting_agent_is_enable']);
    collectingAgentIsEsamsat =
        StringUtils.checkModel(json['collecting_agent_is_esamsat']);
    collectingAgentIdBank =
        StringUtils.checkModel(json['collecting_agent_id_bank']);
    collectingAgentCreatedAt =
        StringUtils.checkModel(json['collecting_agent_created_at']);
    collectingAgentUpdatedAt =
        StringUtils.checkModel(json['collecting_agent_updated_at']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bbm_kd_bbm'] = bbmKdBbm;
    data['bbm_nm_bbm'] = bbmNmBbm;
    data['bbm_prsn_bbm'] = bbmPrsnBbm;
    data['jeniskb_kd_jenis_kb'] = jeniskbKdJenisKb;
    data['jeniskb_nm_jenis_kb'] = jeniskbNmJenisKb;
    data['jeniskb_id_progresif'] = jeniskbIdProgresif;
    data['jeniskb_id_jeniskb_polri'] = jeniskbIdJeniskbPolri;
    data['fungsikb_kd_fungsi'] = fungsikbKdFungsi;
    data['fungsikb_nm_fungsi'] = fungsikbNmFungsi;
    data['fungsikb_tarif'] = fungsikbTarif;
    data['jenis_identitas_jenis_identitas'] = jenisIdentitasJenisIdentitas;
    data['jenis_identitas_nm_jenis_identitas'] = jenisIdentitasNmJenisIdentitas;
    data['wiluppd_induk_kd_wil'] = wiluppdIndukKdWil;
    data['wiluppd_induk_nm_wil'] = wiluppdIndukNmWil;
    data['wiluppd_induk_default_kd_kab_kota'] = wiluppdIndukDefaultKdKabKota;
    data['wiluppd_id_wiluppd'] = wiluppdIdWiluppd;
    data['wiluppd_kd_wil'] = wiluppdKdWil;
    data['wiluppd_kd_wil1'] = wiluppdKdWil1;
    data['wiluppd_nm_wil'] = wiluppdNmWil;
    data['wiluppd_al_uppd'] = wiluppdAlUppd;
    data['wiluppd_kab_kota'] = wiluppdKabKota;
    data['wiluppd_propinsi'] = wiluppdPropinsi;
    data['wiluppd_telp'] = wiluppdTelp;
    data['wiluppd_nm_wil_eri'] = wiluppdNmWilEri;
    data['wiluppd_kd_kota_eri'] = wiluppdKdKotaEri;
    data['wiluppd_kd_submarkas_eri'] = wiluppdKdSubmarkasEri;
    data['wiluppd_kd_wil_induk'] = wiluppdKdWilInduk;
    data['wiluppd_sub_kd_wil'] = wiluppdSubKdWil;
    data['wiluppd_kd_wil_lama'] = wiluppdKdWilLama;
    data['wiluppd_default_no_polisi1'] = wiluppdDefaultNoPolisi1;
    data['wiluppd_polda_type'] = wiluppdPoldaType;
    data['wiluppd_is_kasir_avail'] = wiluppdIsKasirAvail;
    data['tarif_progresif_milik_ke'] = tarifProgresifMilikKe;
    data['tarif_progresif_tarif'] = tarifProgresifTarif;
    data['kab_kota_id_kab_kota'] = kabKotaIdKabKota;
    data['kab_kota_kd_kab_kota'] = kabKotaKdKabKota;
    data['kab_kota_nm_kab_kota'] = kabKotaNmKabKota;
    data['kab_kota_created_at'] = kabKotaCreatedAt;
    data['kab_kota_updated_at'] = kabKotaUpdatedAt;
    data['id_metode_pembayaran'] = idMetodePembayaran;
    data['nama_metode_pembayaran'] = namaMetodePembayaran;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['jeniskb_polri_id_jeniskb_polri'] = jeniskbPolriIdJeniskbPolri;
    data['jeniskb_polri_nm_jeniskb_polri'] = jeniskbPolriNmJeniskbPolri;
    data['jeniskb_polri_bea_adm_stnk'] = jeniskbPolriBeaAdmStnk;
    data['jeniskb_polri_bea_adm_tnkb'] = jeniskbPolriBeaAdmTnkb;
    data['kd_mohon_kd_mohon'] = kdMohonKdMohon;
    data['kd_mohon_nm_mohon'] = kdMohonNmMohon;
    data['kd_mohon_kd_kohir'] = kdMohonKdKohir;
    data['kd_mohon_kd_mohon1'] = kdMohonKdMohon1;
    data['kd_mohon_kd_mohon2'] = kdMohonKdMohon2;
    data['kd_mohon_kd_mohon3'] = kdMohonKdMohon3;
    data['kd_mohon_kd_mohon4'] = kdMohonKdMohon4;
    data['kd_mohon_kd_mohon5'] = kdMohonKdMohon5;
    data['kd_mohon_kd_mohon6'] = kdMohonKdMohon6;
    data['id_jenis_layanan'] = idJenisLayanan;
    data['nama_jenis_layanan'] = namaJenisLayanan;
    data['jenis_blokir_kd_blokir'] = jenisBlokirKdBlokir;
    data['jenis_blokir_nm_blokir'] = jenisBlokirNmBlokir;
    data['jenis_proteksi_kd_proteksi'] = jenisProteksiKdProteksi;
    data['jenis_proteksi_nm_proteksi'] = jenisProteksiNmProteksi;
    data['id_kategori_sistem'] = idKategoriSistem;
    data['nama_kategori_sistem'] = namaKategoriSistem;
    data['progresif_id_progresif'] = progresifIdProgresif;
    data['progresif_nm_progresif'] = progresifNmProgresif;
    data['jeniskb_default_bobot'] = jeniskbDefaultBobot;
    data['jeniskb_default_pembulatan'] = jeniskbDefaultPembulatan;
    data['fungsikb_tarif_proteksi'] = fungsikbTarifProteksi;
    data['wiluppd_induk_default_no_rek'] = wiluppdIndukDefaultNoRek;
    data['wiluppd_induk_nm_kab_kota'] = wiluppdIndukNmKabKota;
    data['wiluppd_kd_kab_kota'] = wiluppdKdKabKota;
    data['wiluppd_judul_dip1'] = wiluppdJudulDip1;
    data['wiluppd_judul_dip2'] = wiluppdJudulDip2;
    data['wiluppd_judul_dip3'] = wiluppdJudulDip3;
    data['wiluppd_judul_dip4'] = wiluppdJudulDip4;
    data['wiluppd_judul_dip5'] = wiluppdJudulDip5;
    data['wiluppd_judul_dip6'] = wiluppdJudulDip6;
    data['wiluppd_judul_dip7'] = wiluppdJudulDip7;
    data['wiluppd_judul_dip8'] = wiluppdJudulDip8;
    data['wiluppd_judul_pol1'] = wiluppdJudulPol1;
    data['wiluppd_judul_pol2'] = wiluppdJudulPol2;
    data['wiluppd_judul_pol3'] = wiluppdJudulPol3;
    data['wiluppd_is_blocked'] = wiluppdIsBlocked;
    data['status_admin'] = statusAdmin;
    data['status_rc'] = statusRc;
    data['nama_bank'] = statusAdmin;
    data['kode_bank'] = statusRc;
    data['status_admin'] = statusAdmin;
    data['status_rc'] = statusRc;
    data['kode_bank'] = kodeBank;
    data['nama_bank'] = namaBank;
    data['id_bank'] = idBank;
    data['jeniskb_nm_tipe_kb'] = jeniskbNmTipeKb;
    data['jeniskb_id_jeniskb_permendagri'] = jeniskbIdJeniskbPermendagri;
    data['fungsikb_diskon_pkb_plat1'] = fungsikbDiskonPkbPlat1;
    data['fungsikb_diskon_bbnkb1_plat1'] = fungsikbDiskonBbnkb1Plat1;
    data['fungsikb_diskon_pkb_plat2'] = fungsikbDiskonPkbPlat2;
    data['fungsikb_diskon_bbnkb1_plat2'] = fungsikbDiskonBbnkb1Plat2;
    data['fungsikb_diskon_pkb_plat3'] = fungsikbDiskonPkbPlat3;
    data['fungsikb_diskon_bbnkb1_plat3'] = fungsikbDiskonBbnkb1Plat3;
    data['fungsikb_diskon_pkb_plat1_blokir'] = fungsikbDiskonPkbPlat1Blokir;
    data['fungsikb_diskon_pkb_plat2_blokir'] = fungsikbDiskonPkbPlat2Blokir;
    data['fungsikb_diskon_pkb_plat3_blokir'] = fungsikbDiskonPkbPlat3Blokir;
    data['fungsikb_id_fungsikb_permendagri'] = fungsikbIdFungsikbPermendagri;
    data['fungsikb_kd_plat'] = fungsikbKdPlat;
    data['wiluppd_induk_is_single_kab_kota'] = wiluppdIndukIsSingleKabKota;
    data['tarif_progresif_diskon_pkb'] = tarifProgresifDiskonPkb;
    data['enable_jabar'] = enableJabar;
    data['enable_metro'] = enableMetro;
    data['collecting_agent_id_collecting_agent'] =
        collectingAgentIdCollectingAgent;
    data['collecting_agent_kode_collecting_agent'] =
        collectingAgentKodeCollectingAgent;
    data['collecting_agent_nama_collecting_agent'] =
        collectingAgentNamaCollectingAgent;
    data['collecting_agent_is_enable'] = collectingAgentIsEnable;
    data['collecting_agent_is_esamsat'] = collectingAgentIsEsamsat;
    data['collecting_agent_id_bank'] = collectingAgentIdBank;
    data['collecting_agent_created_at'] = collectingAgentCreatedAt;
    data['collecting_agent_updated_at'] = collectingAgentUpdatedAt;
    return data;
  }

  String namaBankAsString() {
    return "${StringUtils.trimString(kodeBank)} - ${StringUtils.trimString(namaBank)}";
  }

  String namaCollectingAgentAsString() {
    return "${StringUtils.trimString(collectingAgentKodeCollectingAgent)} - ${StringUtils.trimString(collectingAgentNamaCollectingAgent)}";
  }

  String kabKotaAsString() {
    return "${StringUtils.trimString(kabKotaNmKabKota)}";
  }

  String wiluppdAsString() {
    return "${StringUtils.trimString(wiluppdIndukKdWil)}${wiluppdIndukKdWil == null ? "" : " - "}${StringUtils.trimString(wiluppdIndukNmWil)}";
  }

  String jenisKepemilikanAsString() {
    return "${StringUtils.trimString(fungsikbKdFungsi)} - ${StringUtils.trimString(fungsikbNmFungsi)}";
  }

  String bbmAsString() {
    return "${StringUtils.trimString(bbmKdBbm)} - ${StringUtils.trimString(bbmNmBbm)}";
  }

  String wiluppdProsesAsString() {
    return "${StringUtils.trimString(wiluppdKdWil)}${wiluppdKdWil == null ? "" : " - "}${StringUtils.trimString(wiluppdNmWil)}";
  }

  String wiluppdSubKdWilAsString() {
    return "${StringUtils.trimString(wiluppdKdWil)} - ${StringUtils.trimString(wiluppdSubKdWil)} - ${StringUtils.trimString(wiluppdNmWil)}";
  }

  String wiluppdProsesSubKdWilAsString() {
    return "${StringUtils.trimString(wiluppdKdWil)} - ${StringUtils.trimString(wiluppdNmWil)} - ${StringUtils.trimString(wiluppdSubKdWil)}";
  }

  String kdMohonAsString() {
    return "${StringUtils.trimString(kdMohonKdMohon)}${kdMohonKdMohon == null ? "" : " - "}${StringUtils.trimString(kdMohonNmMohon)}";
  }

  String metodePembayaranAsString() {
    return "${StringUtils.trimString(namaMetodePembayaran)}";
  }

  String kategoriSistemPembayaranAsString() {
    return "${StringUtils.trimString(namaKategoriSistem)}";
  }

  String kdProteksiAsString() {
    return "${StringUtils.trimString(jenisProteksiKdProteksi)} - ${StringUtils.trimString(jenisProteksiNmProteksi)}";
  }

  String kdBlockirAsString() {
    return "${StringUtils.trimString(jenisBlokirKdBlokir)} - ${StringUtils.trimString(jenisBlokirNmBlokir)}";
  }

  String jenisLayananAsString() {
    return "${StringUtils.trimString(namaJenisLayanan)}";
  }

  String jenisProgresifAsString() {
    return "${StringUtils.trimString(progresifIdProgresif)}${progresifIdProgresif == null ? "" : " - "}${StringUtils.trimString(progresifNmProgresif)}";
  }

  String jenisProteksiString() {
    return "${StringUtils.trimString(jenisProteksiNmProteksi)}";
  }

  String jenisKendaraanAsString() {
    return "${StringUtils.trimString(jeniskbKdJenisKb)} - ${StringUtils.trimString(jeniskbNmJenisKb)}";
  }
}
