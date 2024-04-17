// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClientResponseImpl _$$ClientResponseImplFromJson(Map<String, dynamic> json) =>
    _$ClientResponseImpl(
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      profilePicture: json['profilePicture'] as String?,
      address: json['address'] as String?,
      location: json['location'] as String?,
      isRegistered: json['isRegistered'] as bool?,
    );

Map<String, dynamic> _$$ClientResponseImplToJson(
        _$ClientResponseImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'profilePicture': instance.profilePicture,
      'address': instance.address,
      'location': instance.location,
      'isRegistered': instance.isRegistered,
    };
