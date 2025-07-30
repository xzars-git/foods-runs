import 'package:core/core.dart';

class SessionSplashScreenDatabase {
  static bool? isPassedSplashScreen;

  static load() async {
    isPassedSplashScreen = mainStorage.get("isPassedSplashScreen");
  }

  static save(bool? isPassedSplashScreen) async {
    mainStorage.put("isPassedSplashScreen", isPassedSplashScreen);

    SessionSplashScreenDatabase.isPassedSplashScreen = isPassedSplashScreen;
  }
}
