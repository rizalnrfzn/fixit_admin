// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'technician.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TechnicianImpl _$$TechnicianImplFromJson(Map<String, dynamic> json) =>
    _$TechnicianImpl(
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      isRegistered: json['isRegistered'] as bool?,
      phoneNumber: json['phoneNumber'] as String?,
      description: json['description'] as String?,
      profilePicture: json['profilePicture'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      files:
          (json['files'] as List<dynamic>?)?.map((e) => e as String).toList(),
      address: json['address'] as String?,
      location: _$JsonConverterFromJson<GeoPoint, LatLng>(
          json['location'], const LatLngConverter().fromJson),
      currentLocation: _$JsonConverterFromJson<GeoPoint, LatLng>(
          json['currentLocation'], const LatLngConverter().fromJson),
      electronicId: (json['electronicId'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isVerified: json['isVerified'] as bool?,
      isOnline: json['isOnline'] as bool?,
      inOrder: json['inOrder'] as bool?,
      rating: (json['rating'] as num?)?.toDouble(),
      numberOfReviews: json['numberOfReviews'] as int?,
      direction: json['direction'] == null
          ? null
          : Direction.fromJson(json['direction'] as Map<String, dynamic>),
      electronics: (json['electronics'] as List<dynamic>?)
          ?.map((e) => Electronic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TechnicianImplToJson(_$TechnicianImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'isRegistered': instance.isRegistered,
      'phoneNumber': instance.phoneNumber,
      'description': instance.description,
      'profilePicture': instance.profilePicture,
      'images': instance.images,
      'files': instance.files,
      'address': instance.address,
      'location': _$JsonConverterToJson<GeoPoint, LatLng>(
          instance.location, const LatLngConverter().toJson),
      'currentLocation': _$JsonConverterToJson<GeoPoint, LatLng>(
          instance.currentLocation, const LatLngConverter().toJson),
      'electronicId': instance.electronicId,
      'isVerified': instance.isVerified,
      'isOnline': instance.isOnline,
      'inOrder': instance.inOrder,
      'rating': instance.rating,
      'numberOfReviews': instance.numberOfReviews,
      'direction': instance.direction,
      'electronics': instance.electronics,
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
