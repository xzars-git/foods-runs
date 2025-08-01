// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:base/base.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

// Perhatikan, import diubah agar mengarah ke controller yang benar
import 'package:base/daftar_restoran/controller/daftar_restoran_controller.dart';

class ListCardOutputFormSearchDaftarRestaurant extends StatefulWidget {
  // Tipe controller diubah dari DaftarMenuController menjadi DaftarRestoranController
  final DaftarRestoranController controller;
  const ListCardOutputFormSearchDaftarRestaurant({super.key, required this.controller});

  @override
  State<ListCardOutputFormSearchDaftarRestaurant> createState() =>
      _ListCardOutputFormSearchDaftarRestaurantState();
}

class _ListCardOutputFormSearchDaftarRestaurantState
    extends State<ListCardOutputFormSearchDaftarRestaurant> {
  @override
  Widget build(BuildContext context) {
    // Menggunakan controller yang sudah diperbarui tipenya
    DaftarRestoranController controller = widget.controller;

    return Container(
      color: neutralWhite,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.78,
        ),
        child: ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: controller.filteredRestaurants.length,
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom + 16.0,
            ),
            itemBuilder: (context, i) {
              // Menggunakan data dari list filteredRestaurants yang berisi RestaurantModel
              final restaurant = controller.filteredRestaurants[i];

              return GestureDetector(
                onTap: () async {
                  controller.searchController.text = restaurant.nama;
                  controller.focusNode.unfocus();
                  // Anda bisa meneruskan data restoran ke halaman detail
                  Get.to(DetailRestoranView(
                    dataRestoran: restaurant,
                    userPosition: controller.currentPosition!,
                  ));
                },
                child: Card(
                  margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 6.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 8,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                        child: Image.network(
                          restaurant.imageUrl,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 100,
                              height: 100,
                              color: Colors.grey,
                              child: const Icon(Icons.broken_image, color: Colors.white),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              restaurant.nama,
                              style: Theme.of(context).textTheme.titleMedium,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              restaurant.deskripsi,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
