import 'package:fixit_admin/data/data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user.freezed.dart';
part 'auth_user.g.dart';

@freezed
class AuthUser with _$AuthUser {
  factory AuthUser({
    String? uid,
    String? name,
    String? email,
    String? profilePicture,
  }) = _AuthUser;

  AuthUser._();

  factory AuthUser.fromJson(Map<String, dynamic> json) =>
      _$AuthUserFromJson(json);

  AuthUserResponse toModel() => AuthUserResponse(
        uid: uid,
        name: name,
        email: email,
        profilePicture: profilePicture,
      );
}
