// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';

class RowDataPrintProgresif extends StatefulWidget {
  final String title;
  final String subtitle;

  const RowDataPrintProgresif({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  State<RowDataPrintProgresif> createState() => _RowDataPrintProgresifState();
}

class _RowDataPrintProgresifState extends State<RowDataPrintProgresif> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            widget.title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  height: 1.5,
                ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ":",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      height: 1.5,
                    ),
              ),
              const SizedBox(
                width: 4.0,
              ),
              Expanded(
                child: Text(
                  widget.subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        height: 1.5,
                      ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
