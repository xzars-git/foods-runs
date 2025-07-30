import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContainerNomorPolisi extends StatefulWidget {
  final String? initialValue;
  final Color warnaPlat;
  final Color warnaBorder;
  final Color warnaFont;
  final Color warnaPlaceholder;
  final Function(String? value) onChangedTextfieldOne;
  final Function(String? value) onChangedTextfieldTwo;
  final Function(String? value) onChangedTextfieldThree;
  final FocusNode focusNode1;
  final FocusNode focusNode2;
  final FocusNode focusNode3;
  final Function()? onInitState;
  final Function()? onEditingComplete;
  const ContainerNomorPolisi({
    super.key,
    this.initialValue,
    required this.warnaPlat,
    required this.warnaBorder,
    required this.warnaFont,
    required this.warnaPlaceholder,
    required this.onChangedTextfieldOne,
    required this.onChangedTextfieldTwo,
    required this.onChangedTextfieldThree,
    required this.focusNode1,
    required this.focusNode2,
    required this.focusNode3,
    this.onEditingComplete,
    this.onInitState,
  });

  @override
  State<ContainerNomorPolisi> createState() => _ContainerNomorPolisiState();
}

class _ContainerNomorPolisiState extends State<ContainerNomorPolisi> {
  @override
  void initState() {
    super.initState();
    widget.onInitState;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 144,
      decoration: BoxDecoration(
        color: widget.warnaPlat,
        borderRadius: const BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          border: Border.all(color: widget.warnaBorder),
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                initialValue: widget.initialValue,
                focusNode: widget.focusNode1,
                cursorColor: widget.warnaFont,
                cursorHeight: 82,
                keyboardType: TextInputType.text,
                inputFormatters: [
                  UpperCaseTextFormatter(),
                  FilteringTextInputFormatter.allow(RegExp('[A-Za-z]'))
                ],
                textAlign: TextAlign.center,
                style: largestBebasNeue.copyWith(color: widget.warnaFont),
                maxLength: 1,
                decoration: InputDecoration(
                  hintText: "XX",
                  border: InputBorder.none,
                  counterText: "",
                  hintStyle: largestBebasNeue.copyWith(color: widget.warnaFont),
                  labelStyle: TextStyle(
                    color: widget.warnaFont,
                  ),
                ),
                onChanged: widget.onChangedTextfieldOne,
              ),
            ),
            Expanded(
              flex: 2,
              child: TextFormField(
                focusNode: widget.focusNode2,
                cursorColor: widget.warnaFont,
                cursorHeight: 82,
                autofocus: true,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                textAlign: TextAlign.center,
                style: largestBebasNeue.copyWith(color: widget.warnaFont),
                maxLength: 4,
                decoration: InputDecoration(
                  hintText: "XXXX",
                  border: InputBorder.none,
                  counterText: "",
                  hintStyle: largestBebasNeue.copyWith(color: widget.warnaFont),
                  labelStyle: TextStyle(
                    color: widget.warnaFont,
                  ),
                ),
                onChanged: widget.onChangedTextfieldTwo,
              ),
            ),
            Expanded(
              flex: 2,
              child: TextFormField(
                focusNode: widget.focusNode3,
                cursorColor: widget.warnaFont,
                cursorHeight: 82,
                keyboardType: TextInputType.text,
                inputFormatters: [
                  UpperCaseTextFormatter(),
                  FilteringTextInputFormatter.allow(RegExp('[A-Za-z]'))
                ],
                textAlign: TextAlign.center,
                style: largestBebasNeue.copyWith(color: widget.warnaFont),
                maxLength: 3,
                onEditingComplete: widget.onEditingComplete,
                decoration: InputDecoration(
                  hintText: "XXX",
                  border: InputBorder.none,
                  counterText: "",
                  hintStyle: largestBebasNeue.copyWith(
                    color: widget.warnaFont,
                  ),
                  labelStyle: TextStyle(
                    color: widget.warnaFont,
                  ),
                ),
                onChanged: widget.onChangedTextfieldThree,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
