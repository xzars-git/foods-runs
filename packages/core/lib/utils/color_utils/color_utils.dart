import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ColorUtils {
  static Color colorStatusProteksi(String? kdProteksi) {
    if (StringUtils.trimStringStrip(
          References.dict.getNamaProteksi(
            kdProteksi,
          ),
        ) ==
        "-") {
      return green600;
    } else {
      return red500;
    }
  }

  static Color colorStatusBlokir(String? kdBlokir) {
    if (StringUtils.trimStringStrip(
          References.dict.getNamaBlockir(
            kdBlokir,
          ),
        ) ==
        "-") {
      return green600;
    } else {
      return red500;
    }
  }

  static Color colorPengajuanProteksi(String? progressProteksiType) {
    if (StringUtils.trimStringStrip(progressProteksiType) == "-") {
      return green600;
    } else {
      return yellow700;
    }
  }
}
