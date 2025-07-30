import 'package:core/core.dart';

class ReferenceDatabase {
  static ReferenceModel referenceModel = ReferenceModel();

  static load() async {
    referenceModel = mainStorage.get("referenceModel") ?? ReferenceModel();
  }

  static save(ReferenceModel referenceModel) async {
    mainStorage.put("referenceModel", referenceModel);

    ReferenceDatabase.referenceModel = referenceModel;
  }
}
