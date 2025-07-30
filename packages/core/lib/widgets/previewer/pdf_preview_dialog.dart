import 'dart:convert';

import 'package:core/core.dart';
import 'package:flutter/material.dart';

class PdfPreviewDialog extends StatelessWidget {
  final String base64File;

  const PdfPreviewDialog(this.base64File, {super.key});

  static void showPreviewDialog(BuildContext context, String base64File) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PdfPreviewDialog(base64File);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Stack(
        children: [
          PDFView(
            enableSwipe: true,
            swipeHorizontal: true,
            autoSpacing: false,
            pageFling: true,
            pageSnap: true,
            pdfData: base64Decode(base64File),
          ),
          Positioned(
            top: 16.0,
            right: 16.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: SvgPicture.asset(
                  MediaRes.icons.misc.close,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.error,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
