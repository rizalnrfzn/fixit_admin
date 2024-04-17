// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'direction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DirectionImpl _$$DirectionImplFromJson(Map<String, dynamic> json) =>
    _$DirectionImpl(
      routes: (json['routes'] as List<dynamic>?)
          ?.map((e) => Route.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DirectionImplToJson(_$DirectionImpl instance) =>
    <String, dynamic>{
      'routes': instance.routes,
    };

_$RouteImpl _$$RouteImplFromJson(Map<String, dynamic> json) => _$RouteImpl(
      duration: (json['duration'] as num?)?.toDouble(),
      distance: (json['distance'] as num?)?.toDouble(),
      geometry: json['geometry'] == null
          ? null
          : Gmtry.fromJson(json['geometry'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RouteImplToJson(_$RouteImpl instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'distance': instance.distance,
      'geometry': instance.geometry,
    };

_$GmtryImpl _$$GmtryImplFromJson(Map<String, dynamic> json) => _$GmtryImpl(
      coordinates: _$JsonConverterFromJson<List<dynamic>, List<LatLng>>(
          json['coordinates'], const ListLatLngJsonConverter().fromJson),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$GmtryImplToJson(_$GmtryImpl instance) =>
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
