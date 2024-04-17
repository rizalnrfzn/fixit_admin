// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_ad_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BannerAdResponseImpl _$$BannerAdResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$BannerAdResponseImpl(
      id: json['id'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      routes: json['routes'] as String?,
    );

Map<String, dynamic> _$$BannerAdResponseImplToJson(
        _$BannerAdResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'image': instance.image,
      'routes': instance.routes,
    };
