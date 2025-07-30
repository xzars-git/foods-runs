import 'package:core/core.dart';

class FeatureDatabase {
  static bool isFeatureNew = false;
  static VersioningModel versioningModel = VersioningModel();

  static load() async {
    isFeatureNew = mainStorage.get("isFeatureNew");
    versioningModel = mainStorage.get("versioningModel") ?? VersioningModel();
  }

  static save(bool isFeatureNew, VersioningModel versioningModel) async {
    mainStorage.put("isFeatureNew", isFeatureNew);
    mainStorage.put("versioningModel", versioningModel);

    FeatureDatabase.isFeatureNew = isFeatureNew;
    FeatureDatabase.versioningModel = versioningModel;
  }
}
