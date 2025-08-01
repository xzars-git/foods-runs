import 'package:core/core.dart';
import 'package:flutter/material.dart';

class RouteConfigs {
  static Widget errorBuilder(BuildContext context, GoRouterState state) {
    return const Scaffold(
      body: Center(
        child: Text("Halaman Tidak di Temukan"),
      ),
    );
  }
}
