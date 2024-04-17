import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixit_admin/domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_ad_response.freezed.dart';
part 'banner_ad_response.g.dart';

@freezed
class BannerAdResponse with _$BannerAdResponse {
  factory BannerAdResponse({
    String? id,
    String? description,
    String? image,
    String? routes,
  }) = _BannerAdResponse;

  BannerAdResponse._();

  factory BannerAdResponse.fromJson(Map<String, dynamic> json) =>
      _$BannerAdResponseFromJson(json);

  factory BannerAdResponse.fromFirestore(
          DocumentSnapshot snapshot, SnapshotOptions? options) =>
      BannerAdResponse.fromJson(snapshot.data() as Map<String, dynamic>);

  static Map<String, dynamic> toFirestore(
          BannerAdResponse object, SetOptions? options) =>
      object.toJson();

  BannerAd toEntity() => BannerAd(
        id: id,
        description: description,
        image: image,
        routes: routes,
      );
}
