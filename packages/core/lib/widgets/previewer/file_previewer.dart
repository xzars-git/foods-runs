import 'dart:convert';

import 'package:core/core.dart';
import 'package:flutter/material.dart';

class FilePreviewer extends StatefulWidget {
  final String base64File;
  final String extensionFile;
  final String? titlePdf;
  final String? subtitlePdf;
  final double height;

  const FilePreviewer({
    super.key,
    required this.base64File,
    required this.extensionFile,
    this.titlePdf,
    this.subtitlePdf,
    this.height = 190,
  });

  @override
  State<FilePreviewer> createState() => _FilePreviewerState();
}

class _FilePreviewerState extends State<FilePreviewer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: widget.extensionFile == ".pdf" ? null : widget.height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(
          color: Theme.of(context).colorScheme.outline,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            if (widget.extensionFile == ".pdf") {
              PdfPreviewDialog.showPreviewDialog(
                context,
                widget.base64File,
              );
            } else {
              ImagePreviewDialog.showPreviewDialog(
                context,
                widget.base64File,
              );
            }
          },
          child: (widget.extensionFile == ".pdf")
              ? _thumbnailPdf(widget.titlePdf, widget.subtitlePdf)
              : _thumbnailImage(widget.base64File),
        ),
      ),
    );
  }

  Widget _thumbnailImage(base64File) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: base64File.toString().isNotEmpty
          ? Stack(
              children: [
                Image.memory(
                  base64Decode(base64File),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Positioned.fill(
                  child: Center(
                    child: CircleAvatar(
                      backgroundColor: neutralBlack.withOpacity(0.45),
                      child: SvgPicture.asset(
                        MediaRes.icons.misc.zoomOutMap,
                        colorFilter: const ColorFilter.mode(
                          neutralWhite,
                          BlendMode.srcIn,
                        ),
                        height: 21,
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Image.asset(
              isDarkMode(context)
                  ? MediaRes.images.state.cantLoadDark
                  : MediaRes.images.state.cantLoad,
              fit: BoxFit.fitHeight,
              width: double.infinity,
              height: double.infinity,
            ),
    );
  }

  Widget _thumbnailPdf(titlePdf, subtitlePdf) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          SvgPicture.asset(
            MediaRes.icons.misc.pdf,
            height: 40,
            width: 40,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.onSecondary,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  StringUtils.trimStringStrip(titlePdf),
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Text(
                  StringUtils.trimStringStrip(subtitlePdf),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Text(
                  "Buka File",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: primaryGreen,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
