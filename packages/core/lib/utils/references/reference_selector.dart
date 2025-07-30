import 'package:core/core.dart';
import 'package:core/models/get_list_user_references.dart';

class ReferenceSelector {
  ReferenceData? selectWilayahById(String? idWiluppd) {
    List<ReferenceData> items = References.list.setItemWiluppdProses();

    for (var i = 0; i < items.length; i++) {
      if (StringUtils.trimString(idWiluppd) ==
          StringUtils.trimString(items[i].wiluppdIdWiluppd)) {
        return items[i];
      }
    }
    return null;
  }

  ReferenceData selectWilayahByKdWil({required kdWil}) {
    List<ReferenceData> itemValue = References.list.setItemWiluppd();

    for (var i = 0; i < itemValue.length; i++) {
      if (StringUtils.trimString(kdWil) ==
          StringUtils.trimString(itemValue[i].wiluppdIndukKdWil)) {
        return itemValue[i];
      }
    }
    return ReferenceData();
  }

  ReferenceData? selectSelectableWilIndukByKdWil(String? kdWil) {
    List<ReferenceData> items = References.list.setItemSelectableWilInduk();

    for (var i = 0; i < items.length; i++) {
      if (StringUtils.trimString(kdWil) ==
          StringUtils.trimString(items[i].wiluppdIndukKdWil)) {
        return items[i];
      }
    }
    return null;
  }

  ReferenceData? selectJenisIdentitas(String? jenisIdentitas) {
    List<ReferenceData> itemValue = References.list.setJenisIdentitasV2();

    for (var i = 0; i < itemValue.length; i++) {
      if (StringUtils.trimString(jenisIdentitas) ==
          StringUtils.trimString(
            itemValue[i].jenisIdentitasJenisIdentitas,
          )) {
        return itemValue[i];
      }
    }
    return null;
  }

  DataKdPos? selectKdPos(
    String? kdPos,
    List<DataKdPos> itemValue,
  ) {
    for (var i = 0; i < itemValue.length; i++) {
      if (StringUtils.trimString(kdPos) ==
          StringUtils.trimString(itemValue[i].kdPosKdPos)) {
        return itemValue[i];
      }
    }
    return null;
  }

  DataKdPos? selectKdPosByKdKecamatan(
    String? kdKecamatan,
    List<DataKdPos> itemValue,
  ) {
    for (var i = 0; i < itemValue.length; i++) {
      if (StringUtils.trimString(kdKecamatan) ==
          StringUtils.trimString(itemValue[i].kdPosKdKecamatan)) {
        return itemValue[i];
      }
    }
    return null;
  }

  DataKdKecamatan? selectKecamatan(
    String? kdKecamatan,
    List<DataKdKecamatan> itemValue,
  ) {
    for (var i = 0; i < itemValue.length; i++) {
      if (StringUtils.trimString(kdKecamatan) ==
          StringUtils.trimString(itemValue[i].kdPosKdKecamatan)) {
        return itemValue[i];
      }
    }
    return null;
  }

  ReferenceData? selectKabKotaByKd(String? kdKabKota) {
    List<ReferenceData> itemValue = References.list.setItemKabKota();

    for (var i = 0; i < itemValue.length; i++) {
      if (StringUtils.trimString(kdKabKota) ==
          StringUtils.trimString(
            itemValue[i].kabKotaKdKabKota,
          )) {
        return itemValue[i];
      }
    }
    return null;
  }

  DataUserModelReference? selectUser(
    String? idUser,
    List<DataUserModelReference> options,
  ) {
    for (var i = 0; i < options.length; i++) {
      if (StringUtils.trimString(idUser) ==
          StringUtils.trimString(options[i].id)) {
        return options[i];
      }
    }

    return null;
  }

  ReferenceData? selectKdBbm(String? kdBbm) {
    List<ReferenceData> itemValue = References.list.setItemBbm();

    for (var i = 0; i < itemValue.length; i++) {
      if (StringUtils.trimString(kdBbm) ==
          StringUtils.trimString(
            itemValue[i].bbmKdBbm,
          )) {
        return itemValue[i];
      }
    }
    return null;
  }

  ReferenceData? selectKdFungsi(String? kdFungsi) {
    List<ReferenceData> itemValue = References.list.setJenisKepemilikan();

    for (var i = 0; i < itemValue.length; i++) {
      if (StringUtils.trimString(kdFungsi) ==
          StringUtils.trimString(
            itemValue[i].fungsikbKdFungsi,
          )) {
        return itemValue[i];
      }
    }
    return null;
  }

