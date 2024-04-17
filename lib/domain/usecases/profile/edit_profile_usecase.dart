import 'package:dartz/dartz.dart';
import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';
import 'package:flutter/services.dart';

class EditProfileUsecase extends UseCase<AuthUser, EditProfileParams> {
  final ProfileRepository _repository;

  EditProfileUsecase(this._repository);

  @override
  Future<Either<Failure, AuthUser>> call(EditProfileParams params) =>
      _repository.editProfile(params);
}

class EditProfileParams {
  final AuthUser user;
  final Uint8List? file;

  EditProfileParams({
    required this.user,
    required this.file,
  });
}
