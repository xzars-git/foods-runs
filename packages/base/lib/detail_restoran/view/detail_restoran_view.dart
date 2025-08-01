import 'package:base/base.dart';
import 'package:base/beranda/controller/beranda_controller.dart';
import 'package:base/daftar_menu/view/daftar_menu_view.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import '../controller/detail_restoran_controller.dart';

class DetailRestoranView extends StatefulWidget {
  final RestaurantModel dataRestoran;
  final Position userPosition;
  const DetailRestoranView({super.key, required this.dataRestoran, required this.userPosition});

  Widget build(context, DetailRestoranController controller) {
    controller.view = this;
    final double topPadding = MediaQuery.of(context).padding.top;
    final double bottomPadding = MediaQuery.of(context).padding.bottom;
    const double imageHeight = 300.0;
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
              dataRestoran.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey,
                  child: const Icon(Icons.broken_image, color: Colors.white),
                );
              },
            ),
          ),
          Positioned(
            top: topPadding + 10,
            left: 16,
            child: InkWell(
              onTap: () {
                BerandaController.instance.searchController.text = "";
                Get.back();
              },
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.only(left: 22, right: 10, bottom: 16, top: 16),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                  color: red100.withOpacity(0.5),
                ),
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
                      child: Text(
                        dataRestoran.nama,
                        style: Get.theme.textTheme.displayLarge,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: red50,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          dataRestoran.alamat,
                          style: const TextStyle(
                            color: red500,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
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
                                  Text("${dataRestoran.rating} Rating",
                                      style: Get.theme.textTheme.bodyMedium),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                dataRestoran.deskripsi,
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
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(DaftarMenuView(
                          dataRestoran: dataRestoran,
                          userPosition: userPosition,
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: neutralWhite,
                        foregroundColor: primaryColor,
                        side: BorderSide(color: primaryColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        "Lihat Menu",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
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
                        "Tunjukan Lokasi",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
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
  State<DetailRestoranView> createState() => DetailRestoranController();
}
