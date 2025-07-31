import 'package:core/core.dart';
import 'package:flutter/material.dart';

class LocationHeader extends StatefulWidget {
  const LocationHeader({super.key});

  @override
  State<LocationHeader> createState() => _LocationHeaderState();
}

class _LocationHeaderState extends State<LocationHeader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 24.0,
        ),
        Row(
          children: [
            SvgPicture.asset(
              MediaRes.images.svg.location,
            ),
            const SizedBox(
              width: 16.0,
            ),
            Text(
              "Freedom way, Lekki phase",
              style: Get.theme.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}
