import 'package:base/splash_screen/controller/splash_screen_controller.dart';
import 'package:flutter/material.dart';

Widget buildDot(
    {required int index,
    required BuildContext context,
    required SplashScreenController controller}) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 200),
    margin: const EdgeInsets.symmetric(horizontal: 4),
    height: 8,
    width: controller.currentPage == index ? 24 : 8,
    decoration: BoxDecoration(
      color: controller.currentPage == index ? Theme.of(context).primaryColor : Colors.grey[300],
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
