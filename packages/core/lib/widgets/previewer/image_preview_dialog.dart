import 'dart:convert';

import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ImagePreviewDialog extends StatelessWidget {
  final String base64Image;

  const ImagePreviewDialog(this.base64Image, {super.key});

  static void showPreviewDialog(BuildContext context, String base64Image) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ImagePreviewDialog(base64Image);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: InteractiveViewer(
          clipBehavior: Clip.none,
          maxScale: 5.0,
          child: base64Image.toString().isNotEmpty
              ? Image.memory(
                  base64Decode(base64Image),
                )
              : Image.asset(
                  isDarkMode(context)
                      ? MediaRes.images.state.cantLoadDark
                      : MediaRes.images.state.cantLoad,
                ),
        ),
      ),
    );
  }
}
