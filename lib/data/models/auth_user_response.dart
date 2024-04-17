import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixit_admin/domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user_response.freezed.dart';
part 'auth_user_response.g.dart';

@freezed
class AuthUserResponse with _$AuthUserResponse {
  factory AuthUserResponse({
    String? uid,
    String? name,
    String? email,
    String? profilePicture,
  }) = _AuthUserResponse;

  AuthUserResponse._();

  factory AuthUserResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthUserResponseFromJson(json);

  factory AuthUserResponse.fromFirestore(
          DocumentSnapshot snapshot, SnapshotOptions? options) =>
      AuthUserResponse.fromJson(snapshot.data() as Map<String, dynamic>);

  static Map<String, dynamic> toFirestore(
          AuthUserResponse object, SetOptions? options) =>
      object.toJson();

  AuthUser toEntity() => AuthUser(
        uid: uid,
        name: name,
        email: email,
        profilePicture: profilePicture,
      );
}
