// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repair_order_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RepairOrderResponse _$RepairOrderResponseFromJson(Map<String, dynamic> json) {
  return _RepairOrderResponse.fromJson(json);
}

/// @nodoc
mixin _$RepairOrderResponse {
  String? get id => throw _privateConstructorUsedError;
  String? get clientUid => throw _privateConstructorUsedError;
  String? get technicianUid => throw _privateConstructorUsedError;
  @LatLngConverter()
  LatLng? get clientLocation => throw _privateConstructorUsedError;
  @LatLngConverter()
  LatLng? get technicianLocation => throw _privateConstructorUsedError;
  String? get clientAddress => throw _privateConstructorUsedError;
  double? get duration => throw _privateConstructorUsedError;
  double? get distance => throw _privateConstructorUsedError;
  String? get electronicId => throw _privateConstructorUsedError;
  List<String>? get gripe => throw _privateConstructorUsedError;
  List<String>? get damage => throw _privateConstructorUsedError;
  List<String>? get electronicPicture => throw _privateConstructorUsedError;
  int? get checkingCost => throw _privateConstructorUsedError;
  int? get repairCost => throw _privateConstructorUsedError;
  int? get totalCost => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get dateTime => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  bool? get repair => throw _privateConstructorUsedError;
  bool? get pay => throw _privateConstructorUsedError;
  bool? get canceled => throw _privateConstructorUsedError;
  String? get reasonCancelled => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepairOrderResponseCopyWith<RepairOrderResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepairOrderResponseCopyWith<$Res> {
  factory $RepairOrderResponseCopyWith(
          RepairOrderResponse value, $Res Function(RepairOrderResponse) then) =
      _$RepairOrderResponseCopyWithImpl<$Res, RepairOrderResponse>;
  @useResult
  $Res call(
      {String? id,
      String? clientUid,
      String? technicianUid,
      @LatLngConverter() LatLng? clientLocation,
      @LatLngConverter() LatLng? technicianLocation,
      String? clientAddress,
      double? duration,
      double? distance,
      String? electronicId,
      List<String>? gripe,
      List<String>? damage,
      List<String>? electronicPicture,
      int? checkingCost,
      int? repairCost,
      int? totalCost,
      @TimestampConverter() DateTime? dateTime,
      String? status,
      bool? repair,
      bool? pay,
      bool? canceled,
      String? reasonCancelled});
}

/// @nodoc
class _$RepairOrderResponseCopyWithImpl<$Res, $Val extends RepairOrderResponse>
    implements $RepairOrderResponseCopyWith<$Res> {
  _$RepairOrderResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? clientUid = freezed,
    Object? technicianUid = freezed,
    Object? clientLocation = freezed,
    Object? technicianLocation = freezed,
    Object? clientAddress = freezed,
    Object? duration = freezed,
    Object? distance = freezed,
    Object? electronicId = freezed,
    Object? gripe = freezed,
    Object? damage = freezed,
    Object? electronicPicture = freezed,
    Object? checkingCost = freezed,
    Object? repairCost = freezed,
    Object? totalCost = freezed,
    Object? dateTime = freezed,
    Object? status = freezed,
    Object? repair = freezed,
    Object? pay = freezed,
    Object? canceled = freezed,
    Object? reasonCancelled = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      clientUid: freezed == clientUid
          ? _value.clientUid
          : clientUid // ignore: cast_nullable_to_non_nullable
              as String?,
      technicianUid: freezed == technicianUid
          ? _value.technicianUid
          : technicianUid // ignore: cast_nullable_to_non_nullable
              as String?,
      clientLocation: freezed == clientLocation
          ? _value.clientLocation
          : clientLocation // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      technicianLocation: freezed == technicianLocation
          ? _value.technicianLocation
          : technicianLocation // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      clientAddress: freezed == clientAddress
          ? _value.clientAddress
          : clientAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      electronicId: freezed == electronicId
          ? _value.electronicId
          : electronicId // ignore: cast_nullable_to_non_nullable
              as String?,
      gripe: freezed == gripe
          ? _value.gripe
          : gripe // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      damage: freezed == damage
          ? _value.damage
          : damage // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      electronicPicture: freezed == electronicPicture
          ? _value.electronicPicture
          : electronicPicture // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      checkingCost: freezed == checkingCost
          ? _value.checkingCost
          : checkingCost // ignore: cast_nullable_to_non_nullable
              as int?,
      repairCost: freezed == repairCost
          ? _value.repairCost
          : repairCost // ignore: cast_nullable_to_non_nullable
              as int?,
      totalCost: freezed == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as int?,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      repair: freezed == repair
          ? _value.repair
          : repair // ignore: cast_nullable_to_non_nullable
              as bool?,
      pay: freezed == pay
          ? _value.pay
          : pay // ignore: cast_nullable_to_non_nullable
              as bool?,
      canceled: freezed == canceled
          ? _value.canceled
          : canceled // ignore: cast_nullable_to_non_nullable
              as bool?,
      reasonCancelled: freezed == reasonCancelled
          ? _value.reasonCancelled
          : reasonCancelled // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RepairOrderResponseImplCopyWith<$Res>
    implements $RepairOrderResponseCopyWith<$Res> {
  factory _$$RepairOrderResponseImplCopyWith(_$RepairOrderResponseImpl value,
          $Res Function(_$RepairOrderResponseImpl) then) =
      __$$RepairOrderResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? clientUid,
      String? technicianUid,
      @LatLngConverter() LatLng? clientLocation,
      @LatLngConverter() LatLng? technicianLocation,
      String? clientAddress,
      double? duration,
      double? distance,
      String? electronicId,
      List<String>? gripe,
      List<String>? damage,
      List<String>? electronicPicture,
      int? checkingCost,
      int? repairCost,
      int? totalCost,
      @TimestampConverter() DateTime? dateTime,
      String? status,
      bool? repair,
      bool? pay,
      bool? canceled,
      String? reasonCancelled});
}

