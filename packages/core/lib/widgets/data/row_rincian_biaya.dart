import 'package:core/core.dart';
import 'package:flutter/material.dart';

class RowRincianBiaya extends StatefulWidget {
  final String title;
  final String pokok;
  final String denda;
  final String opsenPokok;
  final String opsenDenda;

  const RowRincianBiaya({
    super.key,
    required this.title,
    required this.pokok,
    required this.denda,
    required this.opsenPokok,
    required this.opsenDenda,
  });

  @override
  State<RowRincianBiaya> createState() => _RowRincianBiayaState();
}

class _RowRincianBiayaState extends State<RowRincianBiaya> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            widget.title,
            style: bodyXSmall(context),
          ),
        ),
        Text(
          ":",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(
          width: 8.0,
        ),
        Text(
          "Rp",
          style: bodyXSmall(context),
        ),
        Expanded(
          child: Text(
            widget.pokok,
            textAlign: TextAlign.right,
            style: bodyXSmall(context),
          ),
        ),
        const SizedBox(
          width: 8.0,
        ),
        Text(
          "Rp",
          style: bodyXSmall(context),
        ),
        Expanded(
          child: Text(
            widget.denda,
            textAlign: TextAlign.right,
            style: bodyXSmall(context),
          ),
        ),
        const SizedBox(
          width: 8.0,
        ),
        Text(
          "Rp",
          style: bodyXSmall(context),
        ),
        Expanded(
          child: Text(
            widget.opsenPokok,
            textAlign: TextAlign.right,
            style: bodyXSmall(context),
          ),
        ),
        const SizedBox(
          width: 8.0,
        ),
        Text(
          "Rp",
          style: bodyXSmall(context),
        ),
        Expanded(
          child: Text(
            widget.opsenDenda,
            textAlign: TextAlign.right,
            style: bodyXSmall(context),
          ),
        ),
      ],
    );
  }
}
