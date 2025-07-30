import 'dart:io';

import 'package:core/core.dart';
import 'package:flutter/foundation.dart';

class DeviceHelper {
  static isDeviceSupportCamera() {
    if (kIsWeb) return true;

    if (Platform.isAndroid) {
      List<String> unsupportedModels = ["D4", "D3", "C1P", "C1A"];

      // Jika model perangkat masuk dalam daftar unsupported, gunakan UVC
      if (unsupportedModels.contains(DeviceDatabase.deviceModel)) {
        return false;
      }
      // Jika tidak masuk daftar unsupported, asumsikan mendukung kamera biasa
      return true;
    }

    return false;
  }

  static isDeviceUsingPrintImin() {
    List<String> supportedModels = ["I22T01", "D4", "A10-Plus", "C1P", "C1A"];

    if (kIsWeb) return false;

    if (supportedModels.contains(DeviceDatabase.deviceModel)) {
      return true;
    } else {
      return false;
    }
  }

  static isDeviceMustBypassNormally() {
    List<String> supportedModels = ["A10-Plus", "C1P", "C1A"];

    if (supportedModels.contains(DeviceDatabase.deviceModel)) {
      return true;
    } else {
      return false;
    }
  }
}
