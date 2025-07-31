import 'package:core/core.dart';

class SessionSplashScreenDatabase {
  static bool isPassedSplashScreen = false;

  static load() async {
    isPassedSplashScreen = mainStorage.get("isPassedSplashScreen") ?? false;
  }

  static save({required bool isPassedSplashScreen}) async {
    mainStorage.put("isPassedSplashScreen", isPassedSplashScreen);

    SessionSplashScreenDatabase.isPassedSplashScreen = isPassedSplashScreen;
  }
}
