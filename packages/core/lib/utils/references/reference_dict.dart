import 'package:core/core.dart';

class ReferenceDict {
  // Wilayah Induk
  String getNamaWilByKdWil(String? kdWiluppd) {
    List<ReferenceData> itemValue = References.list.setItemWiluppd();

    for (var i = 0; i < itemValue.length; i++) {
      if (StringUtils.trimString(kdWiluppd) ==
          StringUtils.trimString(itemValue[i].wiluppdIndukKdWil)) {
        return StringUtils.trimString(itemValue[i].wiluppdIndukNmWil);
      }
    }
    return "";
  }

  String getKdKabKotaByKdWil(String? kdWiluppd) {
    List<ReferenceData> itemValue = References.list.setItemWiluppd();

    for (var i = 0; i < itemValue.length; i++) {
      if (StringUtils.trimString(kdWiluppd) ==
          StringUtils.trimString(itemValue[i].wiluppdIndukKdWil)) {
        return StringUtils.trimString(itemValue[i].wiluppdIndukDefaultKdKabKota);
      }
    }
    return "";
  }

  // Wilayah Proses
  String getNamaWilProsesById(String? idWiluppdProses) {
    List<ReferenceData> itemValue = References.list.setItemWiluppdProses();

    for (var i = 0; i < itemValue.length; i++) {
      if (StringUtils.trimString(idWiluppdProses) ==
          StringUtils.trimString(itemValue[i].wiluppdIdWiluppd)) {
        return StringUtils.trimString(itemValue[i].wiluppdNmWil);
      }
    }
    return "";
  }

  String getNamaWilProsesByKdWil(String? kdWiluppd) {
    List<ReferenceData> itemValue = References.list.setItemWiluppdProses();

    for (var i = 0; i < itemValue.length; i++) {
      if (StringUtils.trimString(kdWiluppd) == StringUtils.trimString(itemValue[i].wiluppdKdWil)) {
        return StringUtils.trimString(itemValue[i].wiluppdNmWil);
      }
    }
    return "";
  }

  String getNamaHistory(String? historyType) {
    switch (historyType) {
      case "1":
        return "Proteksi Kendaraan";
      case "2":
        return "Buka Proteksi Kendaraan";
      default:
        return "-";
    }
  }

  String getSubKdWilById(String? idWiluppdProses) {
    List<ReferenceData> itemValue = References.list.setItemWiluppdProses();

    for (var i = 0; i < itemValue.length; i++) {
      if (StringUtils.trimString(idWiluppdProses) ==
          StringUtils.trimString(itemValue[i].wiluppdIdWiluppd)) {
        return StringUtils.trimString(itemValue[i].wiluppdSubKdWil);
      }
    }
    return "";
  }

  String getSubKdWilByKdWil(String? kdWil) {
    List<ReferenceData> itemValue = References.list.setItemWiluppdProses();

    for (var i = 0; i < itemValue.length; i++) {
      if (StringUtils.trimString(kdWil) ==
          StringUtils.trimString(
            itemValue[i].wiluppdKdWil,
          )) {
        return StringUtils.trimString(itemValue[i].wiluppdSubKdWil);
      }
    }
    return "";
  }

  String getKdWilProsesById(String? idWiluppdProses) {
    List<ReferenceData> itemValue = References.list.setItemWiluppdProses();

    for (var i = 0; i < itemValue.length; i++) {
      if (StringUtils.trimString(idWiluppdProses) ==
          StringUtils.trimString(itemValue[i].wiluppdIdWiluppd)) {
        return StringUtils.trimString(itemValue[i].wiluppdKdWil);
      }
    }
    return "";
  }

  String getKdWilSubKdWilById(String? idWiluppd) {
    List<ReferenceData> itemValue = References.list.setItemWiluppdProses();

    for (var i = 0; i < itemValue.length; i++) {
      if (StringUtils.trimString(idWiluppd) ==
          StringUtils.trimString(itemValue[i].wiluppdIdWiluppd)) {
        return StringUtils.trimString(itemValue[i].wiluppdKdWil) +
            " - " +
            StringUtils.trimString(itemValue[i].wiluppdSubKdWil);
      }
    }
    return "";
  }

