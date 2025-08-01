import 'package:base/base.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import '../controller/daftar_menu_controller.dart';
import 'dart:math' as math;

import '../widget/form_search.dart';

class DaftarMenuView extends StatefulWidget {
  final RestaurantModel dataRestoran;
  final Position userPosition;
  const DaftarMenuView({super.key, required this.dataRestoran, required this.userPosition});

  Widget build(context, DaftarMenuController controller) {
    controller.view = this;

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: neutralWhite,
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(
                      SetRouteView(
                        dataRestoran: dataRestoran,
                        userLocation: userPosition,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: neutralWhite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    "Menuju Lokasi Restoran Sekarang",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Positioned(
              top: -height * 0.2,
              left: width * 0.4,
              child: Transform.rotate(
                angle: 20 * math.pi / 180,
                alignment: Alignment.center,
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
                        FormSearchDaftarMenuWidget(
                          controller: controller,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: controller.filteredMenu.isEmpty
                        ? const Center(
                            child: Text(
                              'Tidak ada menu yang ditemukan.',
                              style: TextStyle(fontSize: 16, color: Colors.black54),
                            ),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            // Menampilkan maksimal 4 item
                            itemCount: math.min(controller.filteredMenu.length, 4),
                            itemBuilder: (context, index) {
                              final item = controller.filteredMenu[index];

                              return InkWell(
                                onTap: () {
                                  Get.to(DetailMenuView(
                                    dataRestoran: dataRestoran,
                                    userPosition: userPosition,
                                    dataDetailMenu: item,
                                  ));
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
                                          // Menggunakan null-check dan fallback
                                          item['image_url'] ??
                                              'https://placehold.co/60x60/e0e0e0/ffffff?text=No+Image',
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
                                              item['nama'] ?? 'Nama Tidak Tersedia',
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              item['deskripsi'] ?? 'Deskripsi Tidak Tersedia',
                                              maxLines: 4,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: Get.theme.textTheme.bodyMedium
                                                  ?.copyWith(color: gray600, height: 1.25),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 12.0,
                                      ),
                                      // Menambahkan format "Rp." dengan pemisah ribuan
                                      Text(
                                        Helper.formatRupiah(item['harga']),
                                        style: Get.theme.textTheme.bodyLarge?.copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: Get.theme.colorScheme.primary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  @override
  State<DaftarMenuView> createState() => DaftarMenuController();
}
