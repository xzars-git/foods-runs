// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:core/core.dart';
import 'package:flutter/material.dart';

class CallbackData {
  final String key;
  final bool value;

  CallbackData({
    required this.key,
    required this.value,
  });

  CallbackData copyWith({
    String? key,
    bool? value,
  }) {
    return CallbackData(
      key: key ?? this.key,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'value': value,
    };
  }
}

class BaseCheckboxesGenerator extends StatefulWidget {
  final String? label;
  final List<CheckboxMetadata> listCheckbox;
  final Map<String, bool> mapValue;
  final Function(CallbackData) onChangedCallback;
  final bool enable;
  final bool enableSearch;

  const BaseCheckboxesGenerator({
    super.key,
    this.label,
    required this.listCheckbox,
    required this.mapValue,
    required this.onChangedCallback,
    this.enable = true,
    this.enableSearch = false,
  });

  @override
  State<BaseCheckboxesGenerator> createState() =>
      _BaseCheckboxesGeneratorState();
}

class _BaseCheckboxesGeneratorState extends State<BaseCheckboxesGenerator> {
  final TextEditingController _searchController = TextEditingController();
  List<CheckboxMetadata> _filteredCheckboxes = [];

  @override
  void initState() {
    super.initState();
    _filteredCheckboxes = widget.listCheckbox;
  }

  void _filterCheckboxes(String query) {
    setState(() {
      _filteredCheckboxes = widget.listCheckbox
          .where((checkbox) =>
              checkbox.label.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label?.isNotEmpty ?? false)
          Text(
            widget.label!,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        if (widget.enableSearch) ...[
          const SizedBox(height: 8.0),
          BaseForm(
            textEditingController: _searchController,
            hintText: 'Cari...',
            onChanged: _filterCheckboxes,
          ),
          const SizedBox(height: 8.0),
        ],
        StaggeredGrid.count(
          crossAxisCount: getValueForScreenType<int>(
            context: context,
            mobile: 2,
            tablet: 6,
          ),
          crossAxisSpacing: 16,
          mainAxisSpacing: 8,
          children: List.generate(
            _filteredCheckboxes.length,
            (index) => BaseCheckbox(
              value: widget.mapValue[_filteredCheckboxes[index].id] ?? false,
              onChanged: widget.enable
                  ? (value) {
                      widget.onChangedCallback(CallbackData(
                        key: _filteredCheckboxes[index].id,
                        value: value ?? false,
                      ));
                    }
                  : null,
              label: _filteredCheckboxes[index].label,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
