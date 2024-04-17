// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'electronic_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ElectronicResponse _$ElectronicResponseFromJson(Map<String, dynamic> json) {
  return _ElectronicResponse.fromJson(json);
}

/// @nodoc
mixin _$ElectronicResponse {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  List<String> get gripe => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ElectronicResponseCopyWith<ElectronicResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ElectronicResponseCopyWith<$Res> {
  factory $ElectronicResponseCopyWith(
          ElectronicResponse value, $Res Function(ElectronicResponse) then) =
      _$ElectronicResponseCopyWithImpl<$Res, ElectronicResponse>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? description,
      String? image,
      List<String> gripe});
}

/// @nodoc
class _$ElectronicResponseCopyWithImpl<$Res, $Val extends ElectronicResponse>
    implements $ElectronicResponseCopyWith<$Res> {
  _$ElectronicResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? image = freezed,
    Object? gripe = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      gripe: null == gripe
          ? _value.gripe
          : gripe // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ElectronicResponseImplCopyWith<$Res>
    implements $ElectronicResponseCopyWith<$Res> {
  factory _$$ElectronicResponseImplCopyWith(_$ElectronicResponseImpl value,
          $Res Function(_$ElectronicResponseImpl) then) =
      __$$ElectronicResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? description,
      String? image,
      List<String> gripe});
}

/// @nodoc
class __$$ElectronicResponseImplCopyWithImpl<$Res>
    extends _$ElectronicResponseCopyWithImpl<$Res, _$ElectronicResponseImpl>
    implements _$$ElectronicResponseImplCopyWith<$Res> {
  __$$ElectronicResponseImplCopyWithImpl(_$ElectronicResponseImpl _value,
      $Res Function(_$ElectronicResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? image = freezed,
    Object? gripe = null,
  }) {
    return _then(_$ElectronicResponseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      gripe: null == gripe
          ? _value._gripe
          : gripe // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ElectronicResponseImpl extends _ElectronicResponse {
  _$ElectronicResponseImpl(
      {this.id,
      this.name,
      this.description,
      this.image,
      final List<String> gripe = const []})
      : _gripe = gripe,
        super._();

  factory _$ElectronicResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ElectronicResponseImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? image;
  final List<String> _gripe;
  @override
  @JsonKey()
  List<String> get gripe {
    if (_gripe is EqualUnmodifiableListView) return _gripe;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_gripe);
  }

  @override
  String toString() {
    return 'ElectronicResponse(id: $id, name: $name, description: $description, image: $image, gripe: $gripe)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ElectronicResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other._gripe, _gripe));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, image,
      const DeepCollectionEquality().hash(_gripe));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ElectronicResponseImplCopyWith<_$ElectronicResponseImpl> get copyWith =>
      __$$ElectronicResponseImplCopyWithImpl<_$ElectronicResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ElectronicResponseImplToJson(
      this,
    );
  }
}

abstract class _ElectronicResponse extends ElectronicResponse {
  factory _ElectronicResponse(
      {final String? id,
      final String? name,
      final String? description,
      final String? image,
      final List<String> gripe}) = _$ElectronicResponseImpl;
  _ElectronicResponse._() : super._();

  factory _ElectronicResponse.fromJson(Map<String, dynamic> json) =
      _$ElectronicResponseImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get description;
  @override
  String? get image;
  @override
  List<String> get gripe;
  @override
  @JsonKey(ignore: true)
  _$$ElectronicResponseImplCopyWith<_$ElectronicResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
