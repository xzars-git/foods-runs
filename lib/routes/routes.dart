import 'package:core/core.dart';
import 'package:foods_run/core.dart';

final GoRouter router = GoRouter(
  navigatorKey: Get.navigatorKey,
  initialLocation: SessionSplashScreenDatabase.isPassedSplashScreen == true
      ? RouterUtils.beranda
      : RouterUtils.root,
  errorBuilder: RouteConfigs.errorBuilder,
  routes: <RouteBase>[...baseRoutes],
);
