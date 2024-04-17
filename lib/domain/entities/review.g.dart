// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewImpl _$$ReviewImplFromJson(Map<String, dynamic> json) => _$ReviewImpl(
      clientUid: json['clientUid'] as String?,
      clientName: json['clientName'] as String?,
      clientPicture: json['clientPicture'] as String?,
      review: json['review'] as String?,
      rating: json['rating'] as int?,
      dateTime: json['dateTime'] == null
          ? null
          : DateTime.parse(json['dateTime'] as String),
    );

Map<String, dynamic> _$$ReviewImplToJson(_$ReviewImpl instance) =>
    <String, dynamic>{
      'clientUid': instance.clientUid,
      'clientName': instance.clientName,
      'clientPicture': instance.clientPicture,
      'review': instance.review,
      'rating': instance.rating,
      'dateTime': instance.dateTime?.toIso8601String(),
    };
