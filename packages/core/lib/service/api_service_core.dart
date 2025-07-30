import 'dart:convert';

import 'package:core/core.dart';
import 'package:core/models/get_list_user_references.dart';
import 'package:core/models/hitung_ulang_model.dart';
import 'package:core/models/list_pejabat_pengawas_model.dart';

class ApiServiceCore {
  DioClient client = DioClient();

  Future<Map> logout() async {
    try {
      final response = await client.apiCall(
        url: Endpoints.logout,
        requestType: RequestType.post,
      );

      if (response.statusCode == 200) {
        if (response.data["success"]) {
          return response.data;
        } else {
          throw CustomExceptionDio(response.data["message"]);
        }
      } else {
        throw CustomExceptionDio("Failed to logout");
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomExceptionDio(
            "Tidak mendapatkan respon dari server setelah ${Endpoints.connectionTimeout.inSeconds} detik");
      }
      throw CustomExceptionDio("Server Exception ${e.message}");
    }
  }

  Future<KirimWaModel> kirimPdf({required ParamKirimWa paramKirimWa}) async {
    try {
      final response = await client.apiCall(
        url: Endpoints.kirimWa,
        requestType: RequestType.post,
        body: paramKirimWa.toJson(),
      );

      if (response.statusCode == 200) {
        if (response.data["success"]) {
          return KirimWaModel.fromJson(response.data);
        } else {
          throw CustomExceptionDio(response.data["message"]);
        }
      } else {
        throw CustomExceptionDio("Failed to logout");
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomExceptionDio(
            "Tidak mendapatkan respon dari server setelah ${Endpoints.connectionTimeout.inSeconds} detik");
      }
      throw CustomExceptionDio("Server Exception ${e.message}");
    }
  }

  Future<PejabatLaporanModel> getPejabatLaporan() async {
    try {
      final response = await client.apiCall(
        url: Endpoints.pejabatLaporan,
        requestType: RequestType.get,
      );

      if (response.statusCode == 200) {
        if (response.data["code"] == "0000") {
          return PejabatLaporanModel.fromJson(json.decode(response.toString()));
        } else {
          throw CustomExceptionDio(response.data["message"]);
        }
      } else {
        throw CustomExceptionDio("Failed to getPejabatLaporan");
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomExceptionDio(
            "Tidak mendapatkan respon dari server setelah ${Endpoints.connectionTimeout.inSeconds} detik");
      }
      throw CustomExceptionDio("Server Exception ${e.message}");
    }
  }

  Future<GetNmMerekModel> getNmMerekModel({
    required String kdMerekKb,
  }) async {
    try {
      final response = await client.apiCall(
        url: Endpoints.nmMerekModel + kdMerekKb,
        requestType: RequestType.get,
      );

      if (response.statusCode == 200) {
        if (response.data["code"] == "0000") {
          return GetNmMerekModel.fromJson(json.decode(response.toString()));
        } else {
          throw CustomExceptionDio(response.data["message"]);
        }
      } else {
        throw CustomExceptionDio("Failed to get getNmMerekModel data");
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomExceptionDio(
            "Tidak mendapatkan respon dari server setelah ${Endpoints.connectionTimeout.inSeconds} detik");
      }
      throw CustomExceptionDio("Server Exception ${e.message}");
    }
  }

  Future<KodeMerekModel> kdMerek({
    required String kdJenis,
  }) async {
    try {
      final response = await client.apiCall(
        url: "${Endpoints.kodeMerek}?kd_jenis=$kdJenis",
        requestType: RequestType.get,
      );

      if (response.statusCode == 200) {
        if (response.data["code"] == "0000") {
          return KodeMerekModel.fromJson(json.decode(response.toString()));
        } else {
          throw CustomExceptionDio(response.data["message"]);
        }
      } else {
        throw CustomExceptionDio("Failed to get kode merek");
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomExceptionDio(
            "Tidak mendapatkan respon dari server setelah ${Endpoints.connectionTimeout.inSeconds} detik");
      }
      throw CustomExceptionDio("Server Exception ${e.message}");
    }
  }

  Future<KodeModelResult> kdModel({
    required String kdMerekKb,
  }) async {
    try {
      final response = await client.apiCall(
        url: "${Endpoints.kodeModel}?merekkb_kd_merek_kb=$kdMerekKb",
        requestType: RequestType.get,
      );

      if (response.statusCode == 200) {
        if (response.data["code"] == "0000") {
          return KodeModelResult.fromJson(json.decode(response.toString()));
        } else {
          throw CustomExceptionDio(response.data["message"]);
        }
      } else {
        throw CustomExceptionDio("Failed to get kode model");
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomExceptionDio(
            "Tidak mendapatkan respon dari server setelah ${Endpoints.connectionTimeout.inSeconds} detik");
      }
      throw CustomExceptionDio("Server Exception ${e.message}");
    }
  }

  Future<NilaiJualModel> nilaiJual({
    required String kdMerekKb,
  }) async {
    try {
      final response = await client.apiCall(
        url: "${Endpoints.nilaiJual}?merekkb_kd_merek_kb=$kdMerekKb",
        requestType: RequestType.get,
      );

      if (response.statusCode == 200) {
        if (response.data["code"] == "0000") {
          return NilaiJualModel.fromJson(json.decode(response.toString()));
        } else {
          throw CustomExceptionDio(response.data["message"]);
        }
      } else {
        throw CustomExceptionDio("Failed to get nilai jual");
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomExceptionDio(
            "Tidak mendapatkan respon dari server setelah ${Endpoints.connectionTimeout.inSeconds} detik");
      }
      throw CustomExceptionDio("Server Exception ${e.message}");
    }
  }

