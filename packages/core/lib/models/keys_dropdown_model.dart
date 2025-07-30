import 'package:core/core.dart';

class BaseKeys {
  String? key;
  List<String>? methodItems;
  List<Helper>? helperItems;
  String? methodItem;
  String? helperItem;

  BaseKeys({
    this.key,
    this.methodItems,
    this.helperItems,
    this.methodItem = "=",
    this.helperItem = "",
  });

  BaseKeys.fromJson(Map<String, dynamic> json) {
    key = StringUtils.trimString(json['key']);
    methodItems = json['method'].cast<String>();
    if (json['helper'] != null) {
      helperItems = <Helper>[];
      json['helper'].forEach((v) {
        helperItems!.add(Helper.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['method'] = methodItems;
    if (helperItems != null) {
      data['helper'] = helperItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  BaseKeys copyWith({
    String? key,
    List<String>? methodItems,
    List<Helper>? helperItems,
    String? methodItem,
    String? helperItem,
  }) {
    return BaseKeys(
      key: key ?? this.key,
      methodItems: methodItems ?? this.methodItems,
      helperItems: helperItems ?? this.helperItems,
      methodItem: methodItem ?? this.methodItem,
      helperItem: helperItem ?? this.helperItem,
    );
  }
}

class Helper {
  String? helperId;
  String? helperName;

  Helper({this.helperId, this.helperName});

  Helper.fromJson(Map<String, dynamic> json) {
    helperId = json['helper_id'];
    helperName = json['helper_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['helper_id'] = helperId;
    data['helper_name'] = helperName;
    return data;
  }
}
