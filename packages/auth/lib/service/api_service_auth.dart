import 'dart:convert';

import 'package:core/core.dart';

class ApiServiceAuth {
  Future<Map> login({
    required String username,
    required String password,
  }) async {
    try {
      DioClient client = DioClient();

      final response = await client.apiCall(
        url: Endpoints.login,
        requestType: RequestType.post,
        body: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        if (response.data["code"] == "0000") {
          return response.data["data"];
        } else {
          throw CustomExceptionDio(response.data["message"]);
        }
      } else {
        throw CustomExceptionDio("Failed to do login");
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomExceptionDio(
            "Tidak mendapatkan respon dari server setelah ${Endpoints.connectionTimeout.inSeconds} detik");
      }
      throw CustomExceptionDio("Server Exception ${e.message}");
    }
  }

  Future<ReferenceModel> referenceData() async {
    try {
      DioClient client = DioClient();

      final response = await client.apiCall(
        url: Endpoints.reference,
        requestType: RequestType.get,
      );

      if (response.statusCode == 200) {
        if (response.data["code"] == "0000") {
          return ReferenceModel.fromJson(json.decode(response.toString()));
        } else {
          throw CustomExceptionDio(response.data["message"]);
        }
      } else {
        throw CustomExceptionDio("Failed to get reference data");
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomExceptionDio(
            "Tidak mendapatkan respon dari server setelah ${Endpoints.connectionTimeout.inSeconds} detik");
      }
      throw CustomExceptionDio("Server Exception ${e.message}");
    }
  }

  Future<UserDataModel> getUserData() async {
    try {
      DioClient client = DioClient();

      final response = await client.apiCall(
        url: Endpoints.getUserData,
        requestType: RequestType.get,
      );

      if (response.statusCode == 200) {
        if (response.data["code"] == "0000") {
          return UserDataModel.fromJson(json.decode(response.toString()));
        } else {
          throw CustomExceptionDio(response.data["message"]);
        }
      } else {
        throw CustomExceptionDio("Failed to get user data");
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomExceptionDio(
            "Tidak mendapatkan respon dari server setelah ${Endpoints.connectionTimeout.inSeconds} detik");
      }
      throw CustomExceptionDio("Server Exception ${e.message}");
    }
  }

  Future<Map> updatePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      DioClient client = DioClient();

      final response = await client.apiCall(
        url: Endpoints.updatePassword,
        requestType: RequestType.post,
        body: {
          "old_password": oldPassword,
          "password": newPassword,
        },
      );

      if (response.statusCode == 200) {
        if (response.data["code"] == "0000") {
          return response.data["data"];
        } else {
          throw CustomExceptionDio(response.data["message"]);
        }
      } else {
        throw CustomExceptionDio("Failed to update password");
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
