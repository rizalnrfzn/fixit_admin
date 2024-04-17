import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixit_admin/domain/domain.dart';
import 'package:fixit_admin/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_response.freezed.dart';
part 'review_response.g.dart';

@freezed
class ReviewResponse with _$ReviewResponse {
  factory ReviewResponse({
    String? clientUid,
    String? clientName,
    String? clientPicture,
    String? review,
    int? rating,
    @TimestampConverter() DateTime? dateTime,
  }) = _ReviewResponse;

  ReviewResponse._();

  factory ReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewResponseFromJson(json);

  factory ReviewResponse.fromFirestore(
          DocumentSnapshot snapshot, SnapshotOptions? options) =>
      ReviewResponse.fromJson(snapshot.data() as Map<String, dynamic>);

  static Map<String, dynamic> toFirestore(
          ReviewResponse object, SetOptions? options) =>
      object.toJson();

  Review toEntity() => Review(
        clientUid: clientUid,
        clientName: clientName,
        clientPicture: clientPicture,
        review: review,
        rating: rating,
        dateTime: dateTime,
      );
}