  String getIdWilProsesByKd(String? kdWiluppdProses) {
    List<ReferenceData> itemValue = References.list.setItemWiluppdProses();

    for (var i = 0; i < itemValue.length; i++) {
      if (StringUtils.trimString(kdWiluppdProses) ==
          StringUtils.trimString(itemValue[i].wiluppdKdWil)) {
        return StringUtils.trimString(itemValue[i].wiluppdIdWiluppd);
      }
    }
    return "";
  }

  String getKdMohonByIndex(String mergedKdMohon, int index) {
    // Tentukan panjang masing-masing bagian kdMohon
    int segmentLength = mergedKdMohon.length ~/ 6; // Bagi dengan 6 bagian

    // Hitung posisi mulai dan akhir untuk setiap segmen
    int start = (index - 1) * segmentLength;
    int end = index * segmentLength;

    // Jika itu segmen terakhir, ambil sisa string
    if (index == 6) {
      end = mergedKdMohon.length;
    }

    // Ambil bagian yang sesuai
    return mergedKdMohon.substring(start, end).trim();
  }

  String getMilikKe({
    required String? milikKe,
    required String? kdBlockir,
    required String? kdFungsi,
  }) {
    try {
      String returnedMilikKe = StringUtils.trimString(kdBlockir).toString().isNotEmpty
          ? "P"
          : StringUtils.trimString(milikKe);
      if ((int.parse(StringUtils.trimString(milikKe ?? "0"))) >= 5) {
        returnedMilikKe = "5";
      }
      String returnedTarif = StringUtils.trimString(kdFungsi) == "11"
          ? getTarif(StringUtils.trimString(returnedMilikKe))
          : "NON-PROGRESIF";

      return "$returnedMilikKe : $returnedTarif";
    } catch (e) {
      return " - : -";
    }
  }

  String getTarif(String milikKe) {
    List<ReferenceData> itemValue = ReferenceDatabase.referenceModel.data!
            .firstWhere((element) => element.referenceName == "Tarif Progresif")
            .referenceData ??
        [];

    String tarif = "";

    for (var element in itemValue) {
      if (StringUtils.trimString(element.tarifProgresifMilikKe.toString()) ==
          StringUtils.trimString(milikKe)) {
        tarif = StringUtils.trimString(element.tarifProgresifTarif);
      }
    }
    return tarif;
  }

  String getNamaJenisIdentitas(String? jenisIdentitas) {
    List<String> itemValue = References.list.setJenisIdentitas();

    for (var i = 0; i < itemValue.length; i++) {
      if (StringUtils.trimString(jenisIdentitas) ==
          StringUtils.trimString(StringUtils.splitString(itemValue[i], true))) {
        return StringUtils.trimString(StringUtils.splitString(itemValue[i], false));
      }
    }
    return "";
  }

  String getNamaMohon(String? kdMohon) {
    List<ReferenceData> itemValue = References.list.setKdMohon();

    for (var i = 0; i < itemValue.length; i++) {
      if (StringUtils.trimString(kdMohon) == StringUtils.trimString(itemValue[i].kdMohonKdMohon)) {
        return StringUtils.trimString(itemValue[i].kdMohonNmMohon);
      }
    }
    return "";
  }

  String getNamaMohonAntrian(String? kdMohon) {
    List<ReferenceData> itemValue = References.list.setKdMohonAntrian();

    for (var i = 0; i < itemValue.length; i++) {
      if (StringUtils.trimString(kdMohon) == StringUtils.trimString(itemValue[i].kdMohonKdMohon)) {
        return StringUtils.trimString(itemValue[i].kdMohonNmMohon);
      }
    }
    return "";
  }

  String getNamaProteksi(String? kdProteksi) {
    List<ReferenceData> itemValue = References.list.setProteksi();

    for (var i = 0; i < itemValue.length; i++) {
      if (StringUtils.trimString(kdProteksi) ==
          StringUtils.trimString(itemValue[i].jenisProteksiKdProteksi)) {
        return StringUtils.trimString(itemValue[i].jenisProteksiNmProteksi);
      }
    }
    return "";
  }

  String getNamaBlockir(String? kdBlockir) {
    List<ReferenceData> itemValue = References.list.setBlockir();

    for (var i = 0; i < itemValue.length; i++) {
      if (StringUtils.trimString(kdBlockir) ==
          StringUtils.trimString(itemValue[i].jenisBlokirKdBlokir)) {
        return StringUtils.trimString(itemValue[i].jenisBlokirNmBlokir);
      }
    }
    return "";
  }

