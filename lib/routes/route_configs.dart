import 'package:core/core.dart';
import 'package:flutter/material.dart';

class RouteConfigs {
  static Widget errorBuilder(BuildContext context, GoRouterState state) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Image.asset(
              isDarkMode(context)
                  ? MediaRes.images.notFoundDark
                  : MediaRes.images.notFound,
            ),
            const SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }
}
