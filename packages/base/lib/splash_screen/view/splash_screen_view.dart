import 'package:base/beranda/view/beranda_view.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import '../controller/splash_screen_controller.dart';
import '../widget/dot_widget.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  Widget build(context, SplashScreenController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: neutralWhite,
      body: Stack(
        children: [
          PageView.builder(
            controller: controller.pageController,
            itemCount: controller.onboardingPages.length,
            itemBuilder: (context, index) {
              return controller.onboardingPages[index];
            },
          ),
          // Indikator Titik
          Positioned(
            bottom: 120, // Sesuaikan posisi
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                controller.onboardingPages.length,
                (index) => buildDot(index: index, context: context, controller: controller),
              ),
            ),
          ),
          // Tombol Navigasi
          Positioned(
            bottom: 50, // Sesuaikan posisi
            left: 24,
            right: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: controller.currentPage < controller.onboardingPages.length - 1,
                  child: TextButton(
                    onPressed: () {
                      controller.pageController.jumpToPage(controller.onboardingPages.length - 1);
                      // Tambahkan navigasi ke HomeScreen di sini jika langsung skip
                    },
                    child: const Text(
                      'Lewati',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (controller.currentPage < controller.onboardingPages.length - 1) {
                      controller.pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    } else {
                      SessionSplashScreenDatabase.save(isPassedSplashScreen: true);
                      SessionSplashScreenDatabase.load();
                      if (SessionSplashScreenDatabase.isPassedSplashScreen == true) {
                        newRouter.replace(RouterUtils.beranda);
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    controller.currentPage == controller.onboardingPages.length - 1
                        ? 'Mulai Sekarang!'
                        : 'Lanjut',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  State<SplashScreenView> createState() => SplashScreenController();
}
