import 'package:core/core.dart';
import 'package:flutter/material.dart';
import '../controller/beranda_controller.dart';
import 'dart:math' as math;

import '../widget/form_search.dart';
import '../widget/image_slider.dart';
import '../widget/list_card_output_form_search.dart';
import '../widget/list_resto_terdekat.dart';
import '../widget/location_header.dart';

class BerandaView extends StatefulWidget {
  const BerandaView({super.key});

  Widget build(context, BerandaController controller) {
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
            // <--- Add this for rounded corners
            topLeft: Radius.circular(36), // Adjust the radius as needed
            topRight: Radius.circular(36), // Adjust the radius as needed
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            // Match the border radius here
            topLeft: Radius.circular(36),
            topRight: Radius.circular(36),
          ),
          child: BottomNavigationBar(
            currentIndex: controller.navigationIndex,
            selectedItemColor: Get.theme.colorScheme.primary,
            unselectedItemColor: gray500,
            onTap: (index) {
              controller.navigationIndex = index;
              controller.update();
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.location_on),
                label: 'Lokasi',
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: -height * 0.28,
            left: width * 0.4,
            child: Transform.rotate(
              angle: 20 * math.pi / 180, // misal 30 derajat
              alignment: Alignment.center, // pivot rotasi: tengah SVG
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
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      const LocationHeader(),
                      const SizedBox(
                        height: 16.0,
                      ),
                      FormSearchWidget(
                        controller: controller,
                      ),
                      const SizedBox(
                        height: 32.0,
                      ),
                      if (controller.focusNode.hasFocus &&
                          controller.filteredRestaurants.isNotEmpty)
                        ListCardOutputFormSearch(controller: controller),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const ImageSliderWidget(
                  imageUrls: [
                    'https://craftsnippets.com/uploads/post_images/_1320x500_crop_center-center_none/875/art-hanging-photographs-photos-265946.webp',
                    'https://craftsnippets.com/uploads/post_images/_1320x500_crop_center-center_none/875/art-hanging-photographs-photos-265946.webp',
                    'https://craftsnippets.com/uploads/post_images/_1320x500_crop_center-center_none/875/art-hanging-photographs-photos-265946.webp',
                  ],
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Expanded(
                  child: ListRestoTerdekatWidget(
                    controller: controller,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  State<BerandaView> createState() => BerandaController();
}
