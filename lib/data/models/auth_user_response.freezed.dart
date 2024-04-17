// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_user_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthUserResponse _$AuthUserResponseFromJson(Map<String, dynamic> json) {
  return _AuthUserResponse.fromJson(json);
}

/// @nodoc
mixin _$AuthUserResponse {
  String? get uid => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get profilePicture => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthUserResponseCopyWith<AuthUserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthUserResponseCopyWith<$Res> {
  factory $AuthUserResponseCopyWith(
          AuthUserResponse value, $Res Function(AuthUserResponse) then) =
      _$AuthUserResponseCopyWithImpl<$Res, AuthUserResponse>;
  @useResult
  $Res call({String? uid, String? name, String? email, String? profilePicture});
}

/// @nodoc
class _$AuthUserResponseCopyWithImpl<$Res, $Val extends AuthUserResponse>
    implements $AuthUserResponseCopyWith<$Res> {
  _$AuthUserResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? profilePicture = freezed,
  }) {
    return _then(_value.copyWith(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthUserResponseImplCopyWith<$Res>
    implements $AuthUserResponseCopyWith<$Res> {
  factory _$$AuthUserResponseImplCopyWith(_$AuthUserResponseImpl value,
          $Res Function(_$AuthUserResponseImpl) then) =
      __$$AuthUserResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? uid, String? name, String? email, String? profilePicture});
}

/// @nodoc
class __$$AuthUserResponseImplCopyWithImpl<$Res>
    extends _$AuthUserResponseCopyWithImpl<$Res, _$AuthUserResponseImpl>
    implements _$$AuthUserResponseImplCopyWith<$Res> {
  __$$AuthUserResponseImplCopyWithImpl(_$AuthUserResponseImpl _value,
      $Res Function(_$AuthUserResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? profilePicture = freezed,
  }) {
    return _then(_$AuthUserResponseImpl(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthUserResponseImpl extends _AuthUserResponse {
  _$AuthUserResponseImpl({this.uid, this.name, this.email, this.profilePicture})
      : super._();

  factory _$AuthUserResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthUserResponseImplFromJson(json);

  @override
  final String? uid;
  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? profilePicture;

  @override
  String toString() {
    return 'AuthUserResponse(uid: $uid, name: $name, email: $email, profilePicture: $profilePicture)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthUserResponseImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, uid, name, email, profilePicture);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthUserResponseImplCopyWith<_$AuthUserResponseImpl> get copyWith =>
      __$$AuthUserResponseImplCopyWithImpl<_$AuthUserResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthUserResponseImplToJson(
      this,
    );
  }
}

abstract class _AuthUserResponse extends AuthUserResponse {
  factory _AuthUserResponse(
      {final String? uid,
      final String? name,
      final String? email,
      final String? profilePicture}) = _$AuthUserResponseImpl;
  _AuthUserResponse._() : super._();

  factory _AuthUserResponse.fromJson(Map<String, dynamic> json) =
      _$AuthUserResponseImpl.fromJson;

  @override
  String? get uid;
  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get profilePicture;
  @override
  @JsonKey(ignore: true)
  _$$AuthUserResponseImplCopyWith<_$AuthUserResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
