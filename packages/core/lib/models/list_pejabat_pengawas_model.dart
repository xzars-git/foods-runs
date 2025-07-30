import 'package:core/core.dart';

part 'list_pejabat_pengawas_model.g.dart';

@HiveType(typeId: 39)
class ListPejabatPengawas {
  @HiveField(0)
  String? code;
  @HiveField(1)
  bool? success;
  @HiveField(2)
  List<DataPejabatPengawas>? data;
  @HiveField(3)
  String? message;

  ListPejabatPengawas({
    this.code,
    this.success,
    this.data,
    this.message,
  });

  ListPejabatPengawas.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    success = json['success'];
    if (json['data'] != null) {
      data = <DataPejabatPengawas>[];
      json['data'].forEach((v) {
        data!.add(DataPejabatPengawas.fromJson(v));
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

@HiveType(typeId: 40)
class DataPejabatPengawas {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? email;

  @HiveField(3)
  String? username;

  @HiveField(4)
  String? emailVerifiedAt;

  @HiveField(5)
  String? password;

  @HiveField(6)
  String? userData;

  @HiveField(7)
  String? rememberToken;

  @HiveField(8)
  String? createdAt;

  @HiveField(9)
  String? updatedAt;

  @HiveField(10)
  String? idWiluppdKerja;

  @HiveField(11)
  String? kdWil;

  @HiveField(12)
  String? idJenisLayanan;

  @HiveField(13)
  String? idLoket;

  @HiveField(14)
  String? idTapping;

  @HiveField(15)
  String? noWa;

  @HiveField(16)
  String? bayarQris;

  @HiveField(17)
  String? bayarVa;

  @HiveField(18)
  String? bayarEdc;

  @HiveField(19)
  String? bayarTunai;

  @HiveField(20)
  String? idRole;

  @HiveField(21)
  String? layanan1;

  @HiveField(22)
  String? layanan2;

  @HiveField(23)
  String? layanan3;

  @HiveField(24)
  String? layanan4;

  @HiveField(25)
  String? layanan5;

  @HiveField(26)
  String? layanan6;

  @HiveField(27)
  String? layanan7;

  @HiveField(28)
  String? idEdc;

  DataPejabatPengawas(
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

  DataPejabatPengawas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    username = json['username'];
    emailVerifiedAt = json['email_verified_at'];
    password = json['password'];
    userData = json['user_data'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    idWiluppdKerja = json['id_wiluppd_kerja'];
    kdWil = json['kd_wil'];
    idJenisLayanan = json['id_jenis_layanan'];
    idLoket = json['id_loket'];
    idTapping = json['id_tapping'];
    noWa = json['no_wa'];
    bayarQris = json['bayar_qris'];
    bayarVa = json['bayar_va'];
    bayarEdc = json['bayar_edc'];
    bayarTunai = json['bayar_tunai'];
    idRole = json['id_role'];
    layanan1 = json['layanan1'];
    layanan2 = json['layanan2'];
    layanan3 = json['layanan3'];
    layanan4 = json['layanan4'];
    layanan5 = json['layanan5'];
    layanan6 = json['layanan6'];
    layanan7 = json['layanan7'];
    idEdc = json['id_edc'];
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

  String getNameAndPhoneNumber() {
    return "${StringUtils.trimString(name)} - ${StringUtils.trimString(noWa)}";
  }
}
