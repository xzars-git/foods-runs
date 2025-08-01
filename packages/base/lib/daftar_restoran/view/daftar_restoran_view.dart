// base/daftar_restoran/view/daftar_restoran_view.dart

import 'package:base/base.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart'; // Grid dihilangkan
import 'dart:math' as math;

import '../controller/daftar_restoran_controller.dart';
import '../widget/form_search.dart';
import '../widget/list_card_output_form_search.dart';

class DaftarRestoranView extends StatefulWidget {
  const DaftarRestoranView({super.key});

  @override
  State<DaftarRestoranView> createState() => DaftarRestoranController();

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
                      FormSearchDaftarRestoWidget(
                        controller: controller,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: controller.restaurantStream,
                    builder: (context, snapshot) {
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
                      if (controller.currentPosition == null) {
                        return Center(
                          child: Text(controller.locationStatusMessage),
                        );
                      }
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

                      // Perbarui daftar semua restoran di controller untuk pencarian
                      if (snapshot.data!.docs.isNotEmpty) {
                        controller.allRestaurantsFromFirestore = snapshot.data!.docs
                            .map((doc) => RestaurantModel.fromFirestore(doc))
                            .toList();
                        // Panggil onSearchChanged untuk memperbarui filteredRestaurants
                        controller.onSearchChanged();
                      }

                      // Tentukan daftar yang akan ditampilkan
                      final displayedList = controller.filteredRestaurants.isNotEmpty
                          ? controller.filteredRestaurants
                              .map((r) => restaurantsWithDistance
                                  .firstWhere((rw) => rw.restaurant.id == r.id))
                              .toList()
                          : restaurantsWithDistance;

                      if (displayedList.isEmpty) {
                        return const Center(
                          child: Text(
                            'Tidak ada restoran yang ditemukan.',
                            style: TextStyle(fontSize: 16, color: gray700),
                          ),
                        );
                      }

                      // Ganti StaggeredGrid dengan ListView.builder
                      return ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        itemCount: displayedList.length,
                        itemBuilder: (context, index) {
                          final restaurantWithDistance = displayedList[index];
                          final restaurant = restaurantWithDistance.restaurant;
                          return InkWell(
                            onTap: () {
                              Get.to(
                                DetailRestoranView(
                                    dataRestoran: restaurant,
                                    userPosition: controller.currentPosition!),
                              );
                            },
                            child: Card(
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 4,
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      bottomLeft: Radius.circular(16),
                                    ),
                                    child: Image.network(
                                      restaurant.imageUrl,
                                      width: 100, // Ukuran gambar yang lebih besar
                                      height: 100,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Container(
                                          width: 100,
                                          height: 100,
                                          color: gray700,
                                          child:
                                              const Icon(Icons.broken_image, color: Colors.white),
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            restaurant.nama,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(height: 4),
                                          Row(
                                            children: [
                                              const Icon(Icons.star,
                                                  color: Color(0xFFF9A825), size: 16),
                                              const SizedBox(width: 4),
                                              Text(
                                                restaurant.rating.toStringAsFixed(1),
                                                style: Get.theme.textTheme.bodyMedium,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            "${Helper.formatDistance(restaurantWithDistance.distanceInKm)} km dari Anda",
                                            style: Get.theme.textTheme.bodyMedium
                                                ?.copyWith(color: gray600),
                                          ),
                                        ],
                                      ),
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
          ),
          if (controller.focusNode.hasFocus && controller.filteredRestaurants.isNotEmpty)
            ListCardOutputFormSearchDaftarRestaurant(
              controller: controller,
            ),
        ],
      ),
    );
  }
}
