import 'package:base/base.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../controller/beranda_controller.dart';

class ListRestoTerdekatWidget extends StatelessWidget {
  final BerandaController controller;
  const ListRestoTerdekatWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    // Tampilkan indikator loading saat lokasi sedang dicari
    if (controller.isLoadingLocation) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text(controller.locationStatusMessage),
          ],
        ),
      );
    }

    // Jika lokasi gagal didapat, tampilkan pesan error
    if (controller.currentPosition == null) {
      return Center(
        child: Text(controller.locationStatusMessage),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Resto Terdekat",
            style: Get.theme.textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Expanded(
            // Menggunakan StreamBuilder untuk mendengarkan data dari Firestore
            child: StreamBuilder<QuerySnapshot>(
              stream: controller.restaurantStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text("Tidak ada restoran ditemukan."));
                }

                // Panggil fungsi di controller untuk memproses snapshot
                final List<RestaurantWithDistance> restaurantsWithDistance =
                    controller.getRestaurantsWithDistance(snapshot.data!);

                if (snapshot.data!.docs.isNotEmpty) {
                  controller.allRestaurantsFromFirestore =
                      snapshot.data!.docs.map((doc) => RestaurantModel.fromFirestore(doc)).toList();
                  controller.onSearchChanged();
                }

                return GridView.builder(
                  itemCount: restaurantsWithDistance.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.8,
                  ),
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom + 16.0,
                  ),
                  itemBuilder: (context, index) {
                    final restaurantWithDistance = restaurantsWithDistance[index];
                    final restaurant = restaurantWithDistance.restaurant;
                    return InkWell(
                      onTap: () {
                        Get.to(
                          DetailRestoranView(
                            dataRestoran: restaurant,
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: neutralWhite,
                          boxShadow: const [
                            BoxShadow(
                              color: gray500,
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                              child: Image.network(
                                restaurant.imageUrl,
                                height: 80,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    height: 80,
                                    width: double.infinity,
                                    color: gray700,
                                    child: const Icon(Icons.broken_image, color: neutralWhite),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    restaurant.nama,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    children: [
                                      const Icon(Icons.star, color: yellow700, size: 16),
                                      const SizedBox(width: 4),
                                      Text(
                                        restaurant.rating.toStringAsFixed(1),
                                        style: Get.theme.textTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    "${Helper.formatDistance(restaurantWithDistance.distanceInKm)} km dari Anda",
                                    style: Get.theme.textTheme.bodyMedium?.copyWith(color: gray600),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    restaurant.deskripsi,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: Get.theme.textTheme.bodyMedium?.copyWith(color: gray600),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
