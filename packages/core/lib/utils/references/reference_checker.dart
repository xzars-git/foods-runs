import 'package:core/core.dart';

class ReferenceChecker {
  // Getters - Bool
  // Getters - Bool
  bool isRoleActive(String? role) {
    return StringUtils.trimString(role).toString() == "1";
  }

  bool isSomeRoleActive(List<String?> role) {
    for (var i = 0; i < role.length; i++) {
      if (StringUtils.trimString(role[i]).toString() == "1") {
        return true;
      }
    }
    return false;
  }

  bool isStatusRc() {
    return _getStatusByReferenceName("Status RC", "status_rc");
  }

  bool isStatusAdmin() {
    return _getStatusByReferenceName("Status Admin", "status_admin");
  }

  bool _getStatusByReferenceName(String referenceName, String statusField) {
    try {
      // Mendapatkan item berdasarkan referenceName dari database referensi
      List<ReferenceData> itemValue = ReferenceDatabase.referenceModel.data!
              .firstWhere(
                (element) => StringUtils.compareStrings(
                    element.referenceName ?? "", referenceName),
                orElse: () => ReferenceDatum(
                    referenceName: "", referenceData: []), // Fallback
              )
              .referenceData ??
          [];

      // Memeriksa apakah ada status yang bernilai true
      for (var i = 0; i < itemValue.length; i++) {
        if ((statusField == "status_rc" && itemValue[i].statusRc == true) ||
            (statusField == "status_admin" &&
                itemValue[i].statusAdmin == true)) {
          return true;
        }
      }
    } catch (e) {
      // Tangani error jika terjadi
      return false;
    }

    return false;
  }

  bool isStatusKoreksi() {
    List<ReferenceData> itemValue = References.list.setItemStatusKoreksi();

    for (var i = 0; i < itemValue.length; i++) {
      if (itemValue[i].statusRc == true) {
        return true;
      }
    }

    return false;
  }

  bool isNoKtpEditable({required String? kdWil}) {
    // List yang dapat diedit : Wilayah Polda metro
    const List<String> allowedPrefixes = ["2"];

    if (StringUtils.trimString(kdWil).toString().isEmpty) {
      return false;
    }
    return allowedPrefixes
        .contains(StringUtils.trimString(kdWil).toString()[0]);
  }

  bool isWiluppdInduk(String? idWiluppdKerja) {
    List<ReferenceData> itemValue = References.list.setItemWiluppd();

    String kdWilProses = References.dict.getKdWilProsesById(idWiluppdKerja);

    for (var i = 0; i < itemValue.length; i++) {
      if (StringUtils.trimString(kdWilProses) ==
          StringUtils.trimString(itemValue[i].wiluppdIndukKdWil)) {
        return true;
      }
    }
    return false;
  }
}
