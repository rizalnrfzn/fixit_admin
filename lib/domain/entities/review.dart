import 'package:freezed_annotation/freezed_annotation.dart';

part 'review.freezed.dart';
part 'review.g.dart';

@freezed
class Review with _$Review {
  factory Review({
    String? clientUid,
    String? clientName,
    String? clientPicture,
    String? review,
    int? rating,
    DateTime? dateTime,
  }) = _Review;

  Review._();

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}
