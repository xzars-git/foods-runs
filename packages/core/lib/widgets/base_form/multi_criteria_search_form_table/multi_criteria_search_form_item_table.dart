import 'package:core/core.dart';
import 'package:core/widgets/base_button/base_dropdown_with_dropdown.dart';
import 'package:flutter/material.dart';

class MultiCriteriaSearchFormItemTable extends StatefulWidget {
  final TextEditingController textController;
  final SearchKeyModelV2? dropdownValue;
  final Function(SearchKeyModelV2?) onChangeKey;
  final Function(String?) onChangeMethod;
  final Function(Suggestion) onChangeSuggestion;
  final Function()? onClickCloseIcon;
  final String methodDefaultValue;
  final Suggestion? suggestionDefaultValue;
  final Map<String, SearchKeyModelV2> mapKeys;

  const MultiCriteriaSearchFormItemTable({
    super.key,
    required this.textController,
    required this.dropdownValue,
    required this.onChangeKey,
    required this.onChangeMethod,
    required this.onChangeSuggestion,
    required this.methodDefaultValue,
    required this.suggestionDefaultValue,
    required this.mapKeys,
    this.onClickCloseIcon,
  });

  @override
  State<MultiCriteriaSearchFormItemTable> createState() =>
      _MultiCriteriaSearchFormItemTableState();
}

class _MultiCriteriaSearchFormItemTableState
    extends State<MultiCriteriaSearchFormItemTable> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildKeyDropdown(),
        const SizedBox(width: 8.0),
        _buildRightSide(),
        _buildCloseButton(),
      ],
    );
  }

  Widget _buildKeyDropdown() {
    return SizedBox(
      width: 125,
      child: BaseDropdownButton(
        asyncItem: (_) => Future.value(widget.mapKeys.values.toList()),
        sortItem: false,
        hint: "Pilih Key",
        value: widget.dropdownValue,
        enabled: true,
        onChanged: widget.onChangeKey,
        itemAsString: (data) => data.asString(),
      ),
    );
  }

  Widget _buildRightSide() {
    return Expanded(
      flex: 9,
      child: Builder(
        builder: (context) {
          final selectedKey = widget.dropdownValue?.key;
          final searchKeyModel = widget.mapKeys[selectedKey];
          final methodOptions = searchKeyModel?.method ?? [];

          if (methodOptions.isEmpty) {
            return const SizedBox.shrink();
          }

          final hasSuggestions = searchKeyModel?.suggestion.isNotEmpty ?? false;

          return hasSuggestions
              ? BaseDropdownWithSuggestionDropdown(
                  leftDropdownOptions: methodOptions,
                  leftDropdownDefaultValue: widget.methodDefaultValue,
                  onChangedLeftDropdown: widget.onChangeMethod,
                  suggestionOptions: searchKeyModel?.suggestion ?? [],
                  onChangeSuggestion: widget.onChangeSuggestion,
                  suggestionValue: widget.suggestionDefaultValue,
                )
              : BaseDropdownWithSearchForm(
                  dropdownOptions: methodOptions,
                  dropdownDefaultValue: widget.methodDefaultValue,
                  textController: widget.textController,
                  onChangedDropdown: widget.onChangeMethod,
                );
        },
      ),
    );
  }

  Widget _buildCloseButton() {
    return widget.onClickCloseIcon == null
        ? const SizedBox.shrink()
        : InkWell(
            onTap: () {
              widget.onClickCloseIcon?.call();
            },
            child: Container(
              height: 42,
              margin: const EdgeInsets.only(left: 8),
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: red800,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: SvgPicture.asset(
                MediaRes.icons.misc.close,
                colorFilter: colorFilterRed800,
              ),
            ),
          );
  }
}
