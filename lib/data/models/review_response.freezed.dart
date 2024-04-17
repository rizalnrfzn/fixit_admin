// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReviewResponse _$ReviewResponseFromJson(Map<String, dynamic> json) {
  return _ReviewResponse.fromJson(json);
}

/// @nodoc
mixin _$ReviewResponse {
  String? get clientUid => throw _privateConstructorUsedError;
  String? get clientName => throw _privateConstructorUsedError;
  String? get clientPicture => throw _privateConstructorUsedError;
  String? get review => throw _privateConstructorUsedError;
  int? get rating => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get dateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewResponseCopyWith<ReviewResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewResponseCopyWith<$Res> {
  factory $ReviewResponseCopyWith(
          ReviewResponse value, $Res Function(ReviewResponse) then) =
      _$ReviewResponseCopyWithImpl<$Res, ReviewResponse>;
  @useResult
  $Res call(
      {String? clientUid,
      String? clientName,
      String? clientPicture,
      String? review,
      int? rating,
      @TimestampConverter() DateTime? dateTime});
}

/// @nodoc
class _$ReviewResponseCopyWithImpl<$Res, $Val extends ReviewResponse>
    implements $ReviewResponseCopyWith<$Res> {
  _$ReviewResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientUid = freezed,
    Object? clientName = freezed,
    Object? clientPicture = freezed,
    Object? review = freezed,
    Object? rating = freezed,
    Object? dateTime = freezed,
  }) {
    return _then(_value.copyWith(
      clientUid: freezed == clientUid
          ? _value.clientUid
          : clientUid // ignore: cast_nullable_to_non_nullable
              as String?,
      clientName: freezed == clientName
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String?,
      clientPicture: freezed == clientPicture
          ? _value.clientPicture
          : clientPicture // ignore: cast_nullable_to_non_nullable
              as String?,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewResponseImplCopyWith<$Res>
    implements $ReviewResponseCopyWith<$Res> {
  factory _$$ReviewResponseImplCopyWith(_$ReviewResponseImpl value,
          $Res Function(_$ReviewResponseImpl) then) =
      __$$ReviewResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? clientUid,
      String? clientName,
      String? clientPicture,
      String? review,
      int? rating,
      @TimestampConverter() DateTime? dateTime});
}

/// @nodoc
class __$$ReviewResponseImplCopyWithImpl<$Res>
    extends _$ReviewResponseCopyWithImpl<$Res, _$ReviewResponseImpl>
    implements _$$ReviewResponseImplCopyWith<$Res> {
  __$$ReviewResponseImplCopyWithImpl(
      _$ReviewResponseImpl _value, $Res Function(_$ReviewResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientUid = freezed,
    Object? clientName = freezed,
    Object? clientPicture = freezed,
    Object? review = freezed,
    Object? rating = freezed,
    Object? dateTime = freezed,
  }) {
    return _then(_$ReviewResponseImpl(
      clientUid: freezed == clientUid
          ? _value.clientUid
          : clientUid // ignore: cast_nullable_to_non_nullable
              as String?,
      clientName: freezed == clientName
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String?,
      clientPicture: freezed == clientPicture
          ? _value.clientPicture
          : clientPicture // ignore: cast_nullable_to_non_nullable
              as String?,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewResponseImpl extends _ReviewResponse {
  _$ReviewResponseImpl(
      {this.clientUid,
      this.clientName,
      this.clientPicture,
      this.review,
      this.rating,
      @TimestampConverter() this.dateTime})
      : super._();

  factory _$ReviewResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewResponseImplFromJson(json);

  @override
  final String? clientUid;
  @override
  final String? clientName;
  @override
  final String? clientPicture;
  @override
  final String? review;
  @override
  final int? rating;
  @override
  @TimestampConverter()
  final DateTime? dateTime;

  @override
  String toString() {
    return 'ReviewResponse(clientUid: $clientUid, clientName: $clientName, clientPicture: $clientPicture, review: $review, rating: $rating, dateTime: $dateTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewResponseImpl &&
            (identical(other.clientUid, clientUid) ||
                other.clientUid == clientUid) &&
            (identical(other.clientName, clientName) ||
                other.clientName == clientName) &&
            (identical(other.clientPicture, clientPicture) ||
                other.clientPicture == clientPicture) &&
            (identical(other.review, review) || other.review == review) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, clientUid, clientName,
      clientPicture, review, rating, dateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewResponseImplCopyWith<_$ReviewResponseImpl> get copyWith =>
      __$$ReviewResponseImplCopyWithImpl<_$ReviewResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewResponseImplToJson(
      this,
    );
  }
}

abstract class _ReviewResponse extends ReviewResponse {
  factory _ReviewResponse(
      {final String? clientUid,
      final String? clientName,
      final String? clientPicture,
      final String? review,
      final int? rating,
      @TimestampConverter() final DateTime? dateTime}) = _$ReviewResponseImpl;
  _ReviewResponse._() : super._();

  factory _ReviewResponse.fromJson(Map<String, dynamic> json) =
      _$ReviewResponseImpl.fromJson;

  @override
  String? get clientUid;
  @override
  String? get clientName;
  @override
  String? get clientPicture;
  @override
  String? get review;
  @override
  int? get rating;
  @override
  @TimestampConverter()
  DateTime? get dateTime;
  @override
  @JsonKey(ignore: true)
  _$$ReviewResponseImplCopyWith<_$ReviewResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
