import 'package:core/core.dart';
import 'package:flutter/material.dart';
import '../controller/beranda_controller.dart';

// LocationHeader sekarang menjadi StatelessWidget
// Ia menerima instance controller untuk mendapatkan datanya.
class LocationHeader extends StatelessWidget {
  final BerandaController controller;
  const LocationHeader({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 24.0,
        ),
        Row(
          children: [
            // Gunakan icon yang sesuai, ini hanya contoh
            const Icon(Icons.location_on, color: gray900),
            const SizedBox(
              width: 16.0,
            ),
            // Tampilkan lokasi dari controller
            Text(
              controller.locationStatusMessage,
              style: Get.theme.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}
