import 'package:core/core.dart';
import 'package:core/database/list_pejabat_pengawas_database.dart';
import 'package:core/models/get_list_user_references.dart';
import 'package:core/models/list_pejabat_pengawas_model.dart';
import 'package:flutter/material.dart';

class ReferenceList {
  // List ReferenceData
  List<ReferenceData> _getReferenceDataByName(String name) {
    try {
      return ReferenceDatabase.referenceModel.data!
              .firstWhere(
                (element) => element.referenceName == name,
                orElse: () =>
                    ReferenceDatum(referenceName: "", referenceData: []),
              )
              .referenceData ??
          [];
    } catch (e) {
      return [];
    }
  }

  List<ReferenceData> setJenisBank() {
    return _getReferenceDataByName("Jenis Bank");
  }

  List<ReferenceData> setCollectingAgent() {
    return _getReferenceDataByName("Jenis Penerima");
  }

  List<ReferenceData> setCollectingAgetByIdBank({required String idBank}) {
    List<ReferenceData> itemValue = _getReferenceDataByName("Jenis Penerima");
    return itemValue.where((e) => e.collectingAgentIdBank == idBank).toList();
  }

  List<ReferenceData> setJenisKendaraanV2() {
    return _getReferenceDataByName("Jenis Kendaraan");
  }

  List<ReferenceData> setItemKabKota() {
    return _getReferenceDataByName("Kabupaten Kota");
  }

  List<ReferenceData> setItemWiluppd() {
    return _getReferenceDataByName("Wil Induk");
  }

  List<ReferenceData> setItemWiluppdProses() {
    return _getReferenceDataByName("Wil Proses");
  }

  List<ReferenceData> setItemStatusKoreksi() {
    return _getReferenceDataByName("Status RC");
  }

  List<ReferenceData> setItemSelectableWiluppd() {
    return _getReferenceDataByName("Selectable Wilayah UPPD");
  }

  List<ReferenceData> setItemSelectableWiluppdByKdWil(String kdWilInduk) {
    List<ReferenceData> itemValue =
        _getReferenceDataByName("Selectable Wilayah UPPD");
    return itemValue.where((e) => e.wiluppdKdWilInduk == kdWilInduk).toList();
  }

  List<ReferenceData> setItemSelectableWilInduk() {
    return _getReferenceDataByName("Selectable Wilayah UPPPD Induk");
  }

  List<ReferenceData> setItemWiluppdProsesByKdWil(String kdWilInduk) {
    List<ReferenceData> itemValue = _getReferenceDataByName("Wil Proses");
    return itemValue.where((e) => e.wiluppdKdWilInduk == kdWilInduk).toList();
  }

  List<ReferenceData> setJenisKepemilikan() {
    return _getReferenceDataByName("Fungsi Kendaraan");
  }

  List<ReferenceData> setJenisLayanan() {
    return _getReferenceDataByName("Jenis Layanan");
  }

  List<ReferenceData> setItemBbm() {
    return _getReferenceDataByName("Jenis BBM");
  }

  List<ReferenceData> setKdJenis() {
    return _getReferenceDataByName("Jenis Kendaraan");
  }

  List<ReferenceData> setKdMohon() {
    return _getReferenceDataByName("Kode Mohon");
  }

  List<ReferenceData> setKdMohonAntrian() {
    return _getReferenceDataByName("Kode Mohon Antrian");
  }

  List<ReferenceData> setMetodePembayaran() {
    return _getReferenceDataByName("Metode Pembayaran");
  }

  List<ReferenceData> setKategoriSistemPembayaran() {
    return _getReferenceDataByName("Kategori Sistem Bayar");
  }

  List<ReferenceData> setJenisProgresif() {
    return _getReferenceDataByName("Jenis Progresif");
  }

  List<ReferenceData> setProteksi() {
    return _getReferenceDataByName("Jenis Proteksi");
  }

  List<ReferenceData> setBlockir() {
    return _getReferenceDataByName("Jenis Blokir");
  }

  List<ReferenceData> setJenisIdentitasV2() {
    return _getReferenceDataByName("Jenis Identitas");
  }

  List<YaTidakModel> setYaTidak() {
    return dataYaTidak;
  }

  List<ReferenceData> getKdWilFromKabKota({required kdKabKota}) {
    List<ReferenceData> itemValue = setItemWiluppd();
    return itemValue
        .where((item) =>
            StringUtils.trimString(kdKabKota) ==
            StringUtils.trimString(item.wiluppdIndukDefaultKdKabKota))
        .toList();
  }

  List<DataUserModelReference> setDataUserList(
    GetUserReferences? userReferences,
  ) {
    if (userReferences?.data == null) {
      // Jika data null, kembalikan List kosong
      return [];
    }

    // Menggunakan Set untuk menghapus duplikat, lalu dikonversi kembali ke List
    return userReferences!.data!.toSet().toList();
  }

  List<DataPejabatPengawas> setListPejabatPengawas() {
    try {
      // Filter the data based on your desired criteria (e.g., only those with non-null names and phone numbers)
      List<DataPejabatPengawas> filteredList = ListPejabatPengawasDatabase
          .resultListPejabatPengawas.data!
          .where((item) =>
              item.name != null &&
              item.noWa != null) // Adjust criteria as needed
          .toList();

      return filteredList;
    } catch (e) {
      return [];
    }
  }

  // List String
  List<String> getPageList(String? maxNumber) {
    List<String> numberList = [];

    if (maxNumber == null) {
      return [];
    } else if (maxNumber == "         ") {
      return [];
    } else if (maxNumber.contains("null")) {
      return [];
    } else {
      int? totalPage = int.tryParse((maxNumber)) ?? 0;
      for (int i = 1; i <= totalPage; i++) {
        numberList.add(i.toString());
      }
      return numberList;
    }
  }

  List<String> setJenisIdentitas() {
    List<String> itemValue = [];

    ReferenceDatabase.referenceModel.data?.forEach((element) {
      if (element.referenceName == "Jenis Identitas") {
        element.referenceData?.forEach((element) {
          itemValue.add(StringUtils.trimString(
                  element.jenisIdentitasJenisIdentitas) +
              " - " +
              StringUtils.trimString(element.jenisIdentitasNmJenisIdentitas));
        });
      }
    });

    return itemValue;
  }

  List<String> setJenisKendaraan() {
    List<String> itemValue = [];

    ReferenceDatabase.referenceModel.data?.forEach((element) {
      if (element.referenceName == "Jenis Kendaraan") {
        element.referenceData?.forEach((element) {
          itemValue.add(StringUtils.trimString(element.jeniskbKdJenisKb) +
              " - " +
              StringUtils.trimString(element.jeniskbNmJenisKb));
        });
      }
    });

    return itemValue;
  }

  // List Any
  List<TextEditingController> initializeControllers(int numberOfControllers) {
    List<TextEditingController> data = [];
    for (int i = 0; i < numberOfControllers; i++) {
      data.add(TextEditingController());
    }
    return data;
  }

  List<GlobalKey> initializeGlobalKey(int numberOfControllers) {
    List<GlobalKey> data = [];
    for (int i = 0; i < numberOfControllers; i++) {
      data.add(GlobalKey());
    }
    return data;
  }
}
