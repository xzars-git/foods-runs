import 'package:flutter/material.dart';
import 'package:core/core.dart';

class BaseSecondaryDangerButton extends StatefulWidget {
  final Function()? onPressed;
  final String? text;
  final String? prefixIcon;
  final String? suffixIcon;
  final bool? isDense;

  const BaseSecondaryDangerButton({
    super.key,
    required this.onPressed,
    this.text,
    this.prefixIcon,
    this.suffixIcon,
    this.isDense,
  });

  @override
  State<BaseSecondaryDangerButton> createState() =>
      _BaseSecondaryDangerButtonState();
}

class _BaseSecondaryDangerButtonState extends State<BaseSecondaryDangerButton> {
  bool onHover = false;
  @override
  Widget build(BuildContext context) {
    Color textColor = widget.onPressed != null
        ? onHover
            ? red900
            : red700
        : gray400;

    ColorFilter colorFilter = widget.onPressed != null
        ? onHover
            ? customColorFilter(color: red900)
            : customColorFilter(color: red700)
        : colorFilterGray400;
    return SizedBox(
      width: widget.isDense ?? false ? null : MediaQuery.of(context).size.width,
      child: OutlinedButton(
        style: ButtonStyle(
          padding: const MaterialStatePropertyAll(EdgeInsets.zero),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          // backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          side: MaterialStateProperty.all<BorderSide>(
            BorderSide(
              color: widget.onPressed != null
                  ? onHover
                      ? red900
                      : red700
                  : gray400,
            ),
          ),
          overlayColor: MaterialStateProperty.all<Color>(
              onHover ? gray200 : neutralWhite),
        ),
        onFocusChange: (value) {
          setState(
            () {
              onHover = value;
            },
          );
        },
        onHover: (value) {
          setState(
            () {
              onHover = value;
            },
          );
        },
        onPressed: widget.onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: SingleChildScrollView(
            controller: ScrollController(),
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StringUtils.trimString(widget.prefixIcon).isNotEmpty
                    ? SvgPicture.asset(
                        StringUtils.trimString(widget.prefixIcon),
                        colorFilter: colorFilter,
                      )
                    : Container(),
                StringUtils.trimString(widget.prefixIcon).isNotEmpty &&
                        StringUtils.trimString(widget.text).isNotEmpty
                    ? const SizedBox(
                        width: 8.0,
                      )
                    : Container(),
                StringUtils.trimString(widget.text).isNotEmpty
                    ? Text(
                        StringUtils.trimString(widget.text),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              height: 1.75,
                              color: textColor,
                            ),
                        textHeightBehavior: const TextHeightBehavior(
                          leadingDistribution: TextLeadingDistribution.even,
                        ),
                      )
                    : Container(),
                StringUtils.trimString(widget.suffixIcon).isNotEmpty &&
                        StringUtils.trimString(widget.text).isNotEmpty
                    ? const SizedBox(
                        width: 8.0,
                      )
                    : Container(),
                StringUtils.trimString(widget.suffixIcon).isNotEmpty
                    ? SvgPicture.asset(
                        StringUtils.trimString(widget.suffixIcon),
                        colorFilter: colorFilter,
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
