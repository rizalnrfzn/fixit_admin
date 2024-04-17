// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'electronic_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ElectronicResponseImpl _$$ElectronicResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ElectronicResponseImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      gripe:
          (json['gripe'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
    );

Map<String, dynamic> _$$ElectronicResponseImplToJson(
        _$ElectronicResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'gripe': instance.gripe,
    };
