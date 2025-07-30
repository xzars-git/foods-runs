class PejabatLaporanModel {
  String? code;
  bool? success;
  List<DataPejabatLaporan>? data;
  String? message;

  PejabatLaporanModel({
    this.code,
    this.success,
    this.data,
    this.message,
  });

  PejabatLaporanModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    success = json['success'];
    if (json['data'] != null) {
      data = <DataPejabatLaporan>[];
      json['data'].forEach((v) {
        data!.add(DataPejabatLaporan.fromJson(v));
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

class DataPejabatLaporan {
  String? pejabatNmPejabat;
  String? jenisPejabatNmJenisPejabat;
  String? pejabatJudul1;
  String? pejabatJudul2;
  String? pejabatNipPejabat;
  String? jenisPejabatInstansiPejabat;

  DataPejabatLaporan(
      {this.pejabatNmPejabat,
      this.jenisPejabatNmJenisPejabat,
      this.pejabatJudul1,
      this.pejabatJudul2,
      this.pejabatNipPejabat,
      this.jenisPejabatInstansiPejabat});

  DataPejabatLaporan.fromJson(Map<String, dynamic> json) {
    pejabatNmPejabat = json['pejabat_nm_pejabat'];
    jenisPejabatNmJenisPejabat = json['jenis_pejabat_nm_jenis_pejabat'];
    pejabatJudul1 = json['pejabat_judul1'];
    pejabatJudul2 = json['pejabat_judul2'];
    pejabatNipPejabat = json['pejabat_nip_pejabat'];
    jenisPejabatInstansiPejabat = json['jenis_pejabat_instansi_pejabat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pejabat_nm_pejabat'] = pejabatNmPejabat;
    data['jenis_pejabat_nm_jenis_pejabat'] = jenisPejabatNmJenisPejabat;
    data['pejabat_judul1'] = pejabatJudul1;
    data['pejabat_judul2'] = pejabatJudul2;
    data['pejabat_nip_pejabat'] = pejabatNipPejabat;
    data['jenis_pejabat_instansi_pejabat'] = jenisPejabatInstansiPejabat;
    return data;
  }
}
