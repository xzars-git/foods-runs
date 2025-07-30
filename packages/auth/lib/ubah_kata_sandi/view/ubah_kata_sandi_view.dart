import 'package:core/core.dart';
import 'package:flutter/material.dart';
import '../controller/ubah_kata_sandi_controller.dart';

class UbahKataSandiView extends StatefulWidget {
  const UbahKataSandiView({super.key});

  Widget build(context, UbahKataSandiController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ubah Kata Sandi"),
      ),
      body: SingleChildScrollView(
        controller: controller.scrollController,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: ScreenTypeLayout.builder(
            mobile: (BuildContext context) => SizedBox(
              height: MediaQuery.of(context).size.height - 24,
              child: _contentUbahKataSandi(
                context: context,
                controller: controller,
              ),
            ),
            tablet: (BuildContext context) => Center(
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height + 100,
                ),
                width: MediaQuery.of(context).size.width / 2,
                child: _contentUbahKataSandi(
                  context: context,
                  controller: controller,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _contentUbahKataSandi({
    required BuildContext context,
    required UbahKataSandiController controller,
  }) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SvgPicture.asset(
            isDarkMode(context)
                ? MediaRes.images.ilustrasi.ubahKataSandiDark
                : MediaRes.images.ilustrasi.ubahKataSandi,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  12,
                ),
              ),
              color: Theme.of(context).colorScheme.surface,
              border: Border.all(
                color: Theme.of(context).colorScheme.outline,
                width: 1,
              ),
            ),
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: controller.ubahSandiKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Buat kata sandi baru",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  Text(
                    "Kata sandi baru harus berbeda dari kata sandi sebelumnya",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.4),
                  ),
                  const SizedBox(height: 16.0),
                  BaseForm(
                    focusNode: controller.form1FocusNode,
                    label: "Kata Sandi Lama",
                    hintText: "Masukan kata sandi lama Anda",
                    suffixIcon: controller.obscurePassLama
                        ? MediaRes.icons.input.eyeOff
                        : MediaRes.icons.input.eyeOn,
                    obsecure: controller.obscurePassLama,
                    onTapSuffix: () {
                      controller.obscurePassLama = !controller.obscurePassLama;
                      controller.update();
                    },
                    textEditingController: controller.oldPasswordController,
                    validator: Validatorless.required("Kata sandi lama tidak boleh kosong"),
                  ),
                  const SizedBox(height: 16.0),
                  BaseForm(
                    label: "Kata Sandi Baru",
                    hintText: "Masukan kata sandi baru Anda",
                    suffixIcon: controller.obscurePassBaru
                        ? MediaRes.icons.input.eyeOff
                        : MediaRes.icons.input.eyeOn,
                    obsecure: controller.obscurePassBaru,
                    onTapSuffix: () {
                      controller.obscurePassBaru = !controller.obscurePassBaru;
                      controller.update();
                    },
                    textEditingController: controller.newPasswordController,
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required("Kata sandi baru tidak boleh kosong"),
                        Validatorless.min(6, "Kata sandi minimal 6 karakter"),
                        Validatorless.regex(RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$'),
                            "Kata sandi harus mengandung huruf dan angka"),
                        Validatorless.compare(
                          controller.confirmPasswordController,
                          "Kata sandi tidak sama",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  BaseForm(
                    label: "Konfirmasi Kata Sandi Baru",
                    hintText: "Masukan kata sandi baru Anda",
                    suffixIcon: controller.obscureKonfirmPassBaru
                        ? MediaRes.icons.input.eyeOff
                        : MediaRes.icons.input.eyeOn,
                    obsecure: controller.obscureKonfirmPassBaru,
                    onTapSuffix: () {
                      controller.obscureKonfirmPassBaru = !controller.obscureKonfirmPassBaru;
                      controller.update();
                    },
                    textEditingController: controller.confirmPasswordController,
                    validator: Validatorless.multiple([
                      Validatorless.required("Kata sandi baru tidak boleh kosong"),
                      Validatorless.min(6, "Kata sandi minimal 6 karakter"),
                      Validatorless.regex(RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$'),
                          "Kata sandi harus mengandung huruf dan angka"),
                      Validatorless.compare(
                        controller.newPasswordController,
                        "Kata sandi tidak sama",
                      ),
                    ]),
                  ),
                  const SizedBox(height: 16.0),
                  BaseCardInfo(
                    text: Text(
                      "Kata sandi minimal 6 karakter dengan kombinasi huruf dan angka.",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            height: 1.5,
                          ),
                    ),
                    pathIconPrefix: MediaRes.icons.message.info,
                    type: DataColorType.info,
                  ),
                  const SizedBox(height: 32.0),
                  BasePrimaryButton(
                    onPressed: () {
                      if (controller.ubahSandiKey.currentState!.validate()) {
                        showDialogBase(
                          content: ContentDialogKonfirmasi(
                            dialogType: DialogType.primary,
                            titleLabel: "Konfirmasi Perubahan Kata Sandi",
                            textDescriptionString: "Apakah Anda yakin ingin merubah kata sandi?",
                            cancelLabel: "Batal",
                            confirmLabel: "Ya, saya yakin",
                            onConfirmCallback: () {
                              Get.back();
                              controller.updatePassword(context);
                            },
                          ),
                        );
                      }
                    },
                    text: "Simpan",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  State<UbahKataSandiView> createState() => UbahKataSandiController();
}
