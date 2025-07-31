import 'package:core/core.dart';
import 'package:flutter/material.dart';
import '../controller/beranda_controller.dart';
import 'dart:math' as math;

import '../widget/form_search.dart';
import '../widget/list_card_output_form_search.dart';
import '../widget/location_header.dart';

class BerandaView extends StatefulWidget {
  const BerandaView({super.key});

  Widget build(context, BerandaController controller) {
    controller.view = this;

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: neutralWhite,
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
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
                ],
              ),
            ),
          ),
          if (controller.focusNode.hasFocus && controller.filteredRestaurants.isNotEmpty)
            ListCardOutputFormSearch(controller: controller)
        ],
      ),
    );
  }

  @override
  State<BerandaView> createState() => BerandaController();
}
