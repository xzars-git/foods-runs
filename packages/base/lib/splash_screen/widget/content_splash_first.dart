import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ContentSplashFirst extends StatelessWidget {
  const ContentSplashFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -100,
          left: -85,
          child: SvgPicture.asset(
            MediaRes.images.svg.backgroundSplashScreen,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 400,
          color: neutralWhite.withOpacity(0.9),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
                SvgPicture.asset(
                MediaRes.images.svg.logo,
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.3,
                ),
              const SizedBox(
                height: 32.0,
              ),
              Text(
                "Food Runs",
                style: Get.theme.textTheme.displayMedium?.copyWith(
                    color: Get.theme.colorScheme.primary,
                    fontWeight: FontWeight.w900,
                    fontSize: 50),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
