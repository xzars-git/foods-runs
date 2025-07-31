import 'package:base/beranda/controller/beranda_controller.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ListRestoTerdekatWidget extends StatefulWidget {
  final BerandaController controller;
  const ListRestoTerdekatWidget({super.key, required this.controller});

  @override
  State<ListRestoTerdekatWidget> createState() => _ListRestoTerdekatWidgetState();
}

class _ListRestoTerdekatWidgetState extends State<ListRestoTerdekatWidget> {
  @override
  Widget build(BuildContext context) {
    BerandaController controller = widget.controller;
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
            child: GridView.builder(
              itemCount: controller.allRestaurants.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom + 16.0,
              ),
              itemBuilder: (context, index) {
                final name = controller.allRestaurants[index];
                final image = controller.restaurantImages[name]?['image'] ?? '';
                final description = controller.restaurantImages[name]?['description'] ?? '';

                return Container(
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
                          image,
                          height: 80,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.star, color: yellow700, size: 16),
                                    const SizedBox(width: 4),
                                    Text("3.8", style: Get.theme.textTheme.bodyMedium),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Text(
                              description,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: Get.theme.textTheme.bodyMedium?.copyWith(color: gray600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
