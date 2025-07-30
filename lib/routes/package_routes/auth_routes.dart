import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:auth/auth.dart';

final List<GoRoute> authRoutes = [
  GoRoute(
    path: RouterUtils.login,
    builder: (BuildContext context, GoRouterState state) {
      return const LoginView();
    },
  ),
  GoRoute(
    path: RouterUtils.ubahKataSandi,
    builder: (BuildContext context, GoRouterState state) {
      return const UbahKataSandiView();
    },
  ),
];
