import 'package:core/core.dart';
import 'package:core/models/list_pejabat_pengawas_model.dart';

//PEJABAT PENGAWAS
class ListPejabatPengawasDatabase {
  static ListPejabatPengawas resultListPejabatPengawas = ListPejabatPengawas();

  static load() async {
    resultListPejabatPengawas =
        mainStorage.get("resultListPejabatPengawas") ?? ListPejabatPengawas();
  }

  static save(ListPejabatPengawas resultListPejabatPengawas) async {
    mainStorage.put("resultListPejabatPengawas", resultListPejabatPengawas);
    ListPejabatPengawasDatabase.resultListPejabatPengawas =
        resultListPejabatPengawas;
  }
}
