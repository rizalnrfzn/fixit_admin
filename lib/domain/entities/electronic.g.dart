// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'electronic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ElectronicImpl _$$ElectronicImplFromJson(Map<String, dynamic> json) =>
    _$ElectronicImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      gripe:
          (json['gripe'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
    );

Map<String, dynamic> _$$ElectronicImplToJson(_$ElectronicImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'gripe': instance.gripe,
    };