  Future<GetKdPosModel> getKdPos({
    required String kdWil,
  }) async {
    try {
      final response = await client.apiCall(
        url: Endpoints.getKdPos + kdWil,
        requestType: RequestType.get,
      );

      if (response.statusCode == 200) {
        if (response.data["code"] == "0000") {
          return GetKdPosModel.fromJson(json.decode(response.toString()));
        } else {
          throw CustomExceptionDio(response.data["message"]);
        }
      } else {
        throw CustomExceptionDio("Failed to get getKdPos data");
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomExceptionDio(
            "Tidak mendapatkan respon dari server setelah ${Endpoints.connectionTimeout.inSeconds} detik");
      }
      throw CustomExceptionDio("Server Exception ${e.message}");
    }
  }

  Future<List<DataKdPos>> handleGetKdPos({
    required String? kdWil,
  }) async {
    try {
      final result = await getKdPos(
        kdWil: StringUtils.trimString(kdWil),
      );

      return result.data ?? [];
    } catch (e) {
      showInfoDialog(e.toString());
    }

    return [];
  }

  Future<GetKdKecamatanModel> getKdKecamatan({
    required String kdWil,
  }) async {
    try {
      final response = await client.apiCall(
        url: Endpoints.getKecamatan + kdWil,
        requestType: RequestType.get,
      );

      if (response.statusCode != 200) {
        throw CustomExceptionDio("Failed to get getKdPos data");
      }

      if (response.data["code"] != "0000") {
        throw CustomExceptionDio(response.data["message"]);
      }

      return GetKdKecamatanModel.fromJson(json.decode(response.toString()));
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomExceptionDio(
            "Tidak mendapatkan respon dari server setelah ${Endpoints.connectionTimeout.inSeconds} detik");
      }
      throw CustomExceptionDio("Server Exception ${e.message}");
    }
  }

  Future<List<DataKdKecamatan>> handleGetKdKecamatan({
    required String? kdWil,
  }) async {
    try {
      final result = await getKdKecamatan(
        kdWil: StringUtils.trimString(kdWil),
      );

      return result.data ?? [];
    } catch (e) {
      showInfoDialog(e.toString());
    }

    return [];
  }

  Future<VersioningModel> checkVersion({required String type}) async {
    try {
      final response = await client.apiCall(
        url: "${Endpoints.versionCurrent}?type=$type",
        requestType: RequestType.get,
      );

      if (response.statusCode == 200) {
        if (response.data["code"] == "0000") {
          return VersioningModel.fromJson(json.decode(response.toString()));
        } else {
          throw CustomExceptionDio(response.data["message"]);
        }
      } else {
        throw CustomExceptionDio("Failed to get version data");
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomExceptionDio(
            "Tidak mendapatkan respon dari server setelah ${Endpoints.connectionTimeout.inSeconds} detik");
      }
      throw CustomExceptionDio("Server Exception ${e.message}");
    }
  }

  Future<ListPejabatPengawas> getMyPejabatPengawas() async {
    DioClient client = DioClient();

    try {
      final response = await client.apiCall(
        url: Endpoints.getMyPejabatPengawas,
        requestType: RequestType.get,
      );

      if (response.statusCode == 200) {
        if (response.data["code"] == "0000") {
          return ListPejabatPengawas.fromJson(json.decode(response.toString()));
        } else {
          throw CustomExceptionDio(response.data["message"]);
        }
      } else {
        throw CustomExceptionDio("Failed to get data Pejabat Pengawas");
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomExceptionDio(
            "Tidak mendapatkan respon dari server setelah ${Endpoints.connectionTimeout.inSeconds} detik");
      }
      throw CustomExceptionDio("Server Exception ${e.message}");
    }
  }

  Future<GetUserReferences> getUserList() async {
    DioClient client = DioClient();

    try {
      final response = await client.apiCall(
        url: Endpoints.userListReference,
        requestType: RequestType.get,
      );

      if (response.statusCode == 200) {
        if (response.data["code"] == "0000") {
          return GetUserReferences.fromJson(json.decode(response.toString()));
        } else {
          throw CustomExceptionDio(response.data["message"]);
        }
      } else {
        throw CustomExceptionDio("Failed to get user list");
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomExceptionDio(
            "Tidak mendapatkan respon dari server setelah ${Endpoints.connectionTimeout.inSeconds} detik");
      }
      throw CustomExceptionDio("Server Exception ${e.message}");
    }
  }

  Future<HitungUlangModel> hitungUlangInduk({
    required ParamHitungUlang dataHitungUlang,
  }) async {
    try {
      final response = await client.apiCall(
        url: Endpoints.hitungUlangInduk,
        requestType: RequestType.post,
        body: dataHitungUlang.toJson(),
      );

      if (response.statusCode == 200) {
        if (response.data["code"] == "0000") {
          return HitungUlangModel.fromJson(json.decode(response.toString()));
        } else {
          throw CustomExceptionDio(response.data["message"]);
        }
      } else {
        throw CustomExceptionDio("Failed to get hitung ulang data");
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomExceptionDio(
            "Tidak mendapatkan respon dari server setelah ${Endpoints.connectionTimeout.inSeconds} detik");
      }
      throw CustomExceptionDio("Server Exception ${e.message}");
    }
  }
}
