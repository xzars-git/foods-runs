import 'package:core/core.dart';

class HitungUlangModel {
  String? code;
  bool? success;
  DataHitungUlang? data;
  String? message;
  ParamHitungUlang? param;

  HitungUlangModel(
      {this.code, this.success, this.data, this.message, this.param});

  HitungUlangModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    success = json['success'];
    data = json['data'] != null ? DataHitungUlang.fromJson(json['data']) : null;
    message = json['message'];
    param =
        json['param'] != null ? ParamHitungUlang.fromJson(json['param']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    if (param != null) {
      data['param'] = param!.toJson();
    }
    return data;
  }
}

class DataHitungUlang {
  String? beaBbnkb1Pok;
  String? beaBbnkb1Den;
  String? beaBbnkb1Ops;
  String? beaBbnkb1OpsDen;
  String? beaBbnkb2Pok;
  String? beaBbnkb2Den;
  String? beaBbnkb2Ops;
  String? beaBbnkb2OpsDen;
  String? beaPkbPok0;
  String? beaPkbDen0;
  String? beaPkbOps0;
  String? beaPkbOpsDen0;
  String? beaPkbPok1;
  String? beaPkbDen1;
  String? beaPkbOps1;
  String? beaPkbOpsDen1;
  String? beaPkbPok2;
  String? beaPkbDen2;
  String? beaPkbOps2;
  String? beaPkbOpsDen2;
  String? beaPkbPok3;
  String? beaPkbDen3;
  String? beaPkbOps3;
  String? beaPkbOpsDen3;
  String? beaPkbPok4;
  String? beaPkbDen4;
  String? beaPkbOps4;
  String? beaPkbOpsDen4;
  String? beaPkbPok5;
  String? beaPkbDen5;
  String? beaPkbOps5;
  String? beaPkbOpsDen5;
  String? beaBbnkb1PokP;
  String? beaBbnkb1DenP;
  String? beaBbnkb1OpsP;
  String? beaBbnkb1OpsDenP;
  String? beaBbnkb2PokP;
  String? beaBbnkb2DenP;
  String? beaBbnkb2OpsP;
  String? beaBbnkb2OpsDenP;
  String? beaPkbPok0P;
  String? beaPkbDen0P;
  String? beaPkbOps0P;
  String? beaPkbOpsDen0P;
  String? beaPkbPok1P;
  String? beaPkbDen1P;
  String? beaPkbOps1P;
  String? beaPkbOpsDen1P;
  String? beaPkbPok2P;
  String? beaPkbDen2P;
  String? beaPkbOps2P;
  String? beaPkbOpsDen2P;
  String? beaPkbPok3P;
  String? beaPkbDen3P;
  String? beaPkbOps3P;
  String? beaPkbOpsDen3P;
  String? beaPkbPok4P;
  String? beaPkbDen4P;
  String? beaPkbOps4P;
  String? beaPkbOpsDen4P;
  String? beaPkbPok5P;
  String? beaPkbDen5P;
  String? beaPkbOps5P;
  String? beaPkbOpsDen5P;
  String? beaSwdklljPok0;
  String? beaSwdklljDen0;
  String? beaSwdklljPok1;
  String? beaSwdklljDen1;
  String? beaSwdklljPok2;
  String? beaSwdklljDen2;
  String? beaSwdklljPok3;
  String? beaSwdklljDen3;
  String? beaSwdklljPok4;
  String? beaSwdklljDen4;
  String? beaSwdklljPok5;
  String? beaSwdklljDen5;
  String? nilaiJual;
  String? bobot;
  String? nilaiJualLama;
  String? bobotLama;
  String? beaAdmStnk;
  String? beaAdmTnkb;
  String? ket1;
  String? ket2;
  String? ket3;
  String? tgAkhirPajakBaru;
  String? tgAkhirStnkBaru;
  String? kodeGolJr;
  String? kodeJenisJr;
  String? jrRefId;
  String? selangHari;
  String? selangBulan;
  String? selangTahun;

