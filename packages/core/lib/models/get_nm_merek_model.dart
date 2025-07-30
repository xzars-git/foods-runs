class GetNmMerekModel {
  String? code;
  bool? success;
  DataGetNmMerekModel? data;
  String? message;
  ParamGetNmMerekModel? param;

  GetNmMerekModel({
    this.code,
    this.success,
    this.data,
    this.message,
    this.param,
  });

  GetNmMerekModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    success = json['success'];
    data = json['data'] != null ? DataGetNmMerekModel.fromJson(json['data']) : null;
    message = json['message'];
    param = json['param'] != null ? ParamGetNmMerekModel.fromJson(json['param']) : null;
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

class DataGetNmMerekModel {
  String? merekkbKdMerekKb;
  String? merekkbNmMerekKb;
  String? merekkbNmModelKb;
  String? merekkbKeterangan;

  DataGetNmMerekModel({
    this.merekkbKdMerekKb,
    this.merekkbNmMerekKb,
    this.merekkbNmModelKb,
    this.merekkbKeterangan,
  });

  DataGetNmMerekModel.fromJson(Map<String, dynamic> json) {
    merekkbKdMerekKb = json['merekkb_kd_merek_kb'];
    merekkbNmMerekKb = json['merekkb_nm_merek_kb'];
    merekkbNmModelKb = json['merekkb_nm_model_kb'];
    merekkbKeterangan = json['merekkb_keterangan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['merekkb_kd_merek_kb'] = merekkbKdMerekKb;
    data['merekkb_nm_merek_kb'] = merekkbNmMerekKb;
    data['merekkb_nm_model_kb'] = merekkbNmModelKb;
    data['merekkb_keterangan'] = merekkbKeterangan;
    return data;
  }
}

class ParamGetNmMerekModel {
  String? merekkbKdMerekKb;

  ParamGetNmMerekModel({this.merekkbKdMerekKb});

  ParamGetNmMerekModel.fromJson(Map<String, dynamic> json) {
    merekkbKdMerekKb = json['merekkb_kd_merek_kb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['merekkb_kd_merek_kb'] = merekkbKdMerekKb;
    return data;
  }
}
