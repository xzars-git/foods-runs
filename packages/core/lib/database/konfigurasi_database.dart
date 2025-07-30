import 'package:core/core.dart';

class KonfigurasiDatabase {
  static int? perPage = 10;

  static load() async {
    perPage = mainStorage.get("perPage");
  }

  static save(
    int perPage,
  ) async {
    mainStorage.put("perPage", perPage);

    KonfigurasiDatabase.perPage = perPage;
  }
}
