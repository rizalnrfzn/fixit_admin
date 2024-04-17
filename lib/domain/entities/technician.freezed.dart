// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'technician.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Technician _$TechnicianFromJson(Map<String, dynamic> json) {
  return _Technician.fromJson(json);
}

/// @nodoc
mixin _$Technician {
  String? get uid => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  bool? get isRegistered => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get profilePicture => throw _privateConstructorUsedError;
  List<String>? get images => throw _privateConstructorUsedError;
  List<String>? get files => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  @LatLngConverter()
  LatLng? get location => throw _privateConstructorUsedError;
  @LatLngConverter()
  LatLng? get currentLocation => throw _privateConstructorUsedError;
  List<String>? get electronicId => throw _privateConstructorUsedError;
  bool? get isVerified => throw _privateConstructorUsedError;
  bool? get isOnline => throw _privateConstructorUsedError;
  bool? get inOrder => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;
  int? get numberOfReviews => throw _privateConstructorUsedError;
  Direction? get direction => throw _privateConstructorUsedError;
  List<Electronic>? get electronics => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TechnicianCopyWith<Technician> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TechnicianCopyWith<$Res> {
  factory $TechnicianCopyWith(
          Technician value, $Res Function(Technician) then) =
      _$TechnicianCopyWithImpl<$Res, Technician>;
  @useResult
  $Res call(
      {String? uid,
      String? name,
      String? email,
      bool? isRegistered,
      String? phoneNumber,
      String? description,
      String? profilePicture,
      List<String>? images,
      List<String>? files,
      String? address,
      @LatLngConverter() LatLng? location,
      @LatLngConverter() LatLng? currentLocation,
      List<String>? electronicId,
      bool? isVerified,
      bool? isOnline,
      bool? inOrder,
      double? rating,
      int? numberOfReviews,
      Direction? direction,
      List<Electronic>? electronics});

  $DirectionCopyWith<$Res>? get direction;
}

/// @nodoc
class _$TechnicianCopyWithImpl<$Res, $Val extends Technician>
    implements $TechnicianCopyWith<$Res> {
  _$TechnicianCopyWithImpl(this._value, this._then);

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
    Object? isRegistered = freezed,
    Object? phoneNumber = freezed,
    Object? description = freezed,
    Object? profilePicture = freezed,
    Object? images = freezed,
    Object? files = freezed,
    Object? address = freezed,
    Object? location = freezed,
    Object? currentLocation = freezed,
    Object? electronicId = freezed,
    Object? isVerified = freezed,
    Object? isOnline = freezed,
    Object? inOrder = freezed,
    Object? rating = freezed,
    Object? numberOfReviews = freezed,
    Object? direction = freezed,
    Object? electronics = freezed,
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
      isRegistered: freezed == isRegistered
          ? _value.isRegistered
          : isRegistered // ignore: cast_nullable_to_non_nullable
              as bool?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      files: freezed == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      currentLocation: freezed == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      electronicId: freezed == electronicId
          ? _value.electronicId
          : electronicId // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isVerified: freezed == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOnline: freezed == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool?,
      inOrder: freezed == inOrder
          ? _value.inOrder
          : inOrder // ignore: cast_nullable_to_non_nullable
              as bool?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      numberOfReviews: freezed == numberOfReviews
          ? _value.numberOfReviews
          : numberOfReviews // ignore: cast_nullable_to_non_nullable
              as int?,
      direction: freezed == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as Direction?,
      electronics: freezed == electronics
          ? _value.electronics
          : electronics // ignore: cast_nullable_to_non_nullable
              as List<Electronic>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DirectionCopyWith<$Res>? get direction {
    if (_value.direction == null) {
      return null;
    }

    return $DirectionCopyWith<$Res>(_value.direction!, (value) {
      return _then(_value.copyWith(direction: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TechnicianImplCopyWith<$Res>
    implements $TechnicianCopyWith<$Res> {
  factory _$$TechnicianImplCopyWith(
          _$TechnicianImpl value, $Res Function(_$TechnicianImpl) then) =
      __$$TechnicianImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? uid,
      String? name,
      String? email,
      bool? isRegistered,
      String? phoneNumber,
      String? description,
      String? profilePicture,
      List<String>? images,
      List<String>? files,
      String? address,
      @LatLngConverter() LatLng? location,
      @LatLngConverter() LatLng? currentLocation,
      List<String>? electronicId,
      bool? isVerified,
      bool? isOnline,
      bool? inOrder,
      double? rating,
      int? numberOfReviews,
      Direction? direction,
      List<Electronic>? electronics});

  @override
  $DirectionCopyWith<$Res>? get direction;
}

/// @nodoc
class __$$TechnicianImplCopyWithImpl<$Res>
    extends _$TechnicianCopyWithImpl<$Res, _$TechnicianImpl>
    implements _$$TechnicianImplCopyWith<$Res> {
  __$$TechnicianImplCopyWithImpl(
      _$TechnicianImpl _value, $Res Function(_$TechnicianImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? isRegistered = freezed,
    Object? phoneNumber = freezed,
    Object? description = freezed,
    Object? profilePicture = freezed,
    Object? images = freezed,
    Object? files = freezed,
    Object? address = freezed,
    Object? location = freezed,
    Object? currentLocation = freezed,
    Object? electronicId = freezed,
    Object? isVerified = freezed,
    Object? isOnline = freezed,
    Object? inOrder = freezed,
    Object? rating = freezed,
    Object? numberOfReviews = freezed,
    Object? direction = freezed,
    Object? electronics = freezed,
  }) {
    return _then(_$TechnicianImpl(
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
      isRegistered: freezed == isRegistered
          ? _value.isRegistered
          : isRegistered // ignore: cast_nullable_to_non_nullable
              as bool?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      files: freezed == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      currentLocation: freezed == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      electronicId: freezed == electronicId
          ? _value._electronicId
          : electronicId // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isVerified: freezed == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOnline: freezed == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool?,
      inOrder: freezed == inOrder
          ? _value.inOrder
          : inOrder // ignore: cast_nullable_to_non_nullable
              as bool?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      numberOfReviews: freezed == numberOfReviews
          ? _value.numberOfReviews
          : numberOfReviews // ignore: cast_nullable_to_non_nullable
              as int?,
      direction: freezed == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as Direction?,
      electronics: freezed == electronics
          ? _value._electronics
          : electronics // ignore: cast_nullable_to_non_nullable
              as List<Electronic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TechnicianImpl extends _Technician {
  _$TechnicianImpl(
      {this.uid,
      this.name,
      this.email,
      this.isRegistered,
      this.phoneNumber,
      this.description,
      this.profilePicture,
      final List<String>? images,
      final List<String>? files,
      this.address,
      @LatLngConverter() this.location,
      @LatLngConverter() this.currentLocation,
      final List<String>? electronicId,
      this.isVerified,
      this.isOnline,
      this.inOrder,
      this.rating,
      this.numberOfReviews,
      this.direction,
      final List<Electronic>? electronics})
      : _images = images,
        _files = files,
        _electronicId = electronicId,
        _electronics = electronics,
        super._();

  factory _$TechnicianImpl.fromJson(Map<String, dynamic> json) =>
      _$$TechnicianImplFromJson(json);

  @override
  final String? uid;
  @override
  final String? name;
  @override
  final String? email;
  @override
  final bool? isRegistered;
  @override
  final String? phoneNumber;
  @override
  final String? description;
  @override
  final String? profilePicture;
  final List<String>? _images;
  @override
  List<String>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _files;
  @override
  List<String>? get files {
    final value = _files;
    if (value == null) return null;
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? address;
  @override
  @LatLngConverter()
  final LatLng? location;
  @override
  @LatLngConverter()
  final LatLng? currentLocation;
  final List<String>? _electronicId;
  @override
  List<String>? get electronicId {
    final value = _electronicId;
    if (value == null) return null;
    if (_electronicId is EqualUnmodifiableListView) return _electronicId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? isVerified;
  @override
  final bool? isOnline;
  @override
  final bool? inOrder;
  @override
  final double? rating;
  @override
  final int? numberOfReviews;
  @override
  final Direction? direction;
  final List<Electronic>? _electronics;
  @override
  List<Electronic>? get electronics {
    final value = _electronics;
    if (value == null) return null;
    if (_electronics is EqualUnmodifiableListView) return _electronics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Technician(uid: $uid, name: $name, email: $email, isRegistered: $isRegistered, phoneNumber: $phoneNumber, description: $description, profilePicture: $profilePicture, images: $images, files: $files, address: $address, location: $location, currentLocation: $currentLocation, electronicId: $electronicId, isVerified: $isVerified, isOnline: $isOnline, inOrder: $inOrder, rating: $rating, numberOfReviews: $numberOfReviews, direction: $direction, electronics: $electronics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TechnicianImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.isRegistered, isRegistered) ||
                other.isRegistered == isRegistered) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.currentLocation, currentLocation) ||
                other.currentLocation == currentLocation) &&
            const DeepCollectionEquality()
                .equals(other._electronicId, _electronicId) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline) &&
            (identical(other.inOrder, inOrder) || other.inOrder == inOrder) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.numberOfReviews, numberOfReviews) ||
                other.numberOfReviews == numberOfReviews) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            const DeepCollectionEquality()
                .equals(other._electronics, _electronics));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        uid,
        name,
        email,
        isRegistered,
        phoneNumber,
        description,
        profilePicture,
        const DeepCollectionEquality().hash(_images),
        const DeepCollectionEquality().hash(_files),
        address,
        location,
        currentLocation,
        const DeepCollectionEquality().hash(_electronicId),
        isVerified,
        isOnline,
        inOrder,
        rating,
        numberOfReviews,
        direction,
        const DeepCollectionEquality().hash(_electronics)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TechnicianImplCopyWith<_$TechnicianImpl> get copyWith =>
      __$$TechnicianImplCopyWithImpl<_$TechnicianImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TechnicianImplToJson(
      this,
    );
  }
}

abstract class _Technician extends Technician {
  factory _Technician(
      {final String? uid,
      final String? name,
      final String? email,
      final bool? isRegistered,
      final String? phoneNumber,
      final String? description,
      final String? profilePicture,
      final List<String>? images,
      final List<String>? files,
      final String? address,
      @LatLngConverter() final LatLng? location,
      @LatLngConverter() final LatLng? currentLocation,
      final List<String>? electronicId,
      final bool? isVerified,
      final bool? isOnline,
      final bool? inOrder,
      final double? rating,
      final int? numberOfReviews,
      final Direction? direction,
      final List<Electronic>? electronics}) = _$TechnicianImpl;
  _Technician._() : super._();

  factory _Technician.fromJson(Map<String, dynamic> json) =
      _$TechnicianImpl.fromJson;

  @override
  String? get uid;
  @override
  String? get name;
  @override
  String? get email;
  @override
  bool? get isRegistered;
  @override
  String? get phoneNumber;
  @override
  String? get description;
  @override
  String? get profilePicture;
  @override
  List<String>? get images;
  @override
  List<String>? get files;
  @override
  String? get address;
  @override
  @LatLngConverter()
  LatLng? get location;
  @override
  @LatLngConverter()
  LatLng? get currentLocation;
  @override
  List<String>? get electronicId;
  @override
  bool? get isVerified;
  @override
  bool? get isOnline;
  @override
  bool? get inOrder;
  @override
  double? get rating;
  @override
  int? get numberOfReviews;
  @override
  Direction? get direction;
  @override
  List<Electronic>? get electronics;
  @override
  @JsonKey(ignore: true)
  _$$TechnicianImplCopyWith<_$TechnicianImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
