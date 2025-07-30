import 'package:core/core.dart';

class GetUserReferences {
  String? code;
  bool? success;
  List<DataUserModelReference>? data;
  String? message;

  GetUserReferences({
    this.code,
    this.success,
    this.data,
    this.message,
  });

  GetUserReferences.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    success = json['success'];
    if (json['data'] != null) {
      data = <DataUserModelReference>[];
      json['data'].forEach((v) {
        data!.add(DataUserModelReference.fromJson(v));
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

class DataUserModelReference {
  String? id;
  String? name;
  String? email;
  String? username;
  String? emailVerifiedAt;
  String? password;
  String? userData;
  String? rememberToken;
  String? createdAt;
  String? updatedAt;
  String? idWiluppdKerja;
  String? kdWil;
  String? idJenisLayanan;
  String? idLoket;
  String? idTapping;
  String? noWa;
  String? bayarQris;
  String? bayarVa;
  String? bayarEdc;
  String? bayarTunai;
  String? idRole;
  String? layanan1;
  String? layanan2;
  String? layanan3;
  String? layanan4;
  String? layanan5;
  String? layanan6;
  String? layanan7;
  String? idEdc;

  DataUserModelReference(
      {this.id,
      this.name,
      this.email,
      this.username,
      this.emailVerifiedAt,
      this.password,
      this.userData,
      this.rememberToken,
      this.createdAt,
      this.updatedAt,
      this.idWiluppdKerja,
      this.kdWil,
      this.idJenisLayanan,
      this.idLoket,
      this.idTapping,
      this.noWa,
      this.bayarQris,
      this.bayarVa,
      this.bayarEdc,
      this.bayarTunai,
      this.idRole,
      this.layanan1,
      this.layanan2,
      this.layanan3,
      this.layanan4,
      this.layanan5,
      this.layanan6,
      this.layanan7,
      this.idEdc});

  DataUserModelReference.fromJson(Map<String, dynamic> json) {
    id = StringUtils.checkModel(json['id']);
    name = StringUtils.checkModel(json['name']);
    email = StringUtils.checkModel(json['email']);
    username = StringUtils.checkModel(json['username']);
    emailVerifiedAt = StringUtils.checkModel(json['email_verified_at']);
    password = StringUtils.checkModel(json['password']);
    userData = StringUtils.checkModel(json['user_data']);
    rememberToken = StringUtils.checkModel(json['remember_token']);
    createdAt = StringUtils.checkModel(json['created_at']);
    updatedAt = StringUtils.checkModel(json['updated_at']);
    idWiluppdKerja = StringUtils.checkModel(json['id_wiluppd_kerja']);
    kdWil = StringUtils.checkModel(json['kd_wil']);
    idJenisLayanan = StringUtils.checkModel(json['id_jenis_layanan']);
    idLoket = StringUtils.checkModel(json['id_loket']);
    idTapping = StringUtils.checkModel(json['id_tapping']);
    noWa = StringUtils.checkModel(json['no_wa']);
    bayarQris = StringUtils.checkModel(json['bayar_qris']);
    bayarVa = StringUtils.checkModel(json['bayar_va']);
    bayarEdc = StringUtils.checkModel(json['bayar_edc']);
    bayarTunai = StringUtils.checkModel(json['bayar_tunai']);
    idRole = StringUtils.checkModel(json['id_role']);
    layanan1 = StringUtils.checkModel(json['layanan1']);
    layanan2 = StringUtils.checkModel(json['layanan2']);
    layanan3 = StringUtils.checkModel(json['layanan3']);
    layanan4 = StringUtils.checkModel(json['layanan4']);
    layanan5 = StringUtils.checkModel(json['layanan5']);
    layanan6 = StringUtils.checkModel(json['layanan6']);
    layanan7 = StringUtils.checkModel(json['layanan7']);
    idEdc = StringUtils.checkModel(json['id_edc']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['username'] = username;
    data['email_verified_at'] = emailVerifiedAt;
    data['password'] = password;
    data['user_data'] = userData;
    data['remember_token'] = rememberToken;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['id_wiluppd_kerja'] = idWiluppdKerja;
    data['kd_wil'] = kdWil;
    data['id_jenis_layanan'] = idJenisLayanan;
    data['id_loket'] = idLoket;
    data['id_tapping'] = idTapping;
    data['no_wa'] = noWa;
    data['bayar_qris'] = bayarQris;
    data['bayar_va'] = bayarVa;
    data['bayar_edc'] = bayarEdc;
    data['bayar_tunai'] = bayarTunai;
    data['id_role'] = idRole;
    data['layanan1'] = layanan1;
    data['layanan2'] = layanan2;
    data['layanan3'] = layanan3;
    data['layanan4'] = layanan4;
    data['layanan5'] = layanan5;
    data['layanan6'] = layanan6;
    data['layanan7'] = layanan7;
    data['id_edc'] = idEdc;
    return data;
  }

  String getNamaAsString() {
    return "$id - $name";
  }
}
