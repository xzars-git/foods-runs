import 'dart:convert';

import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ImagePreviewWidget extends StatefulWidget {
  final String base64Image;
  final Function() onPressed;
  final bool isCloseable;
  const ImagePreviewWidget({
    super.key,
    required this.base64Image,
    required this.onPressed,
    this.isCloseable = true,
  });

  @override
  State<ImagePreviewWidget> createState() => _ImagePreviewWidgetState();
}

class _ImagePreviewWidgetState extends State<ImagePreviewWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline,
          width: 1.0,
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Image.memory(
                      base64Decode(widget.base64Image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    color: gray900.withOpacity(0.5),
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            right: 25,
            left: 25,
            top: 25,
            bottom: 25,
            child: InkWell(
              onTap: () {
                ImagePreviewDialog.showPreviewDialog(
                  context,
                  widget.base64Image,
                );
              },
              child: const Center(
                child: Icon(
                  Icons.zoom_out_map,
                  size: 24.0,
                  color: neutralWhite,
                ),
              ),
            ),
          ),
          Builder(
            builder: (context) {
              if (!widget.isCloseable) {
                return const SizedBox.shrink();
              }

              return Positioned(
                top: 8,
                right: 0,
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: InkWell(
                    onTap: widget.onPressed,
                    child: SvgPicture.asset(
                      MediaRes.icons.misc.fail,
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
