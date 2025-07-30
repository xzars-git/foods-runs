import 'package:core/core.dart';
import 'package:core/database/list_pejabat_pengawas_database.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:core/models/list_pejabat_pengawas_model.dart';
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
    // await SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);

    // Load SVG
    await loadSVG();

    // Initialize Hive
    try {
      if (!kIsWeb) {
        var path = await getTemporaryDirectory();
        Hive.init(path.path);
      }

      if (!Hive.isAdapterRegistered(1)) {
        //Theme Model
        Hive.registerAdapter(ThemeModeAdapter());

        //Reference Model
        Hive.registerAdapter(ReferenceModelAdapter());
        Hive.registerAdapter(ReferenceDatumAdapter());
        Hive.registerAdapter(ReferenceDataAdapter());

        //User Data Model
        Hive.registerAdapter(UserDataModelAdapter());
        Hive.registerAdapter(DataUserAdapter());

        // Versioning Model
        Hive.registerAdapter(VersioningModelAdapter());
        Hive.registerAdapter(DataVersioningAdapter());

        // Pejabat Pengawas Model
        Hive.registerAdapter(ListPejabatPengawasAdapter());
        Hive.registerAdapter(DataPejabatPengawasAdapter());
      }

      mainStorage = await Hive.openBox("sakti_jawara");

      await SessionDatabase.load();
      await DeviceDatabase.load();
      await ThemeDatabase.load();
      await UserDataDatabase.load();
      await ReferenceDatabase.load();
      await ListPejabatPengawasDatabase.load();
    } catch (e) {
      // Fix masalah dengan database
      await Hive.deleteBoxFromDisk('sakti_jawara');
    }
    //END Initialize Hive

    if (!kIsWeb) {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

      AndroidDeviceInfo andro = await deviceInfo.androidInfo;

      VersionDatabase.save(packageInfo.version);
      DeviceDatabase.save(andro.model);
    }
  }
}
