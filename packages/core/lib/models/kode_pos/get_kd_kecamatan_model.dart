class GetKdKecamatanModel {
  String? code;
  bool? success;
  List<DataKdKecamatan>? data;
  String? message;
  Param? param;

  GetKdKecamatanModel(
      {this.code, this.success, this.data, this.message, this.param});

  GetKdKecamatanModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    success = json['success'];
    if (json['data'] != null) {
      data = <DataKdKecamatan>[];
      json['data'].forEach((v) {
        data!.add(DataKdKecamatan.fromJson(v));
      });
    }
    message = json['message'];
    param = json['param'] != null ? Param.fromJson(json['param']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    if (param != null) {
      data['param'] = param!.toJson();
    }
    return data;
  }
}

class DataKdKecamatan {
  String? kdPosKdKecamatan;
  String? kdPosNmKecamatan;

  DataKdKecamatan({this.kdPosKdKecamatan, this.kdPosNmKecamatan});

  DataKdKecamatan.fromJson(Map<String, dynamic> json) {
    kdPosKdKecamatan = json['kd_pos_kd_kecamatan'];
    kdPosNmKecamatan = json['kd_pos_nm_kecamatan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kd_pos_kd_kecamatan'] = kdPosKdKecamatan;
    data['kd_pos_nm_kecamatan'] = kdPosNmKecamatan;
    return data;
  }
}

class Param {
  String? kdPosKdWil;

  Param({this.kdPosKdWil});

  Param.fromJson(Map<String, dynamic> json) {
    kdPosKdWil = json['kd_pos_kd_wil'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kd_pos_kd_wil'] = kdPosKdWil;
    return data;
  }
}