/// @nodoc
class __$$RepairOrderResponseImplCopyWithImpl<$Res>
    extends _$RepairOrderResponseCopyWithImpl<$Res, _$RepairOrderResponseImpl>
    implements _$$RepairOrderResponseImplCopyWith<$Res> {
  __$$RepairOrderResponseImplCopyWithImpl(_$RepairOrderResponseImpl _value,
      $Res Function(_$RepairOrderResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? clientUid = freezed,
    Object? technicianUid = freezed,
    Object? clientLocation = freezed,
    Object? technicianLocation = freezed,
    Object? clientAddress = freezed,
    Object? duration = freezed,
    Object? distance = freezed,
    Object? electronicId = freezed,
    Object? gripe = freezed,
    Object? damage = freezed,
    Object? electronicPicture = freezed,
    Object? checkingCost = freezed,
    Object? repairCost = freezed,
    Object? totalCost = freezed,
    Object? dateTime = freezed,
    Object? status = freezed,
    Object? repair = freezed,
    Object? pay = freezed,
    Object? canceled = freezed,
    Object? reasonCancelled = freezed,
  }) {
    return _then(_$RepairOrderResponseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      clientUid: freezed == clientUid
          ? _value.clientUid
          : clientUid // ignore: cast_nullable_to_non_nullable
              as String?,
      technicianUid: freezed == technicianUid
          ? _value.technicianUid
          : technicianUid // ignore: cast_nullable_to_non_nullable
              as String?,
      clientLocation: freezed == clientLocation
          ? _value.clientLocation
          : clientLocation // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      technicianLocation: freezed == technicianLocation
          ? _value.technicianLocation
          : technicianLocation // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      clientAddress: freezed == clientAddress
          ? _value.clientAddress
          : clientAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      electronicId: freezed == electronicId
          ? _value.electronicId
          : electronicId // ignore: cast_nullable_to_non_nullable
              as String?,
      gripe: freezed == gripe
          ? _value._gripe
          : gripe // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      damage: freezed == damage
          ? _value._damage
          : damage // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      electronicPicture: freezed == electronicPicture
          ? _value._electronicPicture
          : electronicPicture // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      checkingCost: freezed == checkingCost
          ? _value.checkingCost
          : checkingCost // ignore: cast_nullable_to_non_nullable
              as int?,
      repairCost: freezed == repairCost
          ? _value.repairCost
          : repairCost // ignore: cast_nullable_to_non_nullable
              as int?,
      totalCost: freezed == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as int?,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      repair: freezed == repair
          ? _value.repair
          : repair // ignore: cast_nullable_to_non_nullable
              as bool?,
      pay: freezed == pay
          ? _value.pay
          : pay // ignore: cast_nullable_to_non_nullable
              as bool?,
      canceled: freezed == canceled
          ? _value.canceled
          : canceled // ignore: cast_nullable_to_non_nullable
              as bool?,
      reasonCancelled: freezed == reasonCancelled
          ? _value.reasonCancelled
          : reasonCancelled // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RepairOrderResponseImpl extends _RepairOrderResponse {
  _$RepairOrderResponseImpl(
      {this.id,
      this.clientUid,
      this.technicianUid,
      @LatLngConverter() this.clientLocation,
      @LatLngConverter() this.technicianLocation,
      this.clientAddress,
      this.duration,
      this.distance,
      this.electronicId,
      final List<String>? gripe,
      final List<String>? damage,
      final List<String>? electronicPicture,
      this.checkingCost,
      this.repairCost,
      this.totalCost,
      @TimestampConverter() this.dateTime,
      this.status,
      this.repair,
      this.pay,
      this.canceled,
      this.reasonCancelled})
      : _gripe = gripe,
        _damage = damage,
        _electronicPicture = electronicPicture,
        super._();

  factory _$RepairOrderResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepairOrderResponseImplFromJson(json);

  @override
  final String? id;
  @override
  final String? clientUid;
  @override
  final String? technicianUid;
  @override
  @LatLngConverter()
  final LatLng? clientLocation;
  @override
  @LatLngConverter()
  final LatLng? technicianLocation;
  @override
  final String? clientAddress;
  @override
  final double? duration;
  @override
  final double? distance;
  @override
  final String? electronicId;
  final List<String>? _gripe;
  @override
  List<String>? get gripe {
    final value = _gripe;
    if (value == null) return null;
    if (_gripe is EqualUnmodifiableListView) return _gripe;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _damage;
  @override
  List<String>? get damage {
    final value = _damage;
    if (value == null) return null;
    if (_damage is EqualUnmodifiableListView) return _damage;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _electronicPicture;
  @override
  List<String>? get electronicPicture {
    final value = _electronicPicture;
    if (value == null) return null;
    if (_electronicPicture is EqualUnmodifiableListView)
      return _electronicPicture;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? checkingCost;
  @override
  final int? repairCost;
  @override
  final int? totalCost;
  @override
  @TimestampConverter()
  final DateTime? dateTime;
  @override
  final String? status;
  @override
  final bool? repair;
  @override
  final bool? pay;
  @override
  final bool? canceled;
  @override
  final String? reasonCancelled;

  @override
  String toString() {
    return 'RepairOrderResponse(id: $id, clientUid: $clientUid, technicianUid: $technicianUid, clientLocation: $clientLocation, technicianLocation: $technicianLocation, clientAddress: $clientAddress, duration: $duration, distance: $distance, electronicId: $electronicId, gripe: $gripe, damage: $damage, electronicPicture: $electronicPicture, checkingCost: $checkingCost, repairCost: $repairCost, totalCost: $totalCost, dateTime: $dateTime, status: $status, repair: $repair, pay: $pay, canceled: $canceled, reasonCancelled: $reasonCancelled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepairOrderResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.clientUid, clientUid) ||
                other.clientUid == clientUid) &&
            (identical(other.technicianUid, technicianUid) ||
                other.technicianUid == technicianUid) &&
            (identical(other.clientLocation, clientLocation) ||
                other.clientLocation == clientLocation) &&
            (identical(other.technicianLocation, technicianLocation) ||
                other.technicianLocation == technicianLocation) &&
            (identical(other.clientAddress, clientAddress) ||
                other.clientAddress == clientAddress) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.electronicId, electronicId) ||
                other.electronicId == electronicId) &&
            const DeepCollectionEquality().equals(other._gripe, _gripe) &&
            const DeepCollectionEquality().equals(other._damage, _damage) &&
            const DeepCollectionEquality()
                .equals(other._electronicPicture, _electronicPicture) &&
            (identical(other.checkingCost, checkingCost) ||
                other.checkingCost == checkingCost) &&
            (identical(other.repairCost, repairCost) ||
                other.repairCost == repairCost) &&
            (identical(other.totalCost, totalCost) ||
                other.totalCost == totalCost) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.repair, repair) || other.repair == repair) &&
            (identical(other.pay, pay) || other.pay == pay) &&
            (identical(other.canceled, canceled) ||
                other.canceled == canceled) &&
            (identical(other.reasonCancelled, reasonCancelled) ||
                other.reasonCancelled == reasonCancelled));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        clientUid,
        technicianUid,
        clientLocation,
        technicianLocation,
        clientAddress,
        duration,
        distance,
        electronicId,
        const DeepCollectionEquality().hash(_gripe),
        const DeepCollectionEquality().hash(_damage),
        const DeepCollectionEquality().hash(_electronicPicture),
        checkingCost,
        repairCost,
        totalCost,
        dateTime,
        status,
        repair,
        pay,
        canceled,
        reasonCancelled
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RepairOrderResponseImplCopyWith<_$RepairOrderResponseImpl> get copyWith =>
      __$$RepairOrderResponseImplCopyWithImpl<_$RepairOrderResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepairOrderResponseImplToJson(
      this,
    );
  }
}

