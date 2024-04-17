// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthUserResponseImpl _$$AuthUserResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthUserResponseImpl(
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      profilePicture: json['profilePicture'] as String?,
    );

Map<String, dynamic> _$$AuthUserResponseImplToJson(
        _$AuthUserResponseImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'profilePicture': instance.profilePicture,
    };
