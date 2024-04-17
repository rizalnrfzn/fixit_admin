import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';

class EditProfileUsecase extends UseCase<AuthUser, EditUserParams> {
  final AuthRepository _repository;

  EditProfileUsecase(this._repository);

  @override
  Future<Either<Failure, AuthUser>> call(EditUserParams params) =>
      _repository.editProfile(params);
}

class EditUserParams {
  final AuthUser user;
  final Uint8List? profilePicture;

  EditUserParams({
    required this.user,
    required this.profilePicture,
  });
}
