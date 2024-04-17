// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'direction_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DirectionResponse _$DirectionResponseFromJson(Map<String, dynamic> json) {
  return _DirectionResponse.fromJson(json);
}

/// @nodoc
mixin _$DirectionResponse {
  List<RouteResponse>? get routes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DirectionResponseCopyWith<DirectionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DirectionResponseCopyWith<$Res> {
  factory $DirectionResponseCopyWith(
          DirectionResponse value, $Res Function(DirectionResponse) then) =
      _$DirectionResponseCopyWithImpl<$Res, DirectionResponse>;
  @useResult
  $Res call({List<RouteResponse>? routes});
}

/// @nodoc
class _$DirectionResponseCopyWithImpl<$Res, $Val extends DirectionResponse>
    implements $DirectionResponseCopyWith<$Res> {
  _$DirectionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routes = freezed,
  }) {
    return _then(_value.copyWith(
      routes: freezed == routes
          ? _value.routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<RouteResponse>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DirectionResponseImplCopyWith<$Res>
    implements $DirectionResponseCopyWith<$Res> {
  factory _$$DirectionResponseImplCopyWith(_$DirectionResponseImpl value,
          $Res Function(_$DirectionResponseImpl) then) =
      __$$DirectionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<RouteResponse>? routes});
}

/// @nodoc
class __$$DirectionResponseImplCopyWithImpl<$Res>
    extends _$DirectionResponseCopyWithImpl<$Res, _$DirectionResponseImpl>
    implements _$$DirectionResponseImplCopyWith<$Res> {
  __$$DirectionResponseImplCopyWithImpl(_$DirectionResponseImpl _value,
      $Res Function(_$DirectionResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routes = freezed,
  }) {
    return _then(_$DirectionResponseImpl(
      routes: freezed == routes
          ? _value._routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<RouteResponse>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DirectionResponseImpl extends _DirectionResponse {
  _$DirectionResponseImpl({final List<RouteResponse>? routes})
      : _routes = routes,
        super._();

  factory _$DirectionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DirectionResponseImplFromJson(json);

  final List<RouteResponse>? _routes;
  @override
  List<RouteResponse>? get routes {
    final value = _routes;
    if (value == null) return null;
    if (_routes is EqualUnmodifiableListView) return _routes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DirectionResponse(routes: $routes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DirectionResponseImpl &&
            const DeepCollectionEquality().equals(other._routes, _routes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_routes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DirectionResponseImplCopyWith<_$DirectionResponseImpl> get copyWith =>
      __$$DirectionResponseImplCopyWithImpl<_$DirectionResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DirectionResponseImplToJson(
      this,
    );
  }
}

abstract class _DirectionResponse extends DirectionResponse {
  factory _DirectionResponse({final List<RouteResponse>? routes}) =
      _$DirectionResponseImpl;
  _DirectionResponse._() : super._();

  factory _DirectionResponse.fromJson(Map<String, dynamic> json) =
      _$DirectionResponseImpl.fromJson;

  @override
  List<RouteResponse>? get routes;
  @override
  @JsonKey(ignore: true)
  _$$DirectionResponseImplCopyWith<_$DirectionResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RouteResponse _$RouteResponseFromJson(Map<String, dynamic> json) {
  return _RouteResponse.fromJson(json);
}

/// @nodoc
mixin _$RouteResponse {
  double? get duration => throw _privateConstructorUsedError;
  double? get distance => throw _privateConstructorUsedError;
  GmtryResponse? get geometry => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteResponseCopyWith<RouteResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteResponseCopyWith<$Res> {
  factory $RouteResponseCopyWith(
          RouteResponse value, $Res Function(RouteResponse) then) =
      _$RouteResponseCopyWithImpl<$Res, RouteResponse>;
  @useResult
  $Res call({double? duration, double? distance, GmtryResponse? geometry});

  $GmtryResponseCopyWith<$Res>? get geometry;
}

/// @nodoc
class _$RouteResponseCopyWithImpl<$Res, $Val extends RouteResponse>
    implements $RouteResponseCopyWith<$Res> {
  _$RouteResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = freezed,
    Object? distance = freezed,
    Object? geometry = freezed,
  }) {
    return _then(_value.copyWith(
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      geometry: freezed == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as GmtryResponse?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GmtryResponseCopyWith<$Res>? get geometry {
    if (_value.geometry == null) {
      return null;
    }

    return $GmtryResponseCopyWith<$Res>(_value.geometry!, (value) {
      return _then(_value.copyWith(geometry: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RouteResponseImplCopyWith<$Res>
    implements $RouteResponseCopyWith<$Res> {
  factory _$$RouteResponseImplCopyWith(
          _$RouteResponseImpl value, $Res Function(_$RouteResponseImpl) then) =
      __$$RouteResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? duration, double? distance, GmtryResponse? geometry});

  @override
  $GmtryResponseCopyWith<$Res>? get geometry;
}

/// @nodoc
class __$$RouteResponseImplCopyWithImpl<$Res>
    extends _$RouteResponseCopyWithImpl<$Res, _$RouteResponseImpl>
    implements _$$RouteResponseImplCopyWith<$Res> {
  __$$RouteResponseImplCopyWithImpl(
      _$RouteResponseImpl _value, $Res Function(_$RouteResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = freezed,
    Object? distance = freezed,
    Object? geometry = freezed,
  }) {
    return _then(_$RouteResponseImpl(
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      geometry: freezed == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as GmtryResponse?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteResponseImpl extends _RouteResponse {
  _$RouteResponseImpl({this.duration, this.distance, this.geometry})
      : super._();

  factory _$RouteResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteResponseImplFromJson(json);

  @override
  final double? duration;
  @override
  final double? distance;
  @override
  final GmtryResponse? geometry;

  @override
  String toString() {
    return 'RouteResponse(duration: $duration, distance: $distance, geometry: $geometry)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteResponseImpl &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.geometry, geometry) ||
                other.geometry == geometry));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, duration, distance, geometry);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteResponseImplCopyWith<_$RouteResponseImpl> get copyWith =>
      __$$RouteResponseImplCopyWithImpl<_$RouteResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteResponseImplToJson(
      this,
    );
  }
}

abstract class _RouteResponse extends RouteResponse {
  factory _RouteResponse(
      {final double? duration,
      final double? distance,
      final GmtryResponse? geometry}) = _$RouteResponseImpl;
  _RouteResponse._() : super._();

  factory _RouteResponse.fromJson(Map<String, dynamic> json) =
      _$RouteResponseImpl.fromJson;

  @override
  double? get duration;
  @override
  double? get distance;
  @override
  GmtryResponse? get geometry;
  @override
  @JsonKey(ignore: true)
  _$$RouteResponseImplCopyWith<_$RouteResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GmtryResponse _$GmtryResponseFromJson(Map<String, dynamic> json) {
  return _GmtryResponse.fromJson(json);
}

/// @nodoc
mixin _$GmtryResponse {
  @ListLatLngJsonConverter()
  List<LatLng>? get coordinates => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GmtryResponseCopyWith<GmtryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GmtryResponseCopyWith<$Res> {
  factory $GmtryResponseCopyWith(
          GmtryResponse value, $Res Function(GmtryResponse) then) =
      _$GmtryResponseCopyWithImpl<$Res, GmtryResponse>;
  @useResult
  $Res call(
      {@ListLatLngJsonConverter() List<LatLng>? coordinates, String? type});
}

/// @nodoc
class _$GmtryResponseCopyWithImpl<$Res, $Val extends GmtryResponse>
    implements $GmtryResponseCopyWith<$Res> {
  _$GmtryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coordinates = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      coordinates: freezed == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<LatLng>?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GmtryResponseImplCopyWith<$Res>
    implements $GmtryResponseCopyWith<$Res> {
  factory _$$GmtryResponseImplCopyWith(
          _$GmtryResponseImpl value, $Res Function(_$GmtryResponseImpl) then) =
      __$$GmtryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@ListLatLngJsonConverter() List<LatLng>? coordinates, String? type});
}

/// @nodoc
class __$$GmtryResponseImplCopyWithImpl<$Res>
    extends _$GmtryResponseCopyWithImpl<$Res, _$GmtryResponseImpl>
    implements _$$GmtryResponseImplCopyWith<$Res> {
  __$$GmtryResponseImplCopyWithImpl(
      _$GmtryResponseImpl _value, $Res Function(_$GmtryResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coordinates = freezed,
    Object? type = freezed,
  }) {
    return _then(_$GmtryResponseImpl(
      coordinates: freezed == coordinates
          ? _value._coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<LatLng>?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GmtryResponseImpl extends _GmtryResponse {
  _$GmtryResponseImpl(
      {@ListLatLngJsonConverter() final List<LatLng>? coordinates, this.type})
      : _coordinates = coordinates,
        super._();

  factory _$GmtryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GmtryResponseImplFromJson(json);

  final List<LatLng>? _coordinates;
  @override
  @ListLatLngJsonConverter()
  List<LatLng>? get coordinates {
    final value = _coordinates;
    if (value == null) return null;
    if (_coordinates is EqualUnmodifiableListView) return _coordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? type;

  @override
  String toString() {
    return 'GmtryResponse(coordinates: $coordinates, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GmtryResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._coordinates, _coordinates) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_coordinates), type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GmtryResponseImplCopyWith<_$GmtryResponseImpl> get copyWith =>
      __$$GmtryResponseImplCopyWithImpl<_$GmtryResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GmtryResponseImplToJson(
      this,
    );
  }
}

abstract class _GmtryResponse extends GmtryResponse {
  factory _GmtryResponse(
      {@ListLatLngJsonConverter() final List<LatLng>? coordinates,
      final String? type}) = _$GmtryResponseImpl;
  _GmtryResponse._() : super._();

  factory _GmtryResponse.fromJson(Map<String, dynamic> json) =
      _$GmtryResponseImpl.fromJson;

  @override
  @ListLatLngJsonConverter()
  List<LatLng>? get coordinates;
  @override
  String? get type;
  @override
  @JsonKey(ignore: true)
  _$$GmtryResponseImplCopyWith<_$GmtryResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
