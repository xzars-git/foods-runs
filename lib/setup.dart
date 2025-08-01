import 'package:core/core.dart';
import 'package:base/base.dart';
import 'package:core/database/theme_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'core.dart';

class Setup {
  static Future initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    // Initialize environment variables
    await Ddotenv.load(fileName: ".env");

    await Firebase.initializeApp();

    // Set preferred orientation
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // Initialize Hive
    try {
      var path = await getTemporaryDirectory();
      Hive.init(path.path);

      mainStorage = await Hive.openBox("foods_run");

      await SessionSplashScreenDatabase.load();
      await ThemeDatabase.load();
    } catch (e) {
      await Hive.deleteBoxFromDisk('foods_run');
    }

    newRouter = router;
  }
}
