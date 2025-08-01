import 'package:base/base.dart';
import 'package:base/daftar_restoran/view/daftar_restoran_view.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

final List<GoRoute> baseRoutes = [
  GoRoute(
    path: RouterUtils.root,
    builder: (BuildContext context, GoRouterState state) {
      return const SplashScreenView();
    },
  ),
  GoRoute(
    path: RouterUtils.beranda,
    builder: (BuildContext context, GoRouterState state) {
      return const BerandaView();
    },
  ),
  GoRoute(
    path: RouterUtils.daftarRestoran,
    builder: (BuildContext context, GoRouterState state) {
      return const DaftarRestoranView();
    },
  ),
];
