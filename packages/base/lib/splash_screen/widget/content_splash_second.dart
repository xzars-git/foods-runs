import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ContentSplashSecond extends StatelessWidget {
  const ContentSplashSecond({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Stack(children: [
      Positioned(
        top: -height * 0.5,
        left: -width * 0.2,
        child: SvgPicture.asset(
          MediaRes.images.svg.backgroundSplashScreen,
          width: width * 1.2,
          height: height * 0.7,
        ),
      ),
      Container(
        width: width,
        height: height * 0.35,
        color: neutralWhite.withOpacity(0.9),
      ),
      Column(
        children: [
          SizedBox(
            height: height * 0.06,
          ),
          SvgPicture.asset(
            MediaRes.images.svg.splashScreenFood1,
            width: width,
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.22),
            child: Text(
              "Choose Your Favorite Place to Eat",
              style: Get.theme.textTheme.displayMedium
                  ?.copyWith(fontWeight: FontWeight.w900, fontSize: width * 0.065), // fontSize dinamis
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.09),
            child: Text(
              "Discover and select the best restaurants near you to enjoy delicious meals.",
              style: Get.theme.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 184.0, // Tetap fixed
          ),
        ],
      ),
    ]);
  }
}