  DataHitungUlang({
    this.beaBbnkb1Pok,
    this.beaBbnkb1Den,
    this.beaBbnkb1Ops,
    this.beaBbnkb1OpsDen,
    this.beaBbnkb2Pok,
    this.beaBbnkb2Den,
    this.beaBbnkb2Ops,
    this.beaBbnkb2OpsDen,
    this.beaPkbPok0,
    this.beaPkbDen0,
    this.beaPkbOps0,
    this.beaPkbOpsDen0,
    this.beaPkbPok1,
    this.beaPkbDen1,
    this.beaPkbOps1,
    this.beaPkbOpsDen1,
    this.beaPkbPok2,
    this.beaPkbDen2,
    this.beaPkbOps2,
    this.beaPkbOpsDen2,
    this.beaPkbPok3,
    this.beaPkbDen3,
    this.beaPkbOps3,
    this.beaPkbOpsDen3,
    this.beaPkbPok4,
    this.beaPkbDen4,
    this.beaPkbOps4,
    this.beaPkbOpsDen4,
    this.beaPkbPok5,
    this.beaPkbDen5,
    this.beaPkbOps5,
    this.beaPkbOpsDen5,
    this.beaBbnkb1PokP,
    this.beaBbnkb1DenP,
    this.beaBbnkb1OpsP,
    this.beaBbnkb1OpsDenP,
    this.beaBbnkb2PokP,
    this.beaBbnkb2DenP,
    this.beaBbnkb2OpsP,
    this.beaBbnkb2OpsDenP,
    this.beaPkbPok0P,
    this.beaPkbDen0P,
    this.beaPkbOps0P,
    this.beaPkbOpsDen0P,
    this.beaPkbPok1P,
    this.beaPkbDen1P,
    this.beaPkbOps1P,
    this.beaPkbOpsDen1P,
    this.beaPkbPok2P,
    this.beaPkbDen2P,
    this.beaPkbOps2P,
    this.beaPkbOpsDen2P,
    this.beaPkbPok3P,
    this.beaPkbDen3P,
    this.beaPkbOps3P,
    this.beaPkbOpsDen3P,
    this.beaPkbPok4P,
    this.beaPkbDen4P,
    this.beaPkbOps4P,
    this.beaPkbOpsDen4P,
    this.beaPkbPok5P,
    this.beaPkbDen5P,
    this.beaPkbOps5P,
    this.beaPkbOpsDen5P,
    this.beaSwdklljPok0,
    this.beaSwdklljDen0,
    this.beaSwdklljPok1,
    this.beaSwdklljDen1,
    this.beaSwdklljPok2,
    this.beaSwdklljDen2,
    this.beaSwdklljPok3,
    this.beaSwdklljDen3,
    this.beaSwdklljPok4,
    this.beaSwdklljDen4,
    this.beaSwdklljPok5,
    this.beaSwdklljDen5,
    this.nilaiJual,
    this.bobot,
    this.nilaiJualLama,
    this.bobotLama,
    this.beaAdmStnk,
    this.beaAdmTnkb,
    this.ket1,
    this.ket2,
    this.ket3,
    this.tgAkhirPajakBaru,
    this.tgAkhirStnkBaru,
    this.kodeGolJr,
    this.kodeJenisJr,
    this.jrRefId,
    this.selangHari,
    this.selangBulan,
    this.selangTahun,
  });

