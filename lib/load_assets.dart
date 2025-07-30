import 'package:core/core.dart';

Future loadSVG() async {
  await svg.cache.putIfAbsent(
    SvgAssetLoader(MediaRes.images.ilustrasi.ubahKataSandi).cacheKey(null),
    () =>
        SvgAssetLoader(MediaRes.images.ilustrasi.ubahKataSandi).loadBytes(null),
  );
}
