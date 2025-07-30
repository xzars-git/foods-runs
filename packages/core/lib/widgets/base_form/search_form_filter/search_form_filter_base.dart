// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:core/core.dart';
import 'package:flutter/material.dart';

class SearchFormFilterBase extends StatefulWidget {
  final Map<String, SearchKeyModelV2> mapKeys;
  final Function(List<WhereField> whereFields) onSubmitCallback;
  final String defaultKeyValue;
  final List<SearchAspectV2> defaultSearchAspect;
  final List<SearchAspectV2> searchAspects;

  // Add customization options
  final String searchTitle;
  final String resetButtonText;
  final String addAspectButtonText;
  final String searchButtonText;

  const SearchFormFilterBase({
    super.key,
    required this.mapKeys,
    required this.onSubmitCallback,
    required this.defaultKeyValue,
    required this.defaultSearchAspect,
    required this.searchAspects,
    this.searchTitle = "Cari data berdasarkan", // More generic English default
    this.resetButtonText = "Reset Pencarian",
    this.addAspectButtonText = "Tambah Aspek Pencarian",
    this.searchButtonText = "Cari Data",
  });

  @override
  State<SearchFormFilterBase> createState() => _SearchFormFilterBaseState();
}

class _SearchFormFilterBaseState extends State<SearchFormFilterBase> {
  BaseDropdownOption? jenisTabelData;

  SearchAspectV2 generateFreshSearchAspect() {
    return SearchAspectV2(
      keyWidget: StringUtils.generateRandomString(10),
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
    if (mounted) {
      widget.searchAspects.removeAt(index);
      update();
    }
  }

  void resetSearchAspect() {
    widget.searchAspects
      ..clear()
      ..addAll(widget.defaultSearchAspect.map(
        (aspect) {
          return SearchAspectV2(
            keyWidget: StringUtils.generateRandomString(10),
            keyValue: aspect.keyValue,
            methodValue: aspect.methodValue,
            textController: TextEditingController(text: aspect.textController.text),
            suggestion: aspect.suggestion,
          );
        },
      ));

    update();
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

  // Extract widget building methods for better readability
  Widget _buildHeader() {
    return Row(
      children: [
        Text(
          widget.searchTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Spacer(),
        widget.mapKeys.isEmpty
            ? const SizedBox.shrink()
            : InkWell(
                onTap: resetSearchAspect,
                child: Text(widget.resetButtonText),
              )
      ],
    );
  }

  List<Widget> _buildSearchAspectsList() {
    if (widget.mapKeys.isEmpty) {
      return [
        const Expanded(child: SizedBox.shrink()),
      ];
    }

    return [
      Expanded(
          child: ListView.builder(
              itemCount: widget.searchAspects.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: SearchFormItemFilterBase(
                    key: ValueKey(widget.searchAspects[index].keyWidget),
                    mapKeys: widget.mapKeys,
                    textController: widget.searchAspects[index].textController,
                    dropdownValue: widget.mapKeys[widget.searchAspects[index].keyValue],
                    onClickCloseIcon: () => removeSearchAspect(index),
                    methodDefaultValue: widget.searchAspects[index].methodValue,
                    onChangeKey: (value) => _handleKeyChange(index, value),
                    onChangeMethod: (value) {
                      widget.searchAspects[index].methodValue = value!;
                    },
                    onChangeSuggestion: (suggestion) {
                      widget.searchAspects[index].suggestion = suggestion;
                    },
                    suggestionDefaultValue: widget.searchAspects[index].suggestion,
                    onSelectedSuggestion: (suggestion) {
                      widget.searchAspects[index].suggestion = suggestion;
                    },
                  ),
                );
              })),
      BaseSecondaryButton(
        prefixIcon: MediaRes.icons.misc.add,
        text: widget.addAspectButtonText,
        onPressed: addSearchAspect,
      ),
      const SizedBox(height: 8.0),
      BasePrimaryButton(
        text: widget.searchButtonText,
        onPressed: () => widget.onSubmitCallback(getValues()),
      ),
    ];
  }

  void _handleKeyChange(int index, SearchKeyModelV2? value) {
    widget.searchAspects[index].keyValue = value?.key ?? "";
    widget.searchAspects[index].suggestion = null;
    widget.searchAspects[index].textController.text = '';
    update();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 8.0),
          ..._buildSearchAspectsList(),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