  DataHitungUlang.fromJson(Map<String, dynamic> json) {
    beaBbnkb1Pok = StringUtils.checkModel(json['bea_bbnkb1_pok']);
    beaBbnkb1Den = StringUtils.checkModel(json['bea_bbnkb1_den']);
    beaBbnkb1Ops = StringUtils.checkModel(json['bea_bbnkb1_ops']);
    beaBbnkb1OpsDen = StringUtils.checkModel(json['bea_bbnkb1_ops_den']);
    beaBbnkb2Pok = StringUtils.checkModel(json['bea_bbnkb2_pok']);
    beaBbnkb2Den = StringUtils.checkModel(json['bea_bbnkb2_den']);
    beaBbnkb2Ops = StringUtils.checkModel(json['bea_bbnkb2_ops']);
    beaBbnkb2OpsDen = StringUtils.checkModel(json['bea_bbnkb2_ops_den']);
    beaPkbPok0 = StringUtils.checkModel(json['bea_pkb_pok0']);
    beaPkbDen0 = StringUtils.checkModel(json['bea_pkb_den0']);
    beaPkbOps0 = StringUtils.checkModel(json['bea_pkb_ops0']);
    beaPkbOpsDen0 = StringUtils.checkModel(json['bea_pkb_ops_den0']);
    beaPkbPok1 = StringUtils.checkModel(json['bea_pkb_pok1']);
    beaPkbDen1 = StringUtils.checkModel(json['bea_pkb_den1']);
    beaPkbOps1 = StringUtils.checkModel(json['bea_pkb_ops1']);
    beaPkbOpsDen1 = StringUtils.checkModel(json['bea_pkb_ops_den1']);
    beaPkbPok2 = StringUtils.checkModel(json['bea_pkb_pok2']);
    beaPkbDen2 = StringUtils.checkModel(json['bea_pkb_den2']);
    beaPkbOps2 = StringUtils.checkModel(json['bea_pkb_ops2']);
    beaPkbOpsDen2 = StringUtils.checkModel(json['bea_pkb_ops_den2']);
    beaPkbPok3 = StringUtils.checkModel(json['bea_pkb_pok3']);
    beaPkbDen3 = StringUtils.checkModel(json['bea_pkb_den3']);
    beaPkbOps3 = StringUtils.checkModel(json['bea_pkb_ops3']);
    beaPkbOpsDen3 = StringUtils.checkModel(json['bea_pkb_ops_den3']);
    beaPkbPok4 = StringUtils.checkModel(json['bea_pkb_pok4']);
    beaPkbDen4 = StringUtils.checkModel(json['bea_pkb_den4']);
    beaPkbOps4 = StringUtils.checkModel(json['bea_pkb_ops4']);
    beaPkbOpsDen4 = StringUtils.checkModel(json['bea_pkb_ops_den4']);
    beaPkbPok5 = StringUtils.checkModel(json['bea_pkb_pok5']);
    beaPkbDen5 = StringUtils.checkModel(json['bea_pkb_den5']);
    beaPkbOps5 = StringUtils.checkModel(json['bea_pkb_ops5']);
    beaPkbOpsDen5 = StringUtils.checkModel(json['bea_pkb_ops_den5']);
    beaBbnkb1PokP = StringUtils.checkModel(json['bea_bbnkb1_pok_p']);
    beaBbnkb1DenP = StringUtils.checkModel(json['bea_bbnkb1_den_p']);
    beaBbnkb1OpsP = StringUtils.checkModel(json['bea_bbnkb1_ops_p']);
    beaBbnkb1OpsDenP = StringUtils.checkModel(json['bea_bbnkb1_ops_den_p']);
    beaBbnkb2PokP = StringUtils.checkModel(json['bea_bbnkb2_pok_p']);
    beaBbnkb2DenP = StringUtils.checkModel(json['bea_bbnkb2_den_p']);
    beaBbnkb2OpsP = StringUtils.checkModel(json['bea_bbnkb2_ops_p']);
    beaBbnkb2OpsDenP = StringUtils.checkModel(json['bea_bbnkb2_ops_den_p']);
    beaPkbPok0P = StringUtils.checkModel(json['bea_pkb_pok0_p']);
    beaPkbDen0P = StringUtils.checkModel(json['bea_pkb_den0_p']);
    beaPkbOps0P = StringUtils.checkModel(json['bea_pkb_ops0_p']);
    beaPkbOpsDen0P = StringUtils.checkModel(json['bea_pkb_ops_den0_p']);
    beaPkbPok1P = StringUtils.checkModel(json['bea_pkb_pok1_p']);
    beaPkbDen1P = StringUtils.checkModel(json['bea_pkb_den1_p']);
    beaPkbOps1P = StringUtils.checkModel(json['bea_pkb_ops1_p']);
    beaPkbOpsDen1P = StringUtils.checkModel(json['bea_pkb_ops_den1_p']);
    beaPkbPok2P = StringUtils.checkModel(json['bea_pkb_pok2_p']);
    beaPkbDen2P = StringUtils.checkModel(json['bea_pkb_den2_p']);
    beaPkbOps2P = StringUtils.checkModel(json['bea_pkb_ops2_p']);
    beaPkbOpsDen2P = StringUtils.checkModel(json['bea_pkb_ops_den2_p']);
    beaPkbPok3P = StringUtils.checkModel(json['bea_pkb_pok3_p']);
    beaPkbDen3P = StringUtils.checkModel(json['bea_pkb_den3_p']);
    beaPkbOps3P = StringUtils.checkModel(json['bea_pkb_ops3_p']);
    beaPkbOpsDen3P = StringUtils.checkModel(json['bea_pkb_ops_den3_p']);
    beaPkbPok4P = StringUtils.checkModel(json['bea_pkb_pok4_p']);
    beaPkbDen4P = StringUtils.checkModel(json['bea_pkb_den4_p']);
    beaPkbOps4P = StringUtils.checkModel(json['bea_pkb_ops4_p']);
    beaPkbOpsDen4P = StringUtils.checkModel(json['bea_pkb_ops_den4_p']);
    beaPkbPok5P = StringUtils.checkModel(json['bea_pkb_pok5_p']);
    beaPkbDen5P = StringUtils.checkModel(json['bea_pkb_den5_p']);
    beaPkbOps5P = StringUtils.checkModel(json['bea_pkb_ops5_p']);
    beaPkbOpsDen5P = StringUtils.checkModel(json['bea_pkb_ops_den5_p']);
    beaSwdklljPok0 = StringUtils.checkModel(json['bea_swdkllj_pok0']);
    beaSwdklljDen0 = StringUtils.checkModel(json['bea_swdkllj_den0']);
    beaSwdklljPok1 = StringUtils.checkModel(json['bea_swdkllj_pok1']);
    beaSwdklljDen1 = StringUtils.checkModel(json['bea_swdkllj_den1']);
    beaSwdklljPok2 = StringUtils.checkModel(json['bea_swdkllj_pok2']);
    beaSwdklljDen2 = StringUtils.checkModel(json['bea_swdkllj_den2']);
    beaSwdklljPok3 = StringUtils.checkModel(json['bea_swdkllj_pok3']);
    beaSwdklljDen3 = StringUtils.checkModel(json['bea_swdkllj_den3']);
    beaSwdklljPok4 = StringUtils.checkModel(json['bea_swdkllj_pok4']);
    beaSwdklljDen4 = StringUtils.checkModel(json['bea_swdkllj_den4']);
    beaSwdklljPok5 = StringUtils.checkModel(json['bea_swdkllj_pok5']);
    beaSwdklljDen5 = StringUtils.checkModel(json['bea_swdkllj_den5']);
    nilaiJual = StringUtils.checkModel(json['nilai_jual']);
    bobot = StringUtils.checkModel(json['bobot']);
    nilaiJualLama = StringUtils.checkModel(json['nilai_jual_lama']);
    bobotLama = StringUtils.checkModel(json['bobot_lama']);
    beaAdmStnk = StringUtils.checkModel(json['bea_adm_stnk']);
    beaAdmTnkb = StringUtils.checkModel(json['bea_adm_tnkb']);
    ket1 = StringUtils.checkModel(json['ket1']);
    ket2 = StringUtils.checkModel(json['ket2']);
    ket3 = StringUtils.checkModel(json['ket3']);
    tgAkhirPajakBaru = StringUtils.checkModel(json['tg_akhir_pajak_baru']);
    tgAkhirStnkBaru = StringUtils.checkModel(json['tg_akhir_stnk_baru']);
    kodeGolJr = StringUtils.checkModel(json['kode_gol_jr']);
    kodeJenisJr = StringUtils.checkModel(json['kode_jenis_jr']);
    jrRefId = StringUtils.checkModel(json['jr_ref_id']);
    selangHari = StringUtils.checkModel(json['selang_hari']);
    selangBulan = StringUtils.checkModel(json['selang_bulan']);
    selangTahun = StringUtils.checkModel(json['selang_tahun']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bea_bbnkb1_pok'] = beaBbnkb1Pok;
    data['bea_bbnkb1_den'] = beaBbnkb1Den;
    data['bea_bbnkb1_ops'] = beaBbnkb1Ops;
    data['bea_bbnkb1_ops_den'] = beaBbnkb1OpsDen;
    data['bea_bbnkb2_pok'] = beaBbnkb2Pok;
    data['bea_bbnkb2_den'] = beaBbnkb2Den;
    data['bea_bbnkb2_ops'] = beaBbnkb2Ops;
    data['bea_bbnkb2_ops_den'] = beaBbnkb2OpsDen;
    data['bea_pkb_pok0'] = beaPkbPok0;
    data['bea_pkb_den0'] = beaPkbDen0;
    data['bea_pkb_ops0'] = beaPkbOps0;
    data['bea_pkb_ops_den0'] = beaPkbOpsDen0;
    data['bea_pkb_pok1'] = beaPkbPok1;
    data['bea_pkb_den1'] = beaPkbDen1;
    data['bea_pkb_ops1'] = beaPkbOps1;
    data['bea_pkb_ops_den1'] = beaPkbOpsDen1;
    data['bea_pkb_pok2'] = beaPkbPok2;
    data['bea_pkb_den2'] = beaPkbDen2;
    data['bea_pkb_ops2'] = beaPkbOps2;
    data['bea_pkb_ops_den2'] = beaPkbOpsDen2;
    data['bea_pkb_pok3'] = beaPkbPok3;
    data['bea_pkb_den3'] = beaPkbDen3;
    data['bea_pkb_ops3'] = beaPkbOps3;
    data['bea_pkb_ops_den3'] = beaPkbOpsDen3;
    data['bea_pkb_pok4'] = beaPkbPok4;
    data['bea_pkb_den4'] = beaPkbDen4;
    data['bea_pkb_ops4'] = beaPkbOps4;
    data['bea_pkb_ops_den4'] = beaPkbOpsDen4;
    data['bea_pkb_pok5'] = beaPkbPok5;
    data['bea_pkb_den5'] = beaPkbDen5;
    data['bea_pkb_ops5'] = beaPkbOps5;
    data['bea_pkb_ops_den5'] = beaPkbOpsDen5;
    data['bea_bbnkb1_pok_p'] = beaBbnkb1PokP;
    data['bea_bbnkb1_den_p'] = beaBbnkb1DenP;
    data['bea_bbnkb1_ops_p'] = beaBbnkb1OpsP;
    data['bea_bbnkb1_ops_den_p'] = beaBbnkb1OpsDenP;
    data['bea_bbnkb2_pok_p'] = beaBbnkb2PokP;
    data['bea_bbnkb2_den_p'] = beaBbnkb2DenP;
    data['bea_bbnkb2_ops_p'] = beaBbnkb2OpsP;
    data['bea_bbnkb2_ops_den_p'] = beaBbnkb2OpsDenP;
    data['bea_pkb_pok0_p'] = beaPkbPok0P;
    data['bea_pkb_den0_p'] = beaPkbDen0P;
    data['bea_pkb_ops0_p'] = beaPkbOps0P;
    data['bea_pkb_ops_den0_p'] = beaPkbOpsDen0P;
    data['bea_pkb_pok1_p'] = beaPkbPok1P;
    data['bea_pkb_den1_p'] = beaPkbDen1P;
    data['bea_pkb_ops1_p'] = beaPkbOps1P;
    data['bea_pkb_ops_den1_p'] = beaPkbOpsDen1P;
    data['bea_pkb_pok2_p'] = beaPkbPok2P;
    data['bea_pkb_den2_p'] = beaPkbDen2P;
    data['bea_pkb_ops2_p'] = beaPkbOps2P;
    data['bea_pkb_ops_den2_p'] = beaPkbOpsDen2P;
    data['bea_pkb_pok3_p'] = beaPkbPok3P;
    data['bea_pkb_den3_p'] = beaPkbDen3P;
    data['bea_pkb_ops3_p'] = beaPkbOps3P;
    data['bea_pkb_ops_den3_p'] = beaPkbOpsDen3P;
    data['bea_pkb_pok4_p'] = beaPkbPok4P;
    data['bea_pkb_den4_p'] = beaPkbDen4P;
    data['bea_pkb_ops4_p'] = beaPkbOps4P;
    data['bea_pkb_ops_den4_p'] = beaPkbOpsDen4P;
    data['bea_pkb_pok5_p'] = beaPkbPok5P;
    data['bea_pkb_den5_p'] = beaPkbDen5P;
    data['bea_pkb_ops5_p'] = beaPkbOps5P;
    data['bea_pkb_ops_den5_p'] = beaPkbOpsDen5P;
    data['bea_swdkllj_pok0'] = beaSwdklljPok0;
    data['bea_swdkllj_den0'] = beaSwdklljDen0;
    data['bea_swdkllj_pok1'] = beaSwdklljPok1;
    data['bea_swdkllj_den1'] = beaSwdklljDen1;
    data['bea_swdkllj_pok2'] = beaSwdklljPok2;
    data['bea_swdkllj_den2'] = beaSwdklljDen2;
    data['bea_swdkllj_pok3'] = beaSwdklljPok3;
    data['bea_swdkllj_den3'] = beaSwdklljDen3;
    data['bea_swdkllj_pok4'] = beaSwdklljPok4;
    data['bea_swdkllj_den4'] = beaSwdklljDen4;
    data['bea_swdkllj_pok5'] = beaSwdklljPok5;
    data['bea_swdkllj_den5'] = beaSwdklljDen5;
    data['nilai_jual'] = nilaiJual;
    data['bobot'] = bobot;
    data['nilai_jual_lama'] = nilaiJualLama;
    data['bobot_lama'] = bobotLama;
    data['bea_adm_stnk'] = beaAdmStnk;
    data['bea_adm_tnkb'] = beaAdmTnkb;
    data['ket1'] = ket1;
    data['ket2'] = ket2;
    data['ket3'] = ket3;
    data['tg_akhir_pajak_baru'] = tgAkhirPajakBaru;
    data['tg_akhir_stnk_baru'] = tgAkhirStnkBaru;
    data['kode_gol_jr'] = kodeGolJr;
    data['kode_jenis_jr'] = kodeJenisJr;
    data['jr_ref_id'] = jrRefId;
    data['selang_hari'] = selangHari;
    data['selang_bulan'] = selangBulan;
    data['selang_tahun'] = selangTahun;
    return data;
  }

  DataHitungUlang copyWith({
    String? beaBbnkb1Pok,
    String? beaBbnkb1Den,
    String? beaBbnkb1Ops,
    String? beaBbnkb1OpsDen,
    String? beaBbnkb2Pok,
    String? beaBbnkb2Den,
    String? beaBbnkb2Ops,
    String? beaBbnkb2OpsDen,
    String? beaPkbPok0,
    String? beaPkbDen0,
    String? beaPkbOps0,
    String? beaPkbOpsDen0,
    String? beaPkbPok1,
    String? beaPkbDen1,
    String? beaPkbOps1,
    String? beaPkbOpsDen1,
    String? beaPkbPok2,
    String? beaPkbDen2,
    String? beaPkbOps2,
    String? beaPkbOpsDen2,
    String? beaPkbPok3,
    String? beaPkbDen3,
    String? beaPkbOps3,
    String? beaPkbOpsDen3,
    String? beaPkbPok4,
    String? beaPkbDen4,
    String? beaPkbOps4,
    String? beaPkbOpsDen4,
    String? beaPkbPok5,
    String? beaPkbDen5,
    String? beaPkbOps5,
    String? beaPkbOpsDen5,
    String? beaBbnkb1PokP,
    String? beaBbnkb1DenP,
    String? beaBbnkb1OpsP,
    String? beaBbnkb1OpsDenP,
    String? beaBbnkb2PokP,
    String? beaBbnkb2DenP,
    String? beaBbnkb2OpsP,
    String? beaBbnkb2OpsDenP,
    String? beaPkbPok0P,
    String? beaPkbDen0P,
    String? beaPkbOps0P,
    String? beaPkbOpsDen0P,
    String? beaPkbPok1P,
    String? beaPkbDen1P,
    String? beaPkbOps1P,
    String? beaPkbOpsDen1P,
    String? beaPkbPok2P,
    String? beaPkbDen2P,
    String? beaPkbOps2P,
    String? beaPkbOpsDen2P,
    String? beaPkbPok3P,
    String? beaPkbDen3P,
    String? beaPkbOps3P,
    String? beaPkbOpsDen3P,
    String? beaPkbPok4P,
    String? beaPkbDen4P,
    String? beaPkbOps4P,
    String? beaPkbOpsDen4P,
    String? beaPkbPok5P,
    String? beaPkbDen5P,
    String? beaPkbOps5P,
    String? beaPkbOpsDen5P,
    String? beaSwdklljPok0,
    String? beaSwdklljDen0,
    String? beaSwdklljPok1,
    String? beaSwdklljDen1,
    String? beaSwdklljPok2,
    String? beaSwdklljDen2,
    String? beaSwdklljPok3,
    String? beaSwdklljDen3,
    String? beaSwdklljPok4,
    String? beaSwdklljDen4,
    String? beaSwdklljPok5,
    String? beaSwdklljDen5,
    String? nilaiJual,
    String? bobot,
    String? nilaiJualLama,
    String? bobotLama,
    String? beaAdmStnk,
    String? beaAdmTnkb,
    String? ket1,
    String? ket2,
    String? ket3,
    String? tgAkhirPajakBaru,
    String? tgAkhirStnkBaru,
    String? kodeGolJr,
    String? kodeJenisJr,
    String? jrRefId,
    String? selangHari,
    String? selangBulan,
    String? selangTahun,
  }) =>
      DataHitungUlang(
        beaBbnkb1Pok: beaBbnkb1Pok ?? this.beaBbnkb1Pok,
        beaBbnkb1Den: beaBbnkb1Den ?? this.beaBbnkb1Den,
        beaBbnkb1Ops: beaBbnkb1Ops ?? this.beaBbnkb1Ops,
        beaBbnkb1OpsDen: beaBbnkb1OpsDen ?? this.beaBbnkb1OpsDen,
        beaBbnkb2Pok: beaBbnkb2Pok ?? this.beaBbnkb2Pok,
        beaBbnkb2Den: beaBbnkb2Den ?? this.beaBbnkb2Den,
        beaBbnkb2Ops: beaBbnkb2Ops ?? this.beaBbnkb2Ops,
        beaBbnkb2OpsDen: beaBbnkb2OpsDen ?? this.beaBbnkb2OpsDen,
        beaPkbPok0: beaPkbPok0 ?? this.beaPkbPok0,
        beaPkbDen0: beaPkbDen0 ?? this.beaPkbDen0,
        beaPkbOps0: beaPkbOps0 ?? this.beaPkbOps0,
        beaPkbOpsDen0: beaPkbOpsDen0 ?? this.beaPkbOpsDen0,
        beaPkbPok1: beaPkbPok1 ?? this.beaPkbPok1,
        beaPkbDen1: beaPkbDen1 ?? this.beaPkbDen1,
        beaPkbOps1: beaPkbOps1 ?? this.beaPkbOps1,
        beaPkbOpsDen1: beaPkbOpsDen1 ?? this.beaPkbOpsDen1,
        beaPkbPok2: beaPkbPok2 ?? this.beaPkbPok2,
        beaPkbDen2: beaPkbDen2 ?? this.beaPkbDen2,
        beaPkbOps2: beaPkbOps2 ?? this.beaPkbOps2,
        beaPkbOpsDen2: beaPkbOpsDen2 ?? this.beaPkbOpsDen2,
        beaPkbPok3: beaPkbPok3 ?? this.beaPkbPok3,
        beaPkbDen3: beaPkbDen3 ?? this.beaPkbDen3,
        beaPkbOps3: beaPkbOps3 ?? this.beaPkbOps3,
        beaPkbOpsDen3: beaPkbOpsDen3 ?? this.beaPkbOpsDen3,
        beaPkbPok4: beaPkbPok4 ?? this.beaPkbPok4,
        beaPkbDen4: beaPkbDen4 ?? this.beaPkbDen4,
        beaPkbOps4: beaPkbOps4 ?? this.beaPkbOps4,
        beaPkbOpsDen4: beaPkbOpsDen4 ?? this.beaPkbOpsDen4,
        beaPkbPok5: beaPkbPok5 ?? this.beaPkbPok5,
        beaPkbDen5: beaPkbDen5 ?? this.beaPkbDen5,
        beaPkbOps5: beaPkbOps5 ?? this.beaPkbOps5,
        beaPkbOpsDen5: beaPkbOpsDen5 ?? this.beaPkbOpsDen5,
        beaBbnkb1PokP: beaBbnkb1PokP ?? this.beaBbnkb1PokP,
        beaBbnkb1DenP: beaBbnkb1DenP ?? this.beaBbnkb1DenP,
        beaBbnkb1OpsP: beaBbnkb1OpsP ?? this.beaBbnkb1OpsP,
        beaBbnkb1OpsDenP: beaBbnkb1OpsDenP ?? this.beaBbnkb1OpsDenP,
        beaBbnkb2PokP: beaBbnkb2PokP ?? this.beaBbnkb2PokP,
        beaBbnkb2DenP: beaBbnkb2DenP ?? this.beaBbnkb2DenP,
        beaBbnkb2OpsP: beaBbnkb2OpsP ?? this.beaBbnkb2OpsP,
        beaBbnkb2OpsDenP: beaBbnkb2OpsDenP ?? this.beaBbnkb2OpsDenP,
        beaPkbPok0P: beaPkbPok0P ?? this.beaPkbPok0P,
        beaPkbDen0P: beaPkbDen0P ?? this.beaPkbDen0P,
        beaPkbOps0P: beaPkbOps0P ?? this.beaPkbOps0P,
        beaPkbOpsDen0P: beaPkbOpsDen0P ?? this.beaPkbOpsDen0P,
        beaPkbPok1P: beaPkbPok1P ?? this.beaPkbPok1P,
        beaPkbDen1P: beaPkbDen1P ?? this.beaPkbDen1P,
        beaPkbOps1P: beaPkbOps1P ?? this.beaPkbOps1P,
        beaPkbOpsDen1P: beaPkbOpsDen1P ?? this.beaPkbOpsDen1P,
        beaPkbPok2P: beaPkbPok2P ?? this.beaPkbPok2P,
        beaPkbDen2P: beaPkbDen2P ?? this.beaPkbDen2P,
        beaPkbOps2P: beaPkbOps2P ?? this.beaPkbOps2P,
        beaPkbOpsDen2P: beaPkbOpsDen2P ?? this.beaPkbOpsDen2P,
        beaPkbPok3P: beaPkbPok3P ?? this.beaPkbPok3P,
        beaPkbDen3P: beaPkbDen3P ?? this.beaPkbDen3P,
        beaPkbOps3P: beaPkbOps3P ?? this.beaPkbOps3P,
        beaPkbOpsDen3P: beaPkbOpsDen3P ?? this.beaPkbOpsDen3P,
        beaPkbPok4P: beaPkbPok4P ?? this.beaPkbPok4P,
        beaPkbDen4P: beaPkbDen4P ?? this.beaPkbDen4P,
        beaPkbOps4P: beaPkbOps4P ?? this.beaPkbOps4P,
        beaPkbOpsDen4P: beaPkbOpsDen4P ?? this.beaPkbOpsDen4P,
        beaPkbPok5P: beaPkbPok5P ?? this.beaPkbPok5P,
        beaPkbDen5P: beaPkbDen5P ?? this.beaPkbDen5P,
        beaPkbOps5P: beaPkbOps5P ?? this.beaPkbOps5P,
        beaPkbOpsDen5P: beaPkbOpsDen5P ?? this.beaPkbOpsDen5P,
        beaSwdklljPok0: beaSwdklljPok0 ?? this.beaSwdklljPok0,
        beaSwdklljDen0: beaSwdklljDen0 ?? this.beaSwdklljDen0,
        beaSwdklljPok1: beaSwdklljPok1 ?? this.beaSwdklljPok1,
        beaSwdklljDen1: beaSwdklljDen1 ?? this.beaSwdklljDen1,
        beaSwdklljPok2: beaSwdklljPok2 ?? this.beaSwdklljPok2,
        beaSwdklljDen2: beaSwdklljDen2 ?? this.beaSwdklljDen2,
        beaSwdklljPok3: beaSwdklljPok3 ?? this.beaSwdklljPok3,
        beaSwdklljDen3: beaSwdklljDen3 ?? this.beaSwdklljDen3,
        beaSwdklljPok4: beaSwdklljPok4 ?? this.beaSwdklljPok4,
        beaSwdklljDen4: beaSwdklljDen4 ?? this.beaSwdklljDen4,
        beaSwdklljPok5: beaSwdklljPok5 ?? this.beaSwdklljPok5,
        beaSwdklljDen5: beaSwdklljDen5 ?? this.beaSwdklljDen5,
        nilaiJual: nilaiJual ?? this.nilaiJual,
        bobot: bobot ?? this.bobot,
        nilaiJualLama: nilaiJualLama ?? this.nilaiJualLama,
        bobotLama: bobotLama ?? this.bobotLama,
        beaAdmStnk: beaAdmStnk ?? this.beaAdmStnk,
        beaAdmTnkb: beaAdmTnkb ?? this.beaAdmTnkb,
        ket1: ket1 ?? this.ket1,
        ket2: ket2 ?? this.ket2,
        ket3: ket3 ?? this.ket3,
        tgAkhirPajakBaru: tgAkhirPajakBaru ?? this.tgAkhirPajakBaru,
        tgAkhirStnkBaru: tgAkhirStnkBaru ?? this.tgAkhirStnkBaru,
        kodeGolJr: kodeGolJr ?? this.kodeGolJr,
        kodeJenisJr: kodeJenisJr ?? this.kodeJenisJr,
        jrRefId: jrRefId ?? this.jrRefId,
        selangHari: selangHari ?? this.selangHari,
        selangBulan: selangBulan ?? this.selangBulan,
        selangTahun: selangTahun ?? this.selangTahun,
      );
}

class ParamHitungUlang {
  String? noPolisi1;
  String? noPolisi2;
  String? noPolisi3;
  String? kdPlat;
  String? noPolisi1Lama;
  String? noPolisi2Lama;
  String? noPolisi3Lama;
  String? kdPlatLama;
  String? kdMohon1;
  String? kdMohon2;
  String? kdMohon3;
  String? kdMohon4;
  String? kdMohon5;
  String? kdMohon6;
  String? kdMerekKb;
  String? thBuatan;
  String? nilaiJual;
  String? bobot;
  String? kdMerekKbLama;
  String? thBuatanLama;
  String? nilaiJualLama;
  String? bobotLama;
  String? kdFungsi;
  String? kdJenis;
  String? milikKe;
  String? kdProteksi;
  String? isiSilinder;
  String? kdFungsiLama;
  String? kdJenisLama;
  String? milikKeLama;
  String? kdProteksiLama;
  String? isiSilinderLama;
  String? kdCetakStnk;
  String? kdCetakTnkb;
  String? bayarKedepan;
  String? tgProsesTetap;
  String? kdWil;
  String? tgAkhirPajak;
  String? tgAkhirStnk;
  String? tgKwitansi;
  String? tgFaktur;
  String? tgFiskal;
  String? tgUben;
  String? tgGntmesin;
  String? tgAkhirSwdkllj;
  String? idWilProses;
  String? kdBbm;
  String? kdBbmLama;
  String? tgProteksi;

