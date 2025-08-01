import 'package:base/base.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import '../controller/daftar_menu_controller.dart';
import 'dart:math' as math;

import '../widget/form_search.dart';

class DaftarMenuView extends StatefulWidget {
  const DaftarMenuView({super.key});

  Widget build(context, DaftarMenuController controller) {
    controller.view = this;

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: neutralWhite,
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: gray500,
                blurRadius: 16,
              ),
            ],
            borderRadius: BorderRadius.only(
              // <--- Add this for rounded corners
              topLeft: Radius.circular(36), // Adjust the radius as needed
              topRight: Radius.circular(36), // Adjust the radius as needed
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              // Match the border radius here
              topLeft: Radius.circular(36),
              topRight: Radius.circular(36),
            ),
            child: BottomNavigationBar(
              currentIndex: controller.navigationIndex,
              selectedItemColor: Get.theme.colorScheme.primary,
              unselectedItemColor: gray500,
              onTap: (index) {
                controller.navigationIndex = index;
                controller.update();
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Beranda',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.location_on),
                  label: 'Lokasi',
                ),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            Positioned(
              top: -height * 0.2,
              left: width * 0.4,
              child: Transform.rotate(
                angle: 20 * math.pi / 180, // misal 30 derajat
                alignment: Alignment.center, // pivot rotasi: tengah SVG
                child: SvgPicture.asset(
                  MediaRes.images.svg.backgroundSplashScreen,
                  width: width * 0.9,
                  height: height * 0.4,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: width,
              height: height * 0.35,
              color: neutralWhite.withOpacity(0.9),
            ),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            padding:
                                const EdgeInsets.only(left: 22, right: 10, bottom: 16, top: 16),
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                color: red100.withOpacity(0.5)),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Get.theme.colorScheme.primary,
                              size: 24,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Text(
                          "Meal Menu",
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        FormSearchWidget(
                          controller: controller,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: controller.makanan.length,
                      itemBuilder: (context, index) {
                        final item = controller.makanan[index];

                        return InkWell(
                          onTap: () {
                            Get.to(const DetailMenuView());
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: neutralWhite,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: gray500,
                                  blurRadius: 10,
                                  offset: Offset(0, 4),
                                )
                              ],
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    item['gambar']!,
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item['nama']!,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(item['deskripsi']!,
                                          style: Get.theme.textTheme.bodyMedium
                                              ?.copyWith(color: gray600)),
                                    ],
                                  ),
                                ),
                                Text(item['harga']!,
                                    style: Get.theme.textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: Get.theme.colorScheme.primary,
                                    )),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  @override
  State<DaftarMenuView> createState() => DaftarMenuController();
}
