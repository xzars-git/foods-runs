import 'package:core/core.dart';
import 'package:flutter/material.dart';

class RectangleAddPhoto extends StatelessWidget {
  const RectangleAddPhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 80,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.surface,
          side: BorderSide(
            width: 1.0,
            color: Theme.of(context).colorScheme.outline,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: null,
        child: const Icon(
          Icons.add,
          color: primaryGreen,
          size: 24.0,
        ),
      ),
    );
  }
}
