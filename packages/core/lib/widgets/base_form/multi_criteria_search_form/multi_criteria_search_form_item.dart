import 'package:core/core.dart';
import 'package:core/widgets/base_button/base_dropdown_with_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MultiCriteriaSearchFormItem extends StatelessWidget {
  final TextEditingController textController;
  final String? dropdownValue;
  final Function(String?) onChangeKey;
  final Function(String?) onChangeMethod;
  final Function(Suggestion) onChangeSuggestion;
  final Function()? onClickCloseIcon;
  final String methodDefaultValue;
  final Suggestion? suggestionDefaultValue;
  final Map<String, SearchKeyModel> mapKeys;

  const MultiCriteriaSearchFormItem({
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
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Left Side
        SizedBox(
          width: 100,
          child: BaseDropdownSearch(
            items: mapKeys.keys.toList(),
            hint: "Pilih nama aspek pencarian",
            value: dropdownValue,
            onChanged: (value) {
              onChangeKey(value);
            },
          ),
        ),
        const SizedBox(
          width: 8.0,
        ),
        // Right Side
        Expanded(
          flex: 9,
          child: Builder(
            builder: (context) {
              if (mapKeys[dropdownValue]?.suggestion.isEmpty ?? false) {
                return BaseDropdownWithSearchForm(
                  dropdownOptions: mapKeys[dropdownValue]?.method ?? [],
                  dropdownDefaultValue: methodDefaultValue,
                  textController: textController,
                  onChangedDropdown: (value) {
                    onChangeMethod(value);
                  },
                );
              }

              return BaseDropdownWithSuggestionDropdown(
                leftDropdownOptions: mapKeys[dropdownValue]?.method ?? [],
                leftDropdownDefaultValue: methodDefaultValue,
                onChangedLeftDropdown: (value) {
                  onChangeMethod(value);
                },
                suggestionOptions: mapKeys[dropdownValue]?.suggestion ?? [],
                onChangeSuggestion: onChangeSuggestion,
                suggestionValue: suggestionDefaultValue,
              );
            },
          ),
        ),

        Builder(
          builder: (context) {
            if (onClickCloseIcon != null) {
              return Expanded(
                flex: 3,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 8.0,
                    ),
                    Expanded(
                      child: BaseSecondaryDangerButton(
                        onPressed: onClickCloseIcon,
                        prefixIcon: MediaRes.icons.misc.close,
                      ),
                    ),
                  ],
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
