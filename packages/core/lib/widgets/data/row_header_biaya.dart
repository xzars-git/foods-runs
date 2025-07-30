import 'package:flutter/material.dart';

class RowHeaderBiaya extends StatelessWidget {
  const RowHeaderBiaya({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            "",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Text(
          "",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(
          width: 8.0,
        ),
        Text(
          "",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Expanded(
          child: Text(
            "POKOK",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
        const SizedBox(
          width: 8.0,
        ),
        Text(
          "",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Expanded(
          child: Text(
            "DENDA",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
        const SizedBox(
          width: 8.0,
        ),
        Text(
          "",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Expanded(
          child: Text(
            "OPSEN POKOK",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
        const SizedBox(
          width: 8.0,
        ),
        Text(
          "",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Expanded(
          child: Text(
            "OPSEN DENDA",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
      ],
    );
  }
}
