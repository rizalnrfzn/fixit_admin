import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixit_admin/domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'electronic_response.freezed.dart';
part 'electronic_response.g.dart';

@freezed
class ElectronicResponse with _$ElectronicResponse {
  factory ElectronicResponse({
    String? id,
    String? name,
    String? description,
    String? image,
    @Default([]) List<String> gripe,
  }) = _ElectronicResponse;

  ElectronicResponse._();

  factory ElectronicResponse.fromJson(Map<String, dynamic> json) =>
      _$ElectronicResponseFromJson(json);

  factory ElectronicResponse.fromFirestore(
          DocumentSnapshot snapshot, SnapshotOptions? options) =>
      ElectronicResponse.fromJson(snapshot.data() as Map<String, dynamic>);

  static Map<String, dynamic> toFirestore(
          ElectronicResponse object, SetOptions? options) =>
      object.toJson();

  Electronic toEntity() => Electronic(
        id: id,
        name: name,
        description: description,
        image: image,
        gripe: gripe,
      );
}
