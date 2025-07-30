import 'package:core/core.dart';

bool isMetro() {
  DataUser? dataUser = UserDataDatabase.userDataModel.data;
  String wiluppdPoldaType = StringUtils.trimString(dataUser?.wiluppdPoldaType);

  //jika wiluppdPoldaType METRO balikan true
  if (wiluppdPoldaType == "METRO") {
    return true;
  } else {
    return false;
  }
}