  ReferenceData? selectKdProteksi(String? kdProteksi) {
    List<ReferenceData> itemValue = References.list.setProteksi();

    for (var i = 0; i < itemValue.length; i++) {
      if (StringUtils.trimString(kdProteksi) ==
          StringUtils.trimString(
            itemValue[i].jenisProteksiKdProteksi,
          )) {
        return itemValue[i];
      }
    }
    return null;
  }

  ReferenceData? selectKdBlokir(String? kdBlokir) {
    List<ReferenceData> itemValue = References.list.setBlockir();

    for (var i = 0; i < itemValue.length; i++) {
      if (StringUtils.trimString(kdBlokir) ==
          StringUtils.trimString(
            itemValue[i].jenisBlokirKdBlokir,
          )) {
        return itemValue[i];
      }
    }
    return null;
  }

  ReferenceData? selectKdMohon(String? kdMohon) {
    List<ReferenceData> itemValue = References.list.setKdMohon();

    for (var i = 0; i < itemValue.length; i++) {
      if (StringUtils.trimString(kdMohon) ==
          StringUtils.trimString(
            itemValue[i].kdMohonKdMohon,
          )) {
        return itemValue[i];
      }
    }
    return null;
  }

  DataKodeMerek? selectKdMerekKb2(
    String? kdMerek2,
    List<DataKodeMerek> items,
  ) {
    for (var i = 0; i < items.length; i++) {
      if (StringUtils.trimString(kdMerek2) ==
          StringUtils.trimString(items[i].merekkbKdMerekKb2)) {
        return items[i];
      }
    }
    return null;
  }

  DataKodeModel? selectNmModel(
    String? nmModel,
    List<DataKodeModel> items,
  ) {
    for (var i = 0; i < items.length; i++) {
      if (StringUtils.trimString(nmModel) ==
          StringUtils.trimString(items[i].merekkbNmModelKb)) {
        return items[i];
      }
    }
    return null;
  }

  ReferenceData? selectJenisKendaraanV2(
    String? kdJenisKb,
  ) {
    List<ReferenceData> itemValue = References.list.setJenisKendaraanV2();

    for (var i = 0; i < itemValue.length; i++) {
      if (StringUtils.trimString(kdJenisKb) ==
          StringUtils.trimString(
            itemValue[i].jeniskbKdJenisKb,
          )) {
        return itemValue[i];
      }
    }
    return null;
  }

  YaTidakModel? selectYaTidak(
    String? yt,
  ) {
    for (var i = 0; i < dataYaTidak.length; i++) {
      if (StringUtils.trimString(yt) ==
          StringUtils.trimString(
            dataYaTidak[i].yt,
          )) {
        return dataYaTidak[i];
      }
    }
    return null;
  }

  ReferenceData? selectKategoriSistemPembayaran(
    String? idKategoriSistem,
  ) {
    List<ReferenceData> options = References.list.setKategoriSistemPembayaran();

    for (var i = 0; i < options.length; i++) {
      if (StringUtils.trimString(idKategoriSistem) ==
          StringUtils.trimString(
            options[i].idKategoriSistem,
          )) {
        return options[i];
      }
    }
    return null;
  }

  ReferenceData? selectBank(
    String? idBank,
  ) {
    List<ReferenceData> options = References.list.setJenisBank();

    for (var i = 0; i < options.length; i++) {
      if (StringUtils.trimString(idBank) ==
          StringUtils.trimString(
            options[i].idBank,
          )) {
        return options[i];
      }
    }
    return null;
  }

  ReferenceData? selectMetodePembayaran(
    String? idMetodePembayaran,
  ) {
    List<ReferenceData> options = References.list.setMetodePembayaran();

    for (var i = 0; i < options.length; i++) {
      if (StringUtils.trimString(idMetodePembayaran) ==
          StringUtils.trimString(
            options[i].idMetodePembayaran,
          )) {
        return options[i];
      }
    }
    return null;
  }

  ReferenceData? selectCollectingAgent(
    String? idCollectingAgent,
  ) {
    List<ReferenceData> options = References.list.setCollectingAgent();

    for (var i = 0; i < options.length; i++) {
      if (StringUtils.trimString(idCollectingAgent) ==
          StringUtils.trimString(
            options[i].collectingAgentIdCollectingAgent,
          )) {
        return options[i];
      }
    }
    return null;
  }

  ReferenceData selectJenisKendaraan({required kdJenisKendaraan}) {
    ReferenceData item = ReferenceData();
    bool found = false;

    ReferenceDatabase.referenceModel.data?.forEach((element) {
      if (found) return;

      if (element.referenceName == "Jenis Kendaraan") {
        element.referenceData?.forEach((el) {
          if (found) return;

          if (el.jeniskbKdJenisKb == kdJenisKendaraan) {
            item = el;
            found = true; // Set found to true to indicate item has been located
            return;
          }
        });
      }
    });

    return item;
  }
}
