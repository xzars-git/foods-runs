import 'package:core/utils/references/reference_checker.dart';
import 'package:core/utils/references/reference_dict.dart';
import 'package:core/utils/references/reference_helper.dart';
import 'package:core/utils/references/reference_list.dart';
import 'package:core/utils/references/reference_selector.dart';

class References {
  const References._();

  static final list = ReferenceList();
  static final dict = ReferenceDict();
  static final check = ReferenceChecker();
  static final select = ReferenceSelector();
  static final helper = ReferenceHelper();
}
