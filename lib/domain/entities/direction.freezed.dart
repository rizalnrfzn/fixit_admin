// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'direction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Direction _$DirectionFromJson(Map<String, dynamic> json) {
  return _Direction.fromJson(json);
}

/// @nodoc
mixin _$Direction {
  List<Route>? get routes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DirectionCopyWith<Direction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DirectionCopyWith<$Res> {
  factory $DirectionCopyWith(Direction value, $Res Function(Direction) then) =
      _$DirectionCopyWithImpl<$Res, Direction>;
  @useResult
  $Res call({List<Route>? routes});
}

/// @nodoc
class _$DirectionCopyWithImpl<$Res, $Val extends Direction>
    implements $DirectionCopyWith<$Res> {
  _$DirectionCopyWithImpl(this._value, this._then);

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
              as List<Route>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DirectionImplCopyWith<$Res>
    implements $DirectionCopyWith<$Res> {
  factory _$$DirectionImplCopyWith(
          _$DirectionImpl value, $Res Function(_$DirectionImpl) then) =
      __$$DirectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Route>? routes});
}

/// @nodoc
class __$$DirectionImplCopyWithImpl<$Res>
    extends _$DirectionCopyWithImpl<$Res, _$DirectionImpl>
    implements _$$DirectionImplCopyWith<$Res> {
  __$$DirectionImplCopyWithImpl(
      _$DirectionImpl _value, $Res Function(_$DirectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routes = freezed,
  }) {
    return _then(_$DirectionImpl(
      routes: freezed == routes
          ? _value._routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<Route>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DirectionImpl extends _Direction {
  _$DirectionImpl({final List<Route>? routes})
      : _routes = routes,
        super._();

  factory _$DirectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$DirectionImplFromJson(json);

  final List<Route>? _routes;
  @override
  List<Route>? get routes {
    final value = _routes;
    if (value == null) return null;
    if (_routes is EqualUnmodifiableListView) return _routes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Direction(routes: $routes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DirectionImpl &&
            const DeepCollectionEquality().equals(other._routes, _routes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_routes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DirectionImplCopyWith<_$DirectionImpl> get copyWith =>
      __$$DirectionImplCopyWithImpl<_$DirectionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DirectionImplToJson(
      this,
    );
  }
}

abstract class _Direction extends Direction {
  factory _Direction({final List<Route>? routes}) = _$DirectionImpl;
  _Direction._() : super._();

  factory _Direction.fromJson(Map<String, dynamic> json) =
      _$DirectionImpl.fromJson;

  @override
  List<Route>? get routes;
  @override
  @JsonKey(ignore: true)
  _$$DirectionImplCopyWith<_$DirectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Route _$RouteFromJson(Map<String, dynamic> json) {
  return _Route.fromJson(json);
}

/// @nodoc
mixin _$Route {
  double? get duration => throw _privateConstructorUsedError;
  double? get distance => throw _privateConstructorUsedError;
  Gmtry? get geometry => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteCopyWith<Route> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteCopyWith<$Res> {
  factory $RouteCopyWith(Route value, $Res Function(Route) then) =
      _$RouteCopyWithImpl<$Res, Route>;
  @useResult
  $Res call({double? duration, double? distance, Gmtry? geometry});

  $GmtryCopyWith<$Res>? get geometry;
}

/// @nodoc
class _$RouteCopyWithImpl<$Res, $Val extends Route>
    implements $RouteCopyWith<$Res> {
  _$RouteCopyWithImpl(this._value, this._then);

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
              as Gmtry?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GmtryCopyWith<$Res>? get geometry {
    if (_value.geometry == null) {
      return null;
    }

    return $GmtryCopyWith<$Res>(_value.geometry!, (value) {
      return _then(_value.copyWith(geometry: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RouteImplCopyWith<$Res> implements $RouteCopyWith<$Res> {
  factory _$$RouteImplCopyWith(
          _$RouteImpl value, $Res Function(_$RouteImpl) then) =
      __$$RouteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? duration, double? distance, Gmtry? geometry});

  @override
  $GmtryCopyWith<$Res>? get geometry;
}

/// @nodoc
class __$$RouteImplCopyWithImpl<$Res>
    extends _$RouteCopyWithImpl<$Res, _$RouteImpl>
    implements _$$RouteImplCopyWith<$Res> {
  __$$RouteImplCopyWithImpl(
      _$RouteImpl _value, $Res Function(_$RouteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = freezed,
    Object? distance = freezed,
    Object? geometry = freezed,
  }) {
    return _then(_$RouteImpl(
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
              as Gmtry?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteImpl extends _Route {
  _$RouteImpl({this.duration, this.distance, this.geometry}) : super._();

  factory _$RouteImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteImplFromJson(json);

  @override
  final double? duration;
  @override
  final double? distance;
  @override
  final Gmtry? geometry;

  @override
  String toString() {
    return 'Route(duration: $duration, distance: $distance, geometry: $geometry)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteImpl &&
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
  _$$RouteImplCopyWith<_$RouteImpl> get copyWith =>
      __$$RouteImplCopyWithImpl<_$RouteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteImplToJson(
      this,
    );
  }
}

abstract class _Route extends Route {
  factory _Route(
      {final double? duration,
      final double? distance,
      final Gmtry? geometry}) = _$RouteImpl;
  _Route._() : super._();

  factory _Route.fromJson(Map<String, dynamic> json) = _$RouteImpl.fromJson;

  @override
  double? get duration;
  @override
  double? get distance;
  @override
  Gmtry? get geometry;
  @override
  @JsonKey(ignore: true)
  _$$RouteImplCopyWith<_$RouteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Gmtry _$GmtryFromJson(Map<String, dynamic> json) {
  return _Gmtry.fromJson(json);
}

/// @nodoc
mixin _$Gmtry {
  @ListLatLngJsonConverter()
  List<LatLng>? get coordinates => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GmtryCopyWith<Gmtry> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GmtryCopyWith<$Res> {
  factory $GmtryCopyWith(Gmtry value, $Res Function(Gmtry) then) =
      _$GmtryCopyWithImpl<$Res, Gmtry>;
  @useResult
  $Res call(
      {@ListLatLngJsonConverter() List<LatLng>? coordinates, String? type});
}

/// @nodoc
class _$GmtryCopyWithImpl<$Res, $Val extends Gmtry>
    implements $GmtryCopyWith<$Res> {
  _$GmtryCopyWithImpl(this._value, this._then);

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
abstract class _$$GmtryImplCopyWith<$Res> implements $GmtryCopyWith<$Res> {
  factory _$$GmtryImplCopyWith(
          _$GmtryImpl value, $Res Function(_$GmtryImpl) then) =
      __$$GmtryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@ListLatLngJsonConverter() List<LatLng>? coordinates, String? type});
}

/// @nodoc
class __$$GmtryImplCopyWithImpl<$Res>
    extends _$GmtryCopyWithImpl<$Res, _$GmtryImpl>
    implements _$$GmtryImplCopyWith<$Res> {
  __$$GmtryImplCopyWithImpl(
      _$GmtryImpl _value, $Res Function(_$GmtryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coordinates = freezed,
    Object? type = freezed,
  }) {
    return _then(_$GmtryImpl(
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
class _$GmtryImpl extends _Gmtry {
  _$GmtryImpl(
      {@ListLatLngJsonConverter() final List<LatLng>? coordinates, this.type})
      : _coordinates = coordinates,
        super._();

  factory _$GmtryImpl.fromJson(Map<String, dynamic> json) =>
      _$$GmtryImplFromJson(json);

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
    return 'Gmtry(coordinates: $coordinates, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GmtryImpl &&
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
  _$$GmtryImplCopyWith<_$GmtryImpl> get copyWith =>
      __$$GmtryImplCopyWithImpl<_$GmtryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GmtryImplToJson(
      this,
    );
  }
}

abstract class _Gmtry extends Gmtry {
  factory _Gmtry(
      {@ListLatLngJsonConverter() final List<LatLng>? coordinates,
      final String? type}) = _$GmtryImpl;
  _Gmtry._() : super._();

  factory _Gmtry.fromJson(Map<String, dynamic> json) = _$GmtryImpl.fromJson;

  @override
  @ListLatLngJsonConverter()
  List<LatLng>? get coordinates;
  @override
  String? get type;
  @override
  @JsonKey(ignore: true)
  _$$GmtryImplCopyWith<_$GmtryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