  String getKdKohir(String? kdMohon) {
    List<ReferenceData> itemValue = References.list.setKdMohon();

    for (var i = 0; i < itemValue.length; i++) {
      if (StringUtils.trimString(kdMohon) == StringUtils.trimString(itemValue[i].kdMohonKdMohon)) {
        return StringUtils.trimString(itemValue[i].kdMohonKdKohir);
      }
    }
    return "";
  }

  String getNamaKabKota(String? kdKabKota) {
    List<ReferenceData> itemValue = References.list.setItemKabKota();

    for (var i = 0; i < itemValue.length; i++) {
      if (StringUtils.trimString(kdKabKota) ==
          StringUtils.trimString(itemValue[i].kabKotaKdKabKota)) {
        return StringUtils.trimString(itemValue[i].kabKotaNmKabKota).toString().toUpperCase();
      }
    }
    return "";
  }

  String getNamaYaTidak(String? yt) {
    for (var i = 0; i < dataYaTidak.length; i++) {
      if (StringUtils.trimString(yt) == StringUtils.trimString(dataYaTidak[i].yt)) {
        return StringUtils.trimString(dataYaTidak[i].yaTidak);
      }
    }
    return "";
  }

  String getNamaKepemilikan(String? kdFungsi) {
    List<ReferenceData> itemValue = References.list.setJenisKepemilikan();
    for (var i = 0; i < itemValue.length; i++) {
      if (StringUtils.trimString(kdFungsi) ==
          StringUtils.trimString(itemValue[i].fungsikbKdFungsi)) {
        return StringUtils.trimString(itemValue[i].fungsikbNmFungsi);
      }
    }
    return "";
  }

  String getNamaBank({required String? idBank}) {
    List<ReferenceData> itemValue = References.list.setJenisBank();
    for (var i = 0; i < itemValue.length; i++) {
      if (StringUtils.trimString(idBank) == StringUtils.trimString(itemValue[i].idBank)) {
        return StringUtils.trimString(itemValue[i].namaBank);
      }
    }
    return "";
  }

  String getKodeBankByID({required String? idBank}) {
    List<ReferenceData> itemValue = References.list.setJenisBank();
    for (var i = 0; i < itemValue.length; i++) {
      if (StringUtils.trimString(idBank) == StringUtils.trimString(itemValue[i].idBank)) {
        return StringUtils.trimString(itemValue[i].kodeBank);
      }
    }
    return "";
  }

  String getNamaCollectingAgent({required String? idCollectingAgent}) {
    List<ReferenceData> itemValue = References.list.setCollectingAgent();

    for (var i = 0; i < itemValue.length; i++) {
      if (StringUtils.trimString(idCollectingAgent) ==
          StringUtils.trimString(itemValue[i].collectingAgentIdCollectingAgent)) {
        return StringUtils.trimString(itemValue[i].collectingAgentNamaCollectingAgent);
      }
    }
    return "";
  }

  String getKodePenerimaById({required String? idCollectingAgent}) {
    List<ReferenceData> itemValue = References.list.setCollectingAgent();
    for (var i = 0; i < itemValue.length; i++) {
      if (StringUtils.trimString(idCollectingAgent) ==
          StringUtils.trimString(itemValue[i].collectingAgentIdCollectingAgent)) {
        return StringUtils.trimString(itemValue[i].collectingAgentKodeCollectingAgent);
      }
    }
    return "";
  }

  String getNamaJenisProgresif(String? idProgresif) {
    List<ReferenceData> itemValue = References.list.setJenisProgresif();
    for (var i = 0; i < itemValue.length; i++) {
      if (StringUtils.trimString(idProgresif) ==
          StringUtils.trimString(itemValue[i].progresifIdProgresif)) {
        return StringUtils.trimString(itemValue[i].progresifNmProgresif);
      }
    }
    return "";
  }

  String getNamaMetodePembayaran(String? idMetodeBayar) {
    List<ReferenceData> itemValue = References.list.setMetodePembayaran();
    for (var i = 0; i < itemValue.length; i++) {
      if (StringUtils.trimString(idMetodeBayar) ==
          StringUtils.trimString(itemValue[i].idMetodePembayaran)) {
        return StringUtils.trimString(itemValue[i].namaMetodePembayaran);
      }
    }
    return "";
  }

