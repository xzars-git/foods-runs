import 'package:core/core.dart';

class GetKdPosModel {
  String? code;
  bool? success;
  List<DataKdPos>? data;
  String? message;
  ParamGetKdPos? param;

  GetKdPosModel({this.code, this.success, this.data, this.message, this.param});

  GetKdPosModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    success = json['success'];
    if (json['data'] != null) {
      data = <DataKdPos>[];
      json['data'].forEach((v) {
        data!.add(DataKdPos.fromJson(v));
      });
    }
    message = json['message'];
    param =
        json['param'] != null ? ParamGetKdPos.fromJson(json['param']) : null;
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

class DataKdPos {
  String? kdPosKdPos;
  String? kdPosNmKelurahan;
  String? kdPosKdKecamatan;
  String? kdPosNmKecamatan;
  String? kdPosKdWil;
  String? kdPosNmWil;
  String? kdPosKeterangan;

  DataKdPos(
      {this.kdPosKdPos,
      this.kdPosNmKelurahan,
      this.kdPosKdKecamatan,
      this.kdPosNmKecamatan,
      this.kdPosKdWil,
      this.kdPosNmWil,
      this.kdPosKeterangan});

  DataKdPos.fromJson(Map<String, dynamic> json) {
    kdPosKdPos = json['kd_pos_kd_pos'];
    kdPosNmKelurahan = json['kd_pos_nm_kelurahan'];
    kdPosKdKecamatan = json['kd_pos_kd_kecamatan'];
    kdPosNmKecamatan = json['kd_pos_nm_kecamatan'];
    kdPosKdWil = json['kd_pos_kd_wil'];
    kdPosNmWil = json['kd_pos_nm_wil'];
    kdPosKeterangan = json['kd_pos_keterangan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kd_pos_kd_pos'] = kdPosKdPos;
    data['kd_pos_nm_kelurahan'] = kdPosNmKelurahan;
    data['kd_pos_kd_kecamatan'] = kdPosKdKecamatan;
    data['kd_pos_nm_kecamatan'] = kdPosNmKecamatan;
    data['kd_pos_kd_wil'] = kdPosKdWil;
    data['kd_pos_nm_wil'] = kdPosNmWil;
    data['kd_pos_keterangan'] = kdPosKeterangan;
    return data;
  }

  String kdPosAsString() {
    return "${StringUtils.trimString(kdPosKdPos)}${(kdPosKdPos == null) ? "" : " - "}${StringUtils.trimString(kdPosNmKelurahan)}${(kdPosNmKecamatan == null) ? "" : " - "}${StringUtils.trimString(kdPosNmKecamatan)}";
  }

  String kdKecamatanAsString() {
    return "${StringUtils.trimString(kdPosKdKecamatan)} - ${StringUtils.trimString(kdPosNmKecamatan)}";
  }

  String nmKelurahanAsString() {
    return "${StringUtils.trimString(kdPosNmKelurahan)}";
  }
}

class ParamGetKdPos {
  String? kdPosKdWil;

  ParamGetKdPos({this.kdPosKdWil});

  ParamGetKdPos.fromJson(Map<String, dynamic> json) {
    kdPosKdWil = json['kd_pos_kd_wil'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kd_pos_kd_wil'] = kdPosKdWil;
    return data;
  }
}

List<DataKdPos> removeDuplicateKecamatan(List<DataKdPos> dataList) {
  try {
    final seenKecamatan = <String>{};
    return dataList.where((item) {
      if (seenKecamatan.contains(item.kdPosKdKecamatan)) {
        return false;
      } else {
        seenKecamatan.add(item.kdPosKdKecamatan!);
        return true;
      }
    }).toList();
  } catch (e) {
    return <DataKdPos>[];
  }
}

List<DataKdPos> removeUnusedKecamatan(
    List<DataKdPos> dataList, String kdKecamatan) {
  try {
    final seenKecamatan = [];
    return dataList.where((item) {
      if (kdKecamatan == StringUtils.trimString(item.kdPosKdKecamatan)) {
        seenKecamatan.add(item);
        return true;
      } else {
        return false;
      }
    }).toList();
  } catch (e) {
    return <DataKdPos>[];
  }
}
