import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../controller/beranda_controller.dart';
import '../widget/form_search.dart';
import '../widget/image_slider.dart';
import '../widget/list_card_output_form_search.dart';
import '../widget/list_resto_terdekat.dart';
import '../widget/location_header.dart';

class BerandaView extends StatefulWidget {
  const BerandaView({super.key});

  @override
  State<BerandaView> createState() => BerandaController();

  // Metode build ini akan dipanggil dari BerandaController
  Widget build(BuildContext context, BerandaController controller) {
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
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      const LocationHeader(),
                      const SizedBox(height: 16.0),
                      FormSearchWidget(
                        controller: controller,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const ImageSliderWidget(
                  imageUrls: [
                    'https://d2vuyvo9qdtgo9.cloudfront.net/promos/February2023/rgAJyB7tXu6iYZzb7IuR.jpg',
                    'https://www.myvalue.id/_ipx/w_720&f_webp&q_85/https://production-myvalue.ap-south-1.linodeobjects.com/media/promo/1752464734503-202506_YFK_VC_Reviewed',
                    'https://www.myvalue.id/_ipx/w_720&f_webp&q_85/https://production-myvalue.ap-south-1.linodeobjects.com/media/promo/1752464938157-202501_Good-Will-Dimsum-x-Dari-Alam-Voucher-15K',
                  ],
                ),
                const SizedBox(height: 12.0),
                Expanded(
                  child: ListRestoTerdekatWidget(
                    controller: controller,
                  ),
                )
              ],
            ),
          ),
          if (controller.focusNode.hasFocus && controller.filteredRestaurants.isNotEmpty)
            ListCardOutputFormSearch(controller: controller),
        ],
      ),
    );
  }
}
