// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:core/core.dart';
import 'package:core/widgets/base_form/multi_criteria_search_form_table/jenis_tabel.dart';
import 'package:core/widgets/base_form/multi_criteria_search_form_table/multi_criteria_search_form_item_table.dart';
import 'package:flutter/material.dart';

class MultiCriteriaSearchFormTable extends StatefulWidget {
  final Map<String, SearchKeyModelV2> mapKeys;
  final Function(List<WhereField> whereFields) onSubmitCallback;
  final String defaultKeyValue;
  final List<SearchAspect> defaultSearchAspect;
  final List<SearchAspect> searchAspects;
  final Function(String type) onChangeJenisTabel;
  final Function()? onCreateCallback;

  // Add customization options
  final String searchTitle;
  final String resetButtonText;
  final String addAspectButtonText;
  final String searchButtonText;

  const MultiCriteriaSearchFormTable({
    super.key,
    required this.mapKeys,
    required this.onSubmitCallback,
    required this.defaultKeyValue,
    required this.defaultSearchAspect,
    required this.searchAspects,
    required this.onChangeJenisTabel,
    this.onCreateCallback,
    this.searchTitle = "Cari data berdasarkan", // More generic English default
    this.resetButtonText = "Reset Pencarian",
    this.addAspectButtonText = "Tambah Pencarian",
    this.searchButtonText = "Cari Data",
  });

  @override
  State<MultiCriteriaSearchFormTable> createState() =>
      _MultiCriteriaSearchFormTableState();
}

class _MultiCriteriaSearchFormTableState
    extends State<MultiCriteriaSearchFormTable> {
  BaseDropdownOption? jenisTabelData;
  JenisTabel jenisTabel =
      JenisTabel(roleData: UserDataDatabase.userDataModel.data ?? DataUser());

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
    // Dispose all existing controllers
    for (final aspect in widget.searchAspects) {
      aspect.textController.dispose();
    }

    widget.searchAspects
      ..clear()
      ..addAll(widget.defaultSearchAspect.map(
        (aspect) {
          return SearchAspect(
            keyValue: aspect.keyValue,
            methodValue: aspect.methodValue,
            textController:
                TextEditingController(text: aspect.textController.text),
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

  Widget _buildTableTypeDropdown() {
    return BaseDropdownButton(
      asyncItem: (_) => Future.value(jenisTabel.options),
      label: "Jenis Tabel",
      sortItem: false,
      hint: "Pilih Jenis Tabel",
      value: jenisTabelData,
      enabled: true,
      onChanged: (value) => widget.onChangeJenisTabel(value?.value ?? ""),
      itemAsString: (data) => data.asString(),
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
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: MultiCriteriaSearchFormItemTable(
              mapKeys: widget.mapKeys,
              textController: widget.searchAspects[index].textController,
              dropdownValue:
                  widget.mapKeys[widget.searchAspects[index].keyValue],
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
            ),
          ),
        ),
      ),
      Row(
        children: [
          Expanded(
            child: BaseSecondaryButton(
              prefixIcon: MediaRes.icons.misc.add,
              text: 'Tambah Data',
              onPressed: widget.onCreateCallback,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: BaseSecondaryButton(
              suffixIcon: MediaRes.icons.misc.add,
              text: widget.addAspectButtonText,
              onPressed: addSearchAspect,
            ),
          ),
        ],
      ),
      const SizedBox(height: 8.0),
      BasePrimaryButton(
        suffixIcon: MediaRes.icons.misc.search,
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
          _buildTableTypeDropdown(),
          const SizedBox(height: 8.0),
          ..._buildSearchAspectsList(),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
