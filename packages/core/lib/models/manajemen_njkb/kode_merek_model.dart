import 'package:core/utils/string_utils/string_utils.dart';

class KodeMerekModel {
  String? code;
  bool? success;
  List<DataKodeMerek>? data;
  String? message;

  KodeMerekModel({this.code, this.success, this.data, this.message});

  KodeMerekModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    success = json['success'];
    if (json['data'] != null) {
      data = <DataKodeMerek>[];
      json['data'].forEach((v) {
        data!.add(DataKodeMerek.fromJson(v));
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

class DataKodeMerek {
  String? merekkbKdMerekKb2;
  String? merekkbNmMerekKb;

  DataKodeMerek({this.merekkbKdMerekKb2, this.merekkbNmMerekKb});

  DataKodeMerek.fromJson(Map<String, dynamic> json) {
    merekkbKdMerekKb2 = json['merekkb_kd_merek_kb2'];
    merekkbNmMerekKb = json['merekkb_nm_merek_kb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['merekkb_kd_merek_kb2'] = merekkbKdMerekKb2;
    data['merekkb_nm_merek_kb'] = merekkbNmMerekKb;
    return data;
  }

  String dataKodeMerekAsString() {
    return "${StringUtils.trimString(merekkbKdMerekKb2)} - ${StringUtils.trimString(merekkbNmMerekKb)}";
  }
}
