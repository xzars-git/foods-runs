import 'package:auth/ubah_kata_sandi/controller/ubah_kata_sandi_controller.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class DialogKonfirmasiUbaKataSandi extends StatelessWidget {
  final UbahKataSandiController controller;

  const DialogKonfirmasiUbaKataSandi({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: Theme.of(context).colorScheme.surface,
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Konfirmasi Perubahan Kata Sandi",
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.apply(color: primaryGreen),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Apakah Anda yakin ingin merubah kata sandi?",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: BaseSecondaryButton(
                  onPressed: () {
                    Get.back();
                  },
                  text: "Batal",
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: BasePrimaryButton(
                  onPressed: () {
                    Get.back();
                    controller.updatePassword(context);
                  },
                  text: "Ya, saya yakin",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
