import 'package:core/themes/theme_config.dart';
import 'package:flutter/material.dart';

class ImageSliderWidget extends StatefulWidget {
  final List<String> imageUrls;
  final double height;

  const ImageSliderWidget({
    super.key,
    required this.imageUrls,
    this.height = 180,
  });

  @override
  State<ImageSliderWidget> createState() => _ImageSliderWidgetState();
}

class _ImageSliderWidgetState extends State<ImageSliderWidget> {
  late final PageController _controller;
  int _current = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 1, initialPage: 0);
    _controller.addListener(() {
      final newIndex = (_controller.page?.round() ?? 0);
      if (newIndex != _current) {
        setState(() => _current = newIndex);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Widget> _buildIndicators() {
    return List.generate(widget.imageUrls.length, (index) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _current == index ? primaryColor : gray200,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.height,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.imageUrls.length,
            itemBuilder: (_, i) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    widget.imageUrls[i],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildIndicators(),
        ),
      ],
    );
  }
}
