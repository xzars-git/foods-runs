import 'package:base/base.dart';
import 'package:base/set_route/view/set_route_view.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../controller/detail_menu_controller.dart';

class DetailMenuView extends StatefulWidget {
  final RestaurantModel dataRestoran;
  final Position userPosition;
  final Map<String, dynamic> dataDetailMenu;
  const DetailMenuView(
      {super.key,
      required this.dataDetailMenu,
      required this.dataRestoran,
      required this.userPosition});

  Widget build(context, DetailMenuController controller) {
    controller.view = this;
    // Get top safe area padding (e.g., status bar height)
    final double topPadding = MediaQuery.of(context).padding.top;
    // Get bottom safe area padding (e.g., home indicator)
    final double bottomPadding = MediaQuery.of(context).padding.bottom;

    // Define the height of the hero image section
    const double imageHeight = 300.0;
    // Define how much the content card overlaps the image
    const double contentOverlap = 40.0;

    return Scaffold(
      backgroundColor: neutralWhite,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: imageHeight,
            child: Image.network(
              dataDetailMenu['image_url'] ??
                  'https://placehold.co/600x400/e0e0e0/ffffff?text=No+Image',
              fit: BoxFit.cover,
              // Fallback jika image_url null atau gagal dimuat
              errorBuilder: (context, error, stackTrace) {
                return Image.network('https://placehold.co/600x400/e0e0e0/ffffff?text=No+Image',
                    fit: BoxFit.cover);
              },
            ),
          ),
          Positioned(
            top: topPadding + 10,
            left: 16,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.only(left: 22, right: 10, bottom: 16, top: 16),
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
          ),
          Positioned(
            top: imageHeight - contentOverlap,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: neutralWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: 80.0 + bottomPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 8, bottom: 20),
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: red100,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: red50,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Text(
                          "Mc Donald's", // Menggunakan data statis karena tidak ada di map
                          style: TextStyle(
                            color: red500,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(dataDetailMenu['nama'] ?? 'Nama Tidak Tersedia',
                          style: Get.theme.textTheme.displayLarge),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.star, color: yellow700, size: 18),
                                  const SizedBox(width: 4),
                                  Text("${dataDetailMenu['rating']?.toString() ?? 'N/A'} Rating",
                                      style: Get.theme.textTheme.bodyMedium),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                dataDetailMenu['deskripsi'] ?? 'Deskripsi tidak tersedia',
                                style: Get.theme.textTheme.bodyMedium
                                    ?.copyWith(color: gray800, height: 1.25),
                                textAlign: TextAlign.justify,
                              ),
                              const SizedBox(height: 16),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: neutralWhite,
              padding: EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 10.0,
                bottom: 10.0 + bottomPadding,
              ),
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
          ),
        ],
      ),
    );
  }

  @override
  State<DetailMenuView> createState() => DetailMenuController();
}
