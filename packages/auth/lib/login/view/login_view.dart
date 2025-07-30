import 'package:core/core.dart';
import 'package:flutter/material.dart';
import '../controller/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  Widget build(context, LoginController controller) {
    controller.view = this;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                color: primaryBlue, // Warna background
                child: CustomPaint(
                  painter: GridPainter(),
                ),
              ),
              ScreenTypeLayout.builder(
                mobile: (BuildContext context) => SizedBox(
                  height: MediaQuery.of(context).size.height - 24,
                  child: _contentLogin(
                    context,
                    controller,
                  ),
                ),
                tablet: (BuildContext context) => Center(
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height + 41,
                    ),
                    width: MediaQuery.of(context).size.width / 2,
                    child: _contentLogin(context, controller),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _contentLogin(BuildContext context, LoginController controller) {
    return SingleChildScrollView(
      child: IntrinsicHeight(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 104.0,
              ),
              Center(
                child: Text(
                  "Versi ${VersionDatabase.version} (${VersionDatabase.versionShoreBird})",
                  style: Get.theme.textTheme.bodyMedium?.copyWith(
                    color: Get.theme.colorScheme.onPrimary,
                  ),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Text(
                "Wilujeng Sumping!",
                style: Get.theme.textTheme.displayMedium?.copyWith(
                  color: Get.theme.colorScheme.onPrimary,
                ),
              ),
              Text(
                "Selamat datang! Silakan masuk untuk mengakses layanan kami.",
                style: Get.theme.textTheme.bodyMedium?.copyWith(
                  color: Get.theme.colorScheme.onPrimary,
                  height: 1.5,
                ),
              ),
              const SizedBox(
                height: 32.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Get.theme.colorScheme.surface,
                  border: Border.all(
                    color: Get.theme.colorScheme.outline,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      12,
                    ),
                  ),
                ),
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Masuk",
                        style: Get.theme.textTheme.displaySmall,
                      ),
                      Text(
                        "Silakan masuk menggunakan username dan kata sandi.",
                        style: Get.theme.textTheme.bodyLarge?.copyWith(
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(
                        height: 32.0,
                      ),
                      BaseForm(
                        label: "Username",
                        hintText: "Masukkan username Anda",
                        validator: Validatorless.required("Username tidak boleh kosong"),
                        onChanged: (value) {
                          controller.username = value;
                          controller.update();
                        },
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      BaseForm(
                        label: "Kata Sandi",
                        hintText: "Masukkan Kata Sandi Anda",
                        validator: Validatorless.required("Kata sandi tidak boleh kosong"),
                        obsecure: controller.obscureText,
                        suffixIcon: controller.obscureText
                            ? MediaRes.icons.input.eyeOn
                            : MediaRes.icons.input.eyeOff,
                        onTapSuffix: () {
                          controller.obscureText = !controller.obscureText;
                          controller.update();
                        },
                        onChanged: (value) {
                          controller.password = value;
                          controller.update();
                        },
                        onEditComplete: () {
                          if (controller.formKey.currentState!.validate()) {
                            controller.doLogin();
                          }
                        },
                      ),
                      const SizedBox(
                        height: 32.0,
                      ),
                      BasePrimaryButton(
                        text: "Masuk",
                        onPressed: () {
                          if (controller.formKey.currentState!.validate()) {
                            controller.doLogin();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              const Spacer(),
              Center(
                child: SvgPicture.asset(
                  MediaRes.images.logo.bapendaGrey,
                  colorFilter: ColorFilter.mode(
                    Get.theme.colorScheme.onSecondary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<LoginView> createState() => LoginController();
}

class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const double vertical = 47; // Ukuran kotak dalam grid
    const double horizontal = 100; // Ukuran kotak dalam grid
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.2) // Warna garis tipis
      ..strokeWidth = 1; // Ketebalan garis

    // Menggambar garis vertikal
    for (double x = 0; x <= size.width; x += vertical) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    // Menggambar garis horizontal
    for (double y = 0; y <= size.height; y += horizontal) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
