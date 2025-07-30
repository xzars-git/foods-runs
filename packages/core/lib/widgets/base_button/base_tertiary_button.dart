import 'package:flutter/material.dart';
import 'package:core/core.dart';

class BaseTertiaryButton extends StatefulWidget {
  final Function()? onPressed;
  final String? text;
  final String? prefixIcon;
  final String? suffixIcon;
  final bool? isDense;

  final Color colorPrimary;
  final Color colorOnHover;

  const BaseTertiaryButton({
    super.key,
    required this.onPressed,
    this.text,
    this.prefixIcon,
    this.suffixIcon,
    this.isDense,
    this.colorPrimary = blue700,
    this.colorOnHover = green900,
  });

  @override
  State<BaseTertiaryButton> createState() => _BaseTertiaryButtonState();
}

class _BaseTertiaryButtonState extends State<BaseTertiaryButton> {
  bool onHover = false;

  ColorFilter generateColorFilter() {
    if (widget.onPressed == null) {
      return colorFilterGray400;
    }

    if (onHover) {
      return ColorFilter.mode(widget.colorOnHover, BlendMode.srcIn);
    }

    return ColorFilter.mode(widget.colorPrimary, BlendMode.srcIn);
  }

  Color generateTextColor() {
    if (widget.onPressed == null) return gray400;

    if (onHover) return widget.colorOnHover;

    return widget.colorPrimary;
  }

  @override
  Widget build(BuildContext context) {
    Color textColor = generateTextColor();

    ColorFilter colorFilter = generateColorFilter();

    return SizedBox(
      width: widget.isDense ?? false ? null : MediaQuery.of(context).size.width,
      child: OutlinedButton(
        style: ButtonStyle(
          padding: const MaterialStatePropertyAll(EdgeInsets.zero),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          backgroundColor: MaterialStateProperty.all<Color>(onHover ? gray200 : Colors.transparent),
          side: MaterialStateProperty.all<BorderSide>(
            BorderSide(
              color: widget.onPressed != null ? Colors.transparent : Colors.transparent,
            ),
          ),
          overlayColor: MaterialStateProperty.all<Color>(onHover ? gray200 : Colors.transparent),
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
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: textColor,
                              height: 1.75,
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
