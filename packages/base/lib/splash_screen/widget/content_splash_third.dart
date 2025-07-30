import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ContentSplashThird extends StatelessWidget {
  const ContentSplashThird({super.key});

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
            height: height * 0.07,
          ),
          SvgPicture.asset(
            MediaRes.images.svg.splashScreenFood2,
            width: width,
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.22),
            child: Text(
              "Good Food at a Cheap Price",
              style: Get.theme.textTheme.displayMedium
                  ?.copyWith(fontWeight: FontWeight.w900, fontSize: 26),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.096),
            child: Text(
              "You can eat at expensive restaurants with affordable price.",
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
