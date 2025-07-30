import 'package:core/themes/theme_config.dart';
import 'package:core/universal_model/update_nopol_model.dart';
import 'package:core/utils/string_utils/string_utils.dart';
import 'package:core/widgets/base_card/card_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReferenceHelper {
  String getSilinderSuffix({required String? kdBbm}) {
    if (StringUtils.trimString(kdBbm) == "4" ||
        StringUtils.trimString(kdBbm) == "7") {
      return "WATT";
    } else {
      return "CC";
    }
  }

  getLabelPermohonan(String statusEdit) {
    switch (statusEdit) {
      case "ADD":
        return const CardLabel(
          cardColor: blue50,
          cardBorderColor: blue200,
          cardTitleColor: blue900,
          cardTitle: "Tambah Data",
        );
      case "DELETE":
        return const CardLabel(
          cardColor: red50,
          cardBorderColor: red200,
          cardTitleColor: red900,
          cardTitle: "Hapus Data",
        );
      case "EDIT":
        return const CardLabel(
          cardColor: yellow50,
          cardBorderColor: yellow200,
          cardTitleColor: yellow900,
          cardTitle: "Ubah Data",
        );
      default:
        return Container();
    }
  }

  String setKeyPeriode(String value) {
    String returned = "";
    switch (value) {
      case "Tanggal Bayar":
        returned = "tg_bayar";
        break;
      case "Tanggal Penetapan":
        returned = "tg_tetap";
        break;
      case "Tanggal Cetak TNAB":
        returned = "tg_cetak_tnab";
        break;
      default:
        returned = "";
    }
    return returned;
  }

  String kdPlatToText(String value) {
    String returned = "";
    switch (value) {
      case "1":
        returned = "HITAM";
        break;
      case "2":
        returned = "MERAH";
        break;
      case "3":
        returned = "KUNING";
        break;
      case "4":
        returned = "PUTIH";
        break;
      default:
        returned = "";
    }
    return returned;
  }

  UpdateNopol doUpdateNopol({required String kdPlat}) {
    switch (kdPlat) {
      case "1":
        return const UpdateNopol(
          statusHitam: true,
          statusPutih: false,
          statusMerah: false,
          statusKuning: false,
          warnaPlat: gray900,
          warnaBorder: gray100,
          warnaFont: gray100,
          warnaPlaceholder: gray100,
          kodePlat: "1",
        );
      case "2":
        return const UpdateNopol(
          statusMerah: true,
          statusHitam: false,
          statusPutih: false,
          statusKuning: false,
          warnaPlat: red400,
          warnaBorder: neutralWhite,
          warnaFont: neutralWhite,
          warnaPlaceholder: red200,
          kodePlat: "2",
        );
      case "3":
        return const UpdateNopol(
          statusKuning: true,
          statusHitam: false,
          statusPutih: false,
          statusMerah: false,
          warnaPlat: yellow600,
          warnaBorder: neutralBlack,
          warnaFont: neutralBlack,
          warnaPlaceholder: yellow200,
          kodePlat: "3",
        );

      default:
        return const UpdateNopol(
          statusHitam: true,
          statusPutih: false,
          statusMerah: false,
          statusKuning: false,
          warnaPlat: gray900,
          warnaBorder: gray100,
          warnaFont: gray100,
          warnaPlaceholder: gray100,
          kodePlat: "1",
        );
    }
  }

  handleKeyEvent({
    required KeyEvent event,
    Function()? onEnter,
    Function()? onEscape,
    Function()? onBackspace,
    Function()? onCtrlEnter,
    Function()? onCtrlH,
    Function()? onCtrlR,
    Function()? onCtrl1,
    Function()? onCtrl2,
    Function()? onCtrl3,
    Function()? onCtrl4,
  }) async {
    /////Escape/////
    if (event is KeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.escape) {
      if (onEscape != null) {
        onEscape();
      }
    }
    //Enter
    if (event is KeyDownEvent &&
        (event.logicalKey == LogicalKeyboardKey.enter ||
            event.logicalKey == LogicalKeyboardKey.numpadEnter)) {
      if (onEnter != null) {
        onEnter();
      }
    }

    /////backspace/////
    if (event is KeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.backspace) {
      if (onBackspace != null) {
        onBackspace();
      }
    }

    if (event is KeyDownEvent &&
        (event.logicalKey == LogicalKeyboardKey.enter ||
            event.logicalKey == LogicalKeyboardKey.numpadEnter) &&
        HardwareKeyboard.instance.isControlPressed) {
      if (onCtrlEnter != null) {
        onCtrlEnter();
      }
    }
    if (event is KeyDownEvent &&
        (event.logicalKey == LogicalKeyboardKey.keyH &&
            HardwareKeyboard.instance.isControlPressed)) {
      if (onCtrlH != null) {
        onCtrlH();
      }
    }
    if (event is KeyDownEvent &&
        (event.logicalKey == LogicalKeyboardKey.keyR &&
            HardwareKeyboard.instance.isControlPressed)) {
      if (onCtrlR != null) {
        onCtrlR();
      }
    }
    if (event is KeyDownEvent &&
        ((event.logicalKey == LogicalKeyboardKey.digit1 ||
                event.logicalKey == LogicalKeyboardKey.numpad1) &&
            HardwareKeyboard.instance.isControlPressed)) {
      if (onCtrl1 != null) {
        onCtrl1();
      }
    }
    if (event is KeyDownEvent &&
        ((event.logicalKey == LogicalKeyboardKey.digit2 ||
                event.logicalKey == LogicalKeyboardKey.numpad2) &&
            HardwareKeyboard.instance.isControlPressed)) {
      if (onCtrl2 != null) {
        onCtrl2();
      }
    }
    if (event is KeyDownEvent &&
        ((event.logicalKey == LogicalKeyboardKey.digit3 ||
                event.logicalKey == LogicalKeyboardKey.numpad3) &&
            HardwareKeyboard.instance.isControlPressed)) {
      if (onCtrl3 != null) {
        onCtrl3();
      }
    }
    if (event is KeyDownEvent &&
        ((event.logicalKey == LogicalKeyboardKey.digit4 ||
                event.logicalKey == LogicalKeyboardKey.numpad4) &&
            HardwareKeyboard.instance.isControlPressed)) {
      if (onCtrl4 != null) {
        onCtrl4();
      }
    }

    return KeyEventResult.handled;
  }
}
