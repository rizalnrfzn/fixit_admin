import 'package:dartz/dartz.dart';
import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';
import 'package:fixit_admin/domain/usecases/auth/edit_profile_usecase.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthUser>> login(LoginParams params);

  Future<Either<Failure, AuthUser>> registration(RegistrationParams params);

  Future<Either<Failure, AuthUser>> editProfile(EditUserParams params);
}