  ParamHitungUlang({
    this.noPolisi1,
    this.noPolisi2,
    this.noPolisi3,
    this.kdPlat,
    this.noPolisi1Lama,
    this.noPolisi2Lama,
    this.noPolisi3Lama,
    this.kdPlatLama,
    this.kdMohon1,
    this.kdMohon2,
    this.kdMohon3,
    this.kdMohon4,
    this.kdMohon5,
    this.kdMohon6,
    this.kdMerekKb,
    this.thBuatan,
    this.nilaiJual,
    this.bobot,
    this.kdMerekKbLama,
    this.thBuatanLama,
    this.nilaiJualLama,
    this.bobotLama,
    this.kdFungsi,
    this.kdJenis,
    this.milikKe,
    this.kdProteksi,
    this.isiSilinder,
    this.kdFungsiLama,
    this.kdJenisLama,
    this.milikKeLama,
    this.kdProteksiLama,
    this.isiSilinderLama,
    this.kdCetakStnk,
    this.kdCetakTnkb,
    this.bayarKedepan,
    this.tgProsesTetap,
    this.kdWil,
    this.tgAkhirPajak,
    this.tgAkhirStnk,
    this.tgKwitansi,
    this.tgFaktur,
    this.tgFiskal,
    this.tgUben,
    this.tgGntmesin,
    this.tgAkhirSwdkllj,
    this.idWilProses,
    this.kdBbm,
    this.kdBbmLama,
    this.tgProteksi,
  });

