import 'package:fixit_admin/data/data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_ad.freezed.dart';
part 'banner_ad.g.dart';

@freezed
class BannerAd with _$BannerAd {
  factory BannerAd({
    String? id,
    String? description,
    String? image,
    String? routes,
  }) = _Banner;

  BannerAd._();

  factory BannerAd.fromJson(Map<String, dynamic> json) =>
      _$BannerAdFromJson(json);

  BannerAdResponse toModel() => BannerAdResponse(
        id: id,
        description: description,
        image: image,
        routes: routes,
      );
}
