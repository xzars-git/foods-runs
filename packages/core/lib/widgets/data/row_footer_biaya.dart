import 'package:core/core.dart';
import 'package:flutter/material.dart';

class RowFooterBiaya extends StatelessWidget {
  final String total;

  const RowFooterBiaya({
    super.key,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
      return Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              "TOTAL",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          SizedBox(
            width: state.isDrawerExpanded ? 20 : 24,
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
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Expanded(
            flex: 5,
            child: Text(
              total,
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ],
      );
    });
  }
}
