// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClientResponse _$ClientResponseFromJson(Map<String, dynamic> json) {
  return _ClientResponse.fromJson(json);
}

/// @nodoc
mixin _$ClientResponse {
  String? get uid => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get profilePicture => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  bool? get isRegistered => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientResponseCopyWith<ClientResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientResponseCopyWith<$Res> {
  factory $ClientResponseCopyWith(
          ClientResponse value, $Res Function(ClientResponse) then) =
      _$ClientResponseCopyWithImpl<$Res, ClientResponse>;
  @useResult
  $Res call(
      {String? uid,
      String? name,
      String? email,
      String? phoneNumber,
      String? profilePicture,
      String? address,
      String? location,
      bool? isRegistered});
}

/// @nodoc
class _$ClientResponseCopyWithImpl<$Res, $Val extends ClientResponse>
    implements $ClientResponseCopyWith<$Res> {
  _$ClientResponseCopyWithImpl(this._value, this._then);

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
    Object? phoneNumber = freezed,
    Object? profilePicture = freezed,
    Object? address = freezed,
    Object? location = freezed,
    Object? isRegistered = freezed,
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
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      isRegistered: freezed == isRegistered
          ? _value.isRegistered
          : isRegistered // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClientResponseImplCopyWith<$Res>
    implements $ClientResponseCopyWith<$Res> {
  factory _$$ClientResponseImplCopyWith(_$ClientResponseImpl value,
          $Res Function(_$ClientResponseImpl) then) =
      __$$ClientResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? uid,
      String? name,
      String? email,
      String? phoneNumber,
      String? profilePicture,
      String? address,
      String? location,
      bool? isRegistered});
}

/// @nodoc
class __$$ClientResponseImplCopyWithImpl<$Res>
    extends _$ClientResponseCopyWithImpl<$Res, _$ClientResponseImpl>
    implements _$$ClientResponseImplCopyWith<$Res> {
  __$$ClientResponseImplCopyWithImpl(
      _$ClientResponseImpl _value, $Res Function(_$ClientResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? profilePicture = freezed,
    Object? address = freezed,
    Object? location = freezed,
    Object? isRegistered = freezed,
  }) {
    return _then(_$ClientResponseImpl(
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
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      isRegistered: freezed == isRegistered
          ? _value.isRegistered
          : isRegistered // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientResponseImpl extends _ClientResponse {
  _$ClientResponseImpl(
      {this.uid,
      this.name,
      this.email,
      this.phoneNumber,
      this.profilePicture,
      this.address,
      this.location,
      this.isRegistered})
      : super._();

  factory _$ClientResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientResponseImplFromJson(json);

  @override
  final String? uid;
  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? phoneNumber;
  @override
  final String? profilePicture;
  @override
  final String? address;
  @override
  final String? location;
  @override
  final bool? isRegistered;

  @override
  String toString() {
    return 'ClientResponse(uid: $uid, name: $name, email: $email, phoneNumber: $phoneNumber, profilePicture: $profilePicture, address: $address, location: $location, isRegistered: $isRegistered)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientResponseImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.isRegistered, isRegistered) ||
                other.isRegistered == isRegistered));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, name, email, phoneNumber,
      profilePicture, address, location, isRegistered);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientResponseImplCopyWith<_$ClientResponseImpl> get copyWith =>
      __$$ClientResponseImplCopyWithImpl<_$ClientResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClientResponseImplToJson(
      this,
    );
  }
}

abstract class _ClientResponse extends ClientResponse {
  factory _ClientResponse(
      {final String? uid,
      final String? name,
      final String? email,
      final String? phoneNumber,
      final String? profilePicture,
      final String? address,
      final String? location,
      final bool? isRegistered}) = _$ClientResponseImpl;
  _ClientResponse._() : super._();

  factory _ClientResponse.fromJson(Map<String, dynamic> json) =
      _$ClientResponseImpl.fromJson;

  @override
  String? get uid;
  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get phoneNumber;
  @override
  String? get profilePicture;
  @override
  String? get address;
  @override
  String? get location;
  @override
  bool? get isRegistered;
  @override
  @JsonKey(ignore: true)
  _$$ClientResponseImplCopyWith<_$ClientResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
