import 'package:core/core.dart';
import 'package:flutter/material.dart';

class FilterButtonPlat extends StatefulWidget {
  final String value;
  final Function()? onPressed;
  final bool status;
  final Color warnaPlat;
  final Color warnaFont;

  const FilterButtonPlat({
    super.key,
    required this.value,
    required this.onPressed,
    required this.status,
    required this.warnaPlat,
    required this.warnaFont,
  });

  @override
  State<FilterButtonPlat> createState() => _FilterButtonPlatState();
}

class _FilterButtonPlatState extends State<FilterButtonPlat> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: widget.status ? widget.warnaPlat : neutralWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(27),
            side: const BorderSide(color: blueGray50),
          ),
        ),
        onPressed: widget.onPressed,
        child: Row(
          mainAxisAlignment:
              widget.status ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                ),
                child: Text(
                  widget.value,
                  textAlign: widget.status ? TextAlign.left : TextAlign.center,
                  style: myTextThemeLight.titleMedium?.copyWith(
                    color: widget.status ? widget.warnaFont : gray900,
                  ),
                ),
              ),
            ),
            widget.status
                ? SvgPicture.asset(
                    MediaRes.icons.misc.check,
                    width: 16,
                  )
                : Container(),
          ],
        ));
  }
}
