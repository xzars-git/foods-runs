import 'package:core/core.dart';
import 'package:flutter/material.dart';
import '../controller/detail_restoran_controller.dart';

class DetailRestoranView extends StatefulWidget {
  const DetailRestoranView({super.key});

  Widget build(context, DetailRestoranController controller) {
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
              'https://craftsnippets.com/uploads/post_images/_1320x500_crop_center-center_none/875/art-hanging-photographs-photos-265946.webp', // Replace with your restaurant image URL
              fit: BoxFit.cover,
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
                color: Colors.white,
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
                          "Mc Donald's",
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
                      child: Text("Chicken Burger Promo Pack",
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
                                  Text("4,8 Rating", style: Get.theme.textTheme.bodyMedium),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                "Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt. Velit non est cillum consequat cupidatat at ex Lorem laboris labore aliqua ad du duis eu laborum. Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt. Velit non est cillum consequat cupidatat at ex Lorem laboris labore aliqua ad du duis eu laborum.Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt. Velit non est cillum consequat cupidatat at ex Lorem laboris labore aliqua ad du duis eu laborum.Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt. Velit non est cillum consequat cupidatat at ex Lorem laboris labore aliqua ad du duis eu laborum.Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt. Velit non est cillum consequat cupidatat at ex Lorem laboris labore aliqua ad du duis eu laborum.Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt. Velit non est cillum consequat cupidatat at ex Lorem laboris labore aliqua ad du duis eu laborum.Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt. Velit non est cillum consequat cupidatat at ex Lorem laboris labore aliqua ad du duis eu laborum.",
                                style: Get.theme.textTheme.bodyMedium
                                    ?.copyWith(color: gray800, height: 1.25),
                                textAlign: TextAlign.justify,
                              ),
                              const SizedBox(height: 12),
                              Text(
                                "Dolore reprehenderit magna aute dolore cillum eu. Aliquip deserunt ut ea aliqua tempor laborum enim. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                style: Get.theme.textTheme.bodyMedium
                                    ?.copyWith(color: gray800, height: 1.25),
                                textAlign: TextAlign.justify,
                              ),
                              const SizedBox(height: 12),
                              Text(
                                "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
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
                        print("Lihat Menu tapped!");
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
                        print("Tunjukan Lokasi tapped!");
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
