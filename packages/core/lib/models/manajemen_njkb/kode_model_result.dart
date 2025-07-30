import 'package:core/core.dart';

class KodeModelResult {
  String? code;
  bool? success;
  List<DataKodeModel>? data;
  String? message;

  KodeModelResult({this.code, this.success, this.data, this.message});

  KodeModelResult.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    success = json['success'];
    if (json['data'] != null) {
      data = <DataKodeModel>[];
      json['data'].forEach((v) {
        data!.add(DataKodeModel.fromJson(v));
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

class DataKodeModel {
  String? merekkbKdMerekKb2;
  String? merekkbNmMerekKb;
  String? merekkbNmModelKb;

  DataKodeModel({this.merekkbKdMerekKb2, this.merekkbNmMerekKb, this.merekkbNmModelKb});

  DataKodeModel.fromJson(Map<String, dynamic> json) {
    merekkbKdMerekKb2 = json['merekkb_kd_merek_kb2'];
    merekkbNmMerekKb = json['merekkb_nm_merek_kb'];
    merekkbNmModelKb = json['merekkb_nm_model_kb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['merekkb_kd_merek_kb2'] = merekkbKdMerekKb2;
    data['merekkb_nm_merek_kb'] = merekkbNmMerekKb;
    data['merekkb_nm_model_kb'] = merekkbNmModelKb;
    return data;
  }

  String dataKodeModelAsString() {
    return "${StringUtils.trimString(merekkbKdMerekKb2)} - ${StringUtils.trimString(merekkbNmModelKb)}";
  }
}