abstract class _RepairOrderResponse extends RepairOrderResponse {
  factory _RepairOrderResponse(
      {final String? id,
      final String? clientUid,
      final String? technicianUid,
      @LatLngConverter() final LatLng? clientLocation,
      @LatLngConverter() final LatLng? technicianLocation,
      final String? clientAddress,
      final double? duration,
      final double? distance,
      final String? electronicId,
      final List<String>? gripe,
      final List<String>? damage,
      final List<String>? electronicPicture,
      final int? checkingCost,
      final int? repairCost,
      final int? totalCost,
      @TimestampConverter() final DateTime? dateTime,
      final String? status,
      final bool? repair,
      final bool? pay,
      final bool? canceled,
      final String? reasonCancelled}) = _$RepairOrderResponseImpl;
  _RepairOrderResponse._() : super._();

  factory _RepairOrderResponse.fromJson(Map<String, dynamic> json) =
      _$RepairOrderResponseImpl.fromJson;

  @override
  String? get id;
  @override
  String? get clientUid;
  @override
  String? get technicianUid;
  @override
  @LatLngConverter()
  LatLng? get clientLocation;
  @override
  @LatLngConverter()
  LatLng? get technicianLocation;
  @override
  String? get clientAddress;
  @override
  double? get duration;
  @override
  double? get distance;
  @override
  String? get electronicId;
  @override
  List<String>? get gripe;
  @override
  List<String>? get damage;
  @override
  List<String>? get electronicPicture;
  @override
  int? get checkingCost;
  @override
  int? get repairCost;
  @override
  int? get totalCost;
  @override
  @TimestampConverter()
  DateTime? get dateTime;
  @override
  String? get status;
  @override
  bool? get repair;
  @override
  bool? get pay;
  @override
  bool? get canceled;
  @override
  String? get reasonCancelled;
  @override
  @JsonKey(ignore: true)
  _$$RepairOrderResponseImplCopyWith<_$RepairOrderResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
