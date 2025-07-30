import 'package:core/core.dart';
import 'package:flutter/material.dart';

class DialogUbahKataSandiBerhasil extends StatelessWidget {
  const DialogUbahKataSandiBerhasil({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        color: Theme.of(context).colorScheme.surface,
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SvgPicture.asset(isDarkMode(context)
              ? MediaRes.icons.state.successDark
              : MediaRes.icons.state.success),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Perubahan Kata Sandi Berhasil",
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Perubahan kata sandi berhasil, silahkan masuk kembali menggunakan kata sandi baru Anda.",
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
          BasePrimaryButton(
            onPressed: () {
              context.pop();
            },
            text: "Ya, saya mengerti",
          ),
        ],
      ),
    );
  }
}
