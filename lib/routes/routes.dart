import 'package:core/core.dart';
import 'package:new_sakti_mobile/core.dart';

final GoRouter router = GoRouter(
  navigatorKey: Get.navigatorKey,
  initialLocation: RouterUtils.root,
  errorBuilder: RouteConfigs.errorBuilder,
  routes: <RouteBase>[...baseRoutes],
);
