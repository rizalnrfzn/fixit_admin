// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewResponseImpl _$$ReviewResponseImplFromJson(Map<String, dynamic> json) =>
    _$ReviewResponseImpl(
      clientUid: json['clientUid'] as String?,
      clientName: json['clientName'] as String?,
      clientPicture: json['clientPicture'] as String?,
      review: json['review'] as String?,
      rating: json['rating'] as int?,
      dateTime: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['dateTime'], const TimestampConverter().fromJson),
    );

Map<String, dynamic> _$$ReviewResponseImplToJson(
        _$ReviewResponseImpl instance) =>
    <String, dynamic>{
      'clientUid': instance.clientUid,
      'clientName': instance.clientName,
      'clientPicture': instance.clientPicture,
      'review': instance.review,
      'rating': instance.rating,
      'dateTime': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.dateTime, const TimestampConverter().toJson),
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
