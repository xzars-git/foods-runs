import 'package:core/core.dart';
import 'package:core/database/theme_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'core.dart';

class Setup {
  static Future initialize() async {
    // WidgetsFlutterBinding.ensureInitialized();

    // if (!kIsWeb) {
    //   await Firebase.initializeApp(
    //     options: DefaultFirebaseOptions.currentPlatform,
    //   );
    // }

    newRouter = router;

    // Set preferred orientation
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // Load SVG
    await loadSVG();

    // Initialize Hive
    try {
      if (!kIsWeb) {
        var path = await getTemporaryDirectory();
        Hive.init(path.path);
      }

      mainStorage = await Hive.openBox("foods_run");

      await SessionSplashScreenDatabase.load();
      await ThemeDatabase.load();
    } catch (e) {
      // Fix masalah dengan database
      await Hive.deleteBoxFromDisk('foods_run');
    }
    //END Initialize Hive
  }
}
