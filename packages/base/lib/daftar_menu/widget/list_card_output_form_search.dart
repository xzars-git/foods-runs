// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:base/base.dart';
import 'package:base/daftar_menu/controller/daftar_menu_controller.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ListCardOutputFormSearch extends StatefulWidget {
  final DaftarMenuController controller;
  const ListCardOutputFormSearch({super.key, required this.controller});

  @override
  State<ListCardOutputFormSearch> createState() => _ListCardOutputFormSearchState();
}

class _ListCardOutputFormSearchState extends State<ListCardOutputFormSearch> {
  @override
  Widget build(BuildContext context) {
    DaftarMenuController controller = widget.controller;

    return Positioned(
      top: 155,
      left: 16,
      right: 16,
      child: Container(
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
                final name = controller.filteredRestaurants[i];
                final data = controller.restaurantImages[name];

                final img = data?['image'];
                final desc = data?['description'] ?? 'Deskripsi tidak tersedia';

                return GestureDetector(
                  onTap: () {
                    controller.searchController.text = name;
                    controller.focusNode.unfocus();
                    Get.to(const DetailRestoranView());
                    // navigasi atau load data sesuai kebutuhan
                  },
                  child: Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 8,
                    child: Row(
                      children: [
                        if (img != null)
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                            ),
                            child: Image.network(
                              img,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                name,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                desc,
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
      ),
    );
  }
}