  String getNamaSistemPembayaran(String? idKategoriSistem) {
    List<ReferenceData> itemValue = References.list.setKategoriSistemPembayaran();
    for (var i = 0; i < itemValue.length; i++) {
      if (StringUtils.trimString(idKategoriSistem) ==
          StringUtils.trimString(itemValue[i].idKategoriSistem)) {
        return StringUtils.trimString(itemValue[i].namaKategoriSistem);
      }
    }
    return "";
  }

  String getNamaBbm(String? kdBbm) {
    List<ReferenceData> itemValue = References.list.setItemBbm();
    for (var i = 0; i < itemValue.length; i++) {
      if (StringUtils.trimString(kdBbm) == StringUtils.trimString(itemValue[i].bbmKdBbm)) {
        return StringUtils.trimString(itemValue[i].bbmNmBbm);
      }
    }
    return "";
  }

  String getNamaKdJenis(String? kdJenis) {
    List<ReferenceData> itemValue = References.list.setKdJenis();
    for (var i = 0; i < itemValue.length; i++) {
      if (StringUtils.trimString(kdJenis) ==
          StringUtils.trimString(itemValue[i].jeniskbKdJenisKb)) {
        return StringUtils.trimString(itemValue[i].jeniskbNmJenisKb);
      }
    }
    return "";
  }

  String getNamaPos(String? kdPos, List<DataKdPos> dataKdPos) {
    for (var i = 0; i < dataKdPos.length; i++) {
      if (StringUtils.trimString(kdPos) == StringUtils.trimString(dataKdPos[i].kdPosKdPos)) {
        return StringUtils.trimString(dataKdPos[i].kdPosNmKelurahan);
      }
    }
    return "";
  }

  String getNamaKecamatan(String? kdKecamatan, List<DataKdPos> dataKdPos) {
    return StringUtils.trimString(
      dataKdPos
          .firstWhere(
            (item) =>
                StringUtils.trimString(kdKecamatan) ==
                StringUtils.trimString(item.kdPosKdKecamatan),
            orElse: () => DataKdPos(),
          )
          .kdPosNmKecamatan,
    );
  }

  String? getNmProteksi({required kdProteksi}) {
    ReferenceData item = ReferenceData();
    bool found = false;

    ReferenceDatabase.referenceModel.data?.forEach((element) {
      if (found) return;

      if (element.referenceName == "Jenis Proteksi") {
        element.referenceData?.forEach((el) {
          if (found) return;

          if (el.jenisProteksiKdProteksi == kdProteksi) {
            item = el;
            found = true; // Set found to true to indicate item has been located
            return;
          }
        });
      }
    });

    return item.jenisProteksiNmProteksi ?? "TERDAFTAR";
  }

  String getNmJenisLayanan({
    required String idJenisLayanan,
  }) {
    List<ReferenceData> itemValue = References.list.setJenisLayanan();

    for (var i = 0; i < itemValue.length; i++) {
      if (StringUtils.trimString(idJenisLayanan) ==
          StringUtils.trimString(itemValue[i].idJenisLayanan)) {
        return StringUtils.trimString(itemValue[i].namaJenisLayanan);
      }
    }
    return "";
  }

  String getIdProgresifKdJenisKb(String? kdJenisKb) {
    List<ReferenceData> itemValue = References.list.setKdJenis();
    for (var i = 0; i < itemValue.length; i++) {
      if (StringUtils.trimString(kdJenisKb) ==
          StringUtils.trimString(itemValue[i].jeniskbKdJenisKb)) {
        return StringUtils.trimString(itemValue[i].jeniskbIdProgresif);
      }
    }
    return "";
  }

  String getNmProgresifByKdJenisKb(String? kdJenisKb) {
    List<ReferenceData> itemValue = References.list.setKdJenis();
    for (var i = 0; i < itemValue.length; i++) {
      if (StringUtils.trimString(kdJenisKb) ==
          StringUtils.trimString(itemValue[i].jeniskbKdJenisKb)) {
        return getNamaJenisProgresif(StringUtils.trimString(itemValue[i].jeniskbIdProgresif));
      }
    }
    return "";
  }

  String getStatusPermintaanVerif(StatusPermintaan status) {
    switch (status) {
      case StatusPermintaan.diterima:
        return "1";
      case StatusPermintaan.ditolak:
        return "0";
    }
  }
}
