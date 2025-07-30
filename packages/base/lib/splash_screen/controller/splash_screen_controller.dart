import 'package:base/splash_screen/widget/content_splash_first.dart';
import 'package:base/splash_screen/widget/content_splash_second.dart';
import 'package:base/splash_screen/widget/content_splash_third.dart';
import 'package:flutter/material.dart';
import '../view/splash_screen_view.dart';

class SplashScreenController extends State<SplashScreenView> {
  static late SplashScreenController instance;
  late SplashScreenView view;

  final PageController pageController = PageController();
  int currentPage = 0;

  // Ubah menjadi List<Widget>
  final List<Widget> onboardingPages = [
    const ContentSplashFirst(),
    const ContentSplashSecond(),
    const ContentSplashThird()
  ];

  @override
  void initState() {
    instance = this;
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
