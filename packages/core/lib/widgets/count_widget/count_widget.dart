import 'package:core/core.dart';
import 'package:flutter/material.dart';

class CountWidget extends StatefulWidget {
  final Null Function()? onTapMin;
  final Null Function()? onTapAdd;
  final bool statusColorMin;
  final bool statusColorAdd;
  final String numberPrint;

  const CountWidget({
    super.key,
    required this.onTapMin,
    required this.onTapAdd,
    required this.statusColorMin,
    required this.statusColorAdd,
    required this.numberPrint,
  });

  @override
  State<CountWidget> createState() => _CountWidgetState();
}

class _CountWidgetState extends State<CountWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        border:
            Border.all(color: Theme.of(context).colorScheme.outline, width: 2),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32),
              bottomLeft: Radius.circular(32),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: widget.onTapMin,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                    top: 12.5,
                    bottom: 12.5,
                  ),
                  child: SvgPicture.asset(
                    MediaRes.icons.misc.checkIndeterminateSmall,
                    colorFilter: ColorFilter.mode(
                      widget.statusColorMin
                          ? Theme.of(context).colorScheme.onSurface
                          : Theme.of(context).colorScheme.onTertiary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
          Text(
            widget.numberPrint,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(
            width: 16.0,
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: widget.onTapAdd,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 12,
                    top: 12.5,
                    bottom: 12.5,
                  ),
                  child: SvgPicture.asset(
                    MediaRes.icons.misc.add,
                    colorFilter: ColorFilter.mode(
                      widget.statusColorAdd
                          ? Theme.of(context).colorScheme.onSurface
                          : Theme.of(context).colorScheme.onTertiary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
