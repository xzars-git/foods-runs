import 'package:core/core.dart';
import 'package:core/state_util.dart';
import 'package:flutter/material.dart';

Future showDialogBaseNoScroll({
  required Widget content,
  double? maxWidth,
  double? maxHeight,
  bool? barrierDismissible,
}) async {
  await showDialog<void>(
    context: globalContext,
    barrierDismissible: barrierDismissible ?? false,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        content: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: maxWidth ?? 450,
            maxHeight: maxHeight ?? 1000,
          ),
          child: content,
        ),
      );
    },
  );
}
