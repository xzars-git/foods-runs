class Images {
  static String basePath = 'assets/images';

  final svg = _SVGState();
}

class _SVGState {
  static String basePath = 'svg';
  String get back => '${Images.basePath}/$basePath/back.svg';
  String get location => '${Images.basePath}/$basePath/location.svg';
  String get logo => '${Images.basePath}/$basePath/logo.svg';
  String get plus => '${Images.basePath}/$basePath/plus.svg';
  String get rating => '${Images.basePath}/$basePath/rating.svg';
  String get rightArrow => '${Images.basePath}/$basePath/right_arrow.svg';
  String get search => '${Images.basePath}/$basePath/search.svg';
  String get backgroundSplashScreen => '${Images.basePath}/$basePath/background_splash_screen.svg';
  String get splashScreenFood1 => '${Images.basePath}/$basePath/splash_screen_food_1.svg';
  String get splashScreenFood2 => '${Images.basePath}/$basePath/splash_screen_food_2.svg';
}