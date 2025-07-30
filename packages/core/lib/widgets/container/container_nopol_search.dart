import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContainerNopolSearch extends StatefulWidget {
  final ValueChanged<String> onChangedNoPolisi1;
  final ValueChanged<String> onChangedNoPolisi2;
  final ValueChanged<String> onChangedNoPolisi3;
  final VoidCallback onPressedCari;
  final VoidCallback? onEditComplete;
  final FocusNode focusNodeNoPolisi1;
  final FocusNode focusNodeNoPolisi2;
  final FocusNode focusNodeNoPolisi3;

  const ContainerNopolSearch({
    super.key,
    required this.onChangedNoPolisi1,
    required this.onChangedNoPolisi2,
    required this.onChangedNoPolisi3,
    required this.onPressedCari,
    this.onEditComplete,
    required this.focusNodeNoPolisi1,
    required this.focusNodeNoPolisi2,
    required this.focusNodeNoPolisi3,
  });

  @override
  State<ContainerNopolSearch> createState() => _ContainerNopolSearchState();
}

class _ContainerNopolSearchState extends State<ContainerNopolSearch> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BaseForm(
            hintText: "X",
            textAlign: TextAlign.center,
            textInputFormater: [
              UpperCaseTextFormatter(),
              FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
            ],
            maxLenght: 1,
            onChanged: widget.onChangedNoPolisi1,
            focusNode: widget.focusNodeNoPolisi1,
            onEditComplete: widget.onEditComplete,
          ),
        ),
        const SizedBox(
          width: 8.0,
        ),
        Expanded(
          flex: 2,
          child: BaseForm(
            hintText: "XXXX",
            textAlign: TextAlign.center,
            textInputType: TextInputType.number,
            maxLenght: 4,
            textInputFormater: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
            onChanged: widget.onChangedNoPolisi2,
            focusNode: widget.focusNodeNoPolisi2,
            onEditComplete: widget.onEditComplete,
          ),
        ),
        const SizedBox(
          width: 8.0,
        ),
        Expanded(
          flex: 2,
          child: BaseForm(
            hintText: "XXX",
            textAlign: TextAlign.center,
            textInputFormater: [
              UpperCaseTextFormatter(),
              FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
            ],
            maxLenght: 3,
            onChanged: widget.onChangedNoPolisi3,
            focusNode: widget.focusNodeNoPolisi3,
            onEditComplete: widget.onEditComplete,
          ),
        ),
        const SizedBox(
          width: 8.0,
        ),
        BasePrimaryButton(
          isDense: true,
          text: "Cari",
          suffixIcon: MediaRes.icons.misc.search,
          height: 50,
          onPressed: widget.onPressedCari,
        ),
        Expanded(
          flex: getValueForScreenType<int>(
            context: context,
            mobile: 0,
            tablet: 4,
          ),
          child: Container(),
        ),
      ],
    );
  }
}
