import 'package:core/core.dart';

class DeviceDatabase {
  static String? deviceModel;

  static load() async {
    deviceModel = mainStorage.get("deviceModel");
  }

  static save(String? deviceModel) async {
    mainStorage.put("deviceModel", deviceModel);

    DeviceDatabase.deviceModel = deviceModel;
  }
}
