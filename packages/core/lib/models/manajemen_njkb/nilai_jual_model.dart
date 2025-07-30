import 'package:core/utils/string_utils/string_utils.dart';

class NilaiJualModel {
  String? code;
  bool? success;
  List<DataNilaiJual>? data;
  String? message;

  NilaiJualModel({this.code, this.success, this.data, this.message});

  NilaiJualModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    success = json['success'];
    if (json['data'] != null) {
      data = <DataNilaiJual>[];
      json['data'].forEach((v) {
        data!.add(DataNilaiJual.fromJson(v));
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

class DataNilaiJual {
  String? nljualKdMerekKb;
  String? nljualThBuatan;
  String? nljualNilaiJual;
  String? nljualBobot;
  String? nljualPkbDasar;

  DataNilaiJual(
      {this.nljualKdMerekKb,
      this.nljualThBuatan,
      this.nljualNilaiJual,
      this.nljualBobot,
      this.nljualPkbDasar});

  DataNilaiJual.fromJson(Map<String, dynamic> json) {
    nljualKdMerekKb = json['nljual_kd_merek_kb'];
    nljualThBuatan = StringUtils.checkModel(json['nljual_th_buatan']);
    nljualNilaiJual = json['nljual_nilai_jual'];
    nljualBobot = json['nljual_bobot'];
    nljualPkbDasar = json['nljual_pkb_dasar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nljual_kd_merek_kb'] = nljualKdMerekKb;
    data['nljual_th_buatan'] = nljualThBuatan;
    data['nljual_nilai_jual'] = nljualNilaiJual;
    data['nljual_bobot'] = nljualBobot;
    data['nljual_pkb_dasar'] = nljualPkbDasar;
    return data;
  }
}
