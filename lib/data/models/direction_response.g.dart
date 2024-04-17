// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'direction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DirectionResponseImpl _$$DirectionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DirectionResponseImpl(
      routes: (json['routes'] as List<dynamic>?)
          ?.map((e) => RouteResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DirectionResponseImplToJson(
        _$DirectionResponseImpl instance) =>
    <String, dynamic>{
      'routes': instance.routes,
    };

_$RouteResponseImpl _$$RouteResponseImplFromJson(Map<String, dynamic> json) =>
    _$RouteResponseImpl(
      duration: (json['duration'] as num?)?.toDouble(),
      distance: (json['distance'] as num?)?.toDouble(),
      geometry: json['geometry'] == null
          ? null
          : GmtryResponse.fromJson(json['geometry'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RouteResponseImplToJson(_$RouteResponseImpl instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'distance': instance.distance,
      'geometry': instance.geometry,
    };

_$GmtryResponseImpl _$$GmtryResponseImplFromJson(Map<String, dynamic> json) =>
    _$GmtryResponseImpl(
      coordinates: _$JsonConverterFromJson<List<dynamic>, List<LatLng>>(
          json['coordinates'], const ListLatLngJsonConverter().fromJson),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$GmtryResponseImplToJson(_$GmtryResponseImpl instance) =>
    <String, dynamic>{
      'coordinates': _$JsonConverterToJson<List<dynamic>, List<LatLng>>(
          instance.coordinates, const ListLatLngJsonConverter().toJson),
      'type': instance.type,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
