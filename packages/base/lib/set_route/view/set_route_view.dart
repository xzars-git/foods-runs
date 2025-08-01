import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../controller/set_route_controller.dart';

class SetRouteView extends StatefulWidget {
  final double latitude;
  final double longitude;
  const SetRouteView({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  Widget build(context, SetRouteController controller) {
    controller.view = this;
    final double topPadding = MediaQuery.of(context).padding.top;
    final double bottomPadding = MediaQuery.of(context).padding.bottom;
    final LatLng destination = LatLng(controller.view.latitude, controller.view.longitude);

    return Scaffold(
      body: Stack(
        children: [
          // Bagian Peta
          FlutterMap(
            mapController: MapController(),
            options: MapOptions(
              initialCenter: destination,
              initialZoom: 15.0,
            ),
            children: [
              TileLayer(
                urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: destination,
                    child: Icon(
                      Icons.location_on,
                      color: primaryColor,
                      size: 40.0,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Tombol Kembali
          Positioned(
            top: topPadding + 10,
            left: 16,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                  color: neutralWhite.withOpacity(0.8),
                ),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: primaryColor,
                  size: 24,
                ),
              ),
            ),
          ),

          // Bottom Card
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: neutralWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                boxShadow: [
                  BoxShadow(
                    color: gray500,
                    blurRadius: 10,
                    offset: Offset(0, -4),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: 24.0,
                  left: 24.0,
                  right: 24.0,
                  bottom: 24.0 + bottomPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Restaurant Location",
                      style: Get.theme.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: red500,
                          size: 24,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            controller.addressText,
                            style: Get.theme.textTheme.bodyLarge,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: controller.openMap,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: neutralWhite,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        minimumSize: const Size.fromHeight(50),
                      ),
                      child: const Text(
                        "Set Route",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  State<SetRouteView> createState() => SetRouteController();
}