  ParamHitungUlang.fromJson(Map<String, dynamic> json) {
    noPolisi1 = json['no_polisi1'];
    noPolisi2 = json['no_polisi2'];
    noPolisi3 = json['no_polisi3'];
    kdPlat = json['kd_plat'];
    noPolisi1Lama = json['no_polisi1_lama'];
    noPolisi2Lama = json['no_polisi2_lama'];
    noPolisi3Lama = json['no_polisi3_lama'];
    kdPlatLama = json['kd_plat_lama'];
    kdMohon1 = json['kd_mohon1'];
    kdMohon2 = json['kd_mohon2'];
    kdMohon3 = json['kd_mohon3'];
    kdMohon4 = json['kd_mohon4'];
    kdMohon5 = json['kd_mohon5'];
    kdMohon6 = json['kd_mohon6'];
    kdMerekKb = json['kd_merek_kb'];
    thBuatan = json['th_buatan'];
    nilaiJual = json['nilai_jual'];
    bobot = json['bobot'];
    kdMerekKbLama = json['kd_merek_kb_lama'];
    thBuatanLama = json['th_buatan_lama'];
    nilaiJualLama = json['nilai_jual_lama'];
    bobotLama = json['bobot_lama'];
    kdFungsi = json['kd_fungsi'];
    kdJenis = json['kd_jenis'];
    milikKe = json['milik_ke'];
    kdProteksi = json['kd_proteksi'];
    isiSilinder = json['isi_silinder'];
    kdFungsiLama = json['kd_fungsi_lama'];
    kdJenisLama = json['kd_jenis_lama'];
    milikKeLama = json['milik_ke_lama'];
    kdProteksiLama = json['kd_proteksi_lama'];
    isiSilinderLama = json['isi_silinder_lama'];
    kdCetakStnk = json['kd_cetak_stnk'];
    kdCetakTnkb = json['kd_cetak_tnkb'];
    bayarKedepan = json['bayar_kedepan'];
    tgProsesTetap = json['tg_proses_tetap'];
    kdWil = json['kd_wil'];
    tgAkhirPajak = json['tg_akhir_pajak'];
    tgAkhirStnk = json['tg_akhir_stnk'];
    tgKwitansi = json['tg_kwitansi'];
    tgFaktur = json['tg_faktur'];
    tgFiskal = json['tg_fiskal'];
    tgUben = json['tg_uben'];
    tgGntmesin = json['tg_gntmesin'];
    tgAkhirSwdkllj = json['tg_akhir_swdkllj'];
    idWilProses = json['id_wil_proses'];
    kdBbm = json['kd_bbm'];
    kdBbmLama = json['kd_bbm_lama'];
    tgProteksi = json['tg_proteksi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no_polisi1'] = noPolisi1;
    data['no_polisi2'] = noPolisi2;
    data['no_polisi3'] = noPolisi3;
    data['kd_plat'] = kdPlat;
    data['no_polisi1_lama'] = noPolisi1Lama;
    data['no_polisi2_lama'] = noPolisi2Lama;
    data['no_polisi3_lama'] = noPolisi3Lama;
    data['kd_plat_lama'] = kdPlatLama;
    data['kd_mohon1'] = kdMohon1;
    data['kd_mohon2'] = kdMohon2;
    data['kd_mohon3'] = kdMohon3;
    data['kd_mohon4'] = kdMohon4;
    data['kd_mohon5'] = kdMohon5;
    data['kd_mohon6'] = kdMohon6;
    data['kd_merek_kb'] = kdMerekKb;
    data['th_buatan'] = thBuatan;
    data['nilai_jual'] = nilaiJual;
    data['bobot'] = bobot;
    data['kd_merek_kb_lama'] = kdMerekKbLama;
    data['th_buatan_lama'] = thBuatanLama;
    data['nilai_jual_lama'] = nilaiJualLama;
    data['bobot_lama'] = bobotLama;
    data['kd_fungsi'] = kdFungsi;
    data['kd_jenis'] = kdJenis;
    data['milik_ke'] = milikKe;
    data['kd_proteksi'] = kdProteksi;
    data['isi_silinder'] = isiSilinder;
    data['kd_fungsi_lama'] = kdFungsiLama;
    data['kd_jenis_lama'] = kdJenisLama;
    data['milik_ke_lama'] = milikKeLama;
    data['kd_proteksi_lama'] = kdProteksiLama;
    data['isi_silinder_lama'] = isiSilinderLama;
    data['kd_cetak_stnk'] = kdCetakStnk;
    data['kd_cetak_tnkb'] = kdCetakTnkb;
    data['bayar_kedepan'] = bayarKedepan;
    data['tg_proses_tetap'] = tgProsesTetap;
    data['kd_wil'] = kdWil;
    data['tg_akhir_pajak'] = tgAkhirPajak;
    data['tg_akhir_stnk'] = tgAkhirStnk;
    data['tg_kwitansi'] = tgKwitansi;
    data['tg_faktur'] = tgFaktur;
    data['tg_fiskal'] = tgFiskal;
    data['tg_uben'] = tgUben;
    data['tg_gntmesin'] = tgGntmesin;
    data['tg_akhir_swdkllj'] = tgAkhirSwdkllj;
    data['id_wil_proses'] = idWilProses;
    data['kd_bbm'] = kdBbm;
    data['kd_bbm_lama'] = kdBbmLama;
    data['tg_proteksi'] = tgProteksi;
    return data;
  }
}
