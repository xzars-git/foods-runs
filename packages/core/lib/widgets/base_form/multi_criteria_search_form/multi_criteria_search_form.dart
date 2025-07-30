// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:core/core.dart';
import 'package:core/widgets/base_form/multi_criteria_search_form/multi_criteria_search_form_item.dart';
import 'package:flutter/material.dart';

class MultiCriteriaSearchForm extends StatefulWidget {
  final List<String>? tableColumns;
  final Map<String, SearchKeyModel> mapKeys;
  final Function(List<WhereField> whereFields) onSubmitCallback;
  final String defaultKeyValue;
  final List<SearchAspect> searchAspects;

  // Add customization options
  final String searchTitle;
  final String resetButtonText;
  final String addAspectButtonText;
  final String searchButtonText;

  const MultiCriteriaSearchForm({
    super.key,
    required this.tableColumns,
    required this.mapKeys,
    required this.onSubmitCallback,
    required this.defaultKeyValue,
    required this.searchAspects,
    this.searchTitle = "Cari data berdasarkan", // Default in English
    this.resetButtonText = "Reset Pencarian",
    this.addAspectButtonText = "Tambah Aspek Pencarian",
    this.searchButtonText = "Cari Data",
  });

  @override
  State<MultiCriteriaSearchForm> createState() => _MultiCriteriaSearchFormState();
}

class _MultiCriteriaSearchFormState extends State<MultiCriteriaSearchForm> {
  @override
  void initState() {
    super.initState();
  }

  SearchAspect generateFreshSearchAspect() {
    return SearchAspect(
      keyValue: widget.defaultKeyValue,
      methodValue: "=",
      textController: TextEditingController(),
    );
  }

  // Function to add a new search aspect
  void addSearchAspect() {
    widget.searchAspects.add(generateFreshSearchAspect());
    update();
  }

  // Function to remove a search aspect by index
  void removeSearchAspect(int index) {
    widget.searchAspects[index].textController.dispose();
    widget.searchAspects.removeAt(index);
    update();
  }

  void resetSearchAspect() {
    for (var i = 0; i < widget.searchAspects.length; i++) {
      widget.searchAspects[i].textController.dispose();
    }

    widget.searchAspects.clear();

    addSearchAspect();
  }

  List<WhereField> getValues() {
    return widget.searchAspects
        .map((aspect) => WhereField(
              key: aspect.keyValue,
              method: aspect.methodValue,
              value: aspect.suggestion?.value ?? aspect.textController.text,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Cari data berdasarkan",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Expanded(
                child: Container(),
              ),
              InkWell(
                child: const Text("Reset Pencarian"),
                onTap: () {
                  resetSearchAspect();
                },
              )
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.searchAspects.length,
              itemBuilder: (context, index) {
                return Padding(
                  // key: ValueKey(DateTime.now().toString()),
                  padding: const EdgeInsets.only(bottom: 8),
                  child: MultiCriteriaSearchFormItem(
                    mapKeys: widget.mapKeys,
                    textController: widget.searchAspects[index].textController,
                    dropdownValue: widget.searchAspects[index].keyValue,
                    onClickCloseIcon: () => removeSearchAspect(index),
                    methodDefaultValue: widget.searchAspects[index].methodValue,
                    onChangeKey: (value) {
                      widget.searchAspects[index].keyValue = value ?? "";
                      widget.searchAspects[index].suggestion = null;
                      widget.searchAspects[index].textController.text = '';
                      update();
                    },
                    onChangeMethod: (value) {
                      widget.searchAspects[index].methodValue = value!;
                    },
                    onChangeSuggestion: (p0) {
                      widget.searchAspects[index].suggestion = p0;
                    },
                    suggestionDefaultValue: widget.searchAspects[index].suggestion,
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          BaseSecondaryButton(
            prefixIcon: MediaRes.icons.misc.add,
            text: "Tambah Aspek Pencarian",
            onPressed: addSearchAspect,
          ),
          const SizedBox(
            height: 8.0,
          ),
          BasePrimaryButton(
            text: "Cari Data",
            onPressed: () {
              widget.onSubmitCallback(getValues());
            },
          )
        ],
      ),
    );
  }
}
