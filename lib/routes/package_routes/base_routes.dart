import 'package:base/base.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

final List<GoRoute> baseRoutes = [
  GoRoute(
    path: RouterUtils.root,
    builder: (BuildContext context, GoRouterState state) {
      return const SplashScreenView();
    },
  ),
  // GoRoute(
  //   path: RouterUtils.beranda,
  //   builder: (BuildContext context, GoRouterState state) {
  //     return const BerandaView();
  //   },
  // ),
];
