import 'package:core/core.dart';
import 'package:flutter/material.dart';

class BaseDualInkwellSufixCalendar extends StatefulWidget {
  final Function()? onTapClose;
  final Function()? onTapCalendar;
  const BaseDualInkwellSufixCalendar({
    super.key,
    this.onTapClose,
    this.onTapCalendar,
  });

  @override
  State<BaseDualInkwellSufixCalendar> createState() => _BaseDualInkwellSufixCalendarState();
}

class _BaseDualInkwellSufixCalendarState extends State<BaseDualInkwellSufixCalendar> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Row(
        children: [
          widget.onTapClose == null
              ? Container()
              : InkWell(
                  onTap: widget.onTapClose,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: SvgPicture.asset(
                      MediaRes.icons.misc.close,
                      colorFilter: colorFilterRed800,
                    ),
                  ),
                ),
          const SizedBox(
            width: 8.0,
          ),
          InkWell(
            onTap: widget.onTapCalendar,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset(
                MediaRes.icons.misc.calendarMonth,
                colorFilter: colorFilterblue700,
              ),
            ),
          )
        ],
      ),
    );
  }
}
