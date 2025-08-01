import 'package:base/base.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import '../controller/daftar_restoran_controller.dart';
import 'dart:math' as math;

import '../widget/form_search.dart';

class DaftarRestoranView extends StatefulWidget {
  const DaftarRestoranView({
    super.key,
  });

  Widget build(context, DaftarRestoranController controller) {
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
              topLeft: Radius.circular(36),
              topRight: Radius.circular(36),
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(36),
              topRight: Radius.circular(36),
            ),
            child: BottomNavigationBar(
              currentIndex: controller.navigationIndex,
              selectedItemColor: Get.theme.colorScheme.primary,
              unselectedItemColor: gray500,
              onTap: (index) {
                controller.navigationIndex = index;
                if (controller.navigationIndex == 0) {
                  newRouter.replace(RouterUtils.beranda);
                }
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Beranda',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.restaurant),
                  label: 'Daftar Restoran',
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
                        Text(
                          "Daftar Restoran",
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
                              style: TextStyle(fontSize: 16, color: gray700),
                            ),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            // Menampilkan maksimal 4 item
                            itemCount: math.min(controller.filteredMenu.length, 4),
                            itemBuilder: (context, index) {
                              final item = controller.filteredMenu[index];

                              return InkWell(
                                onTap: () {},
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
  State<DaftarRestoranView> createState() => DaftarRestoranController();
}
