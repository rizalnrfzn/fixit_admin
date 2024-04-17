import 'package:dartz/dartz.dart';
import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';

abstract class ProfileRepository {
  Future<Either<Failure, AuthUser>> editProfile(EditProfileParams params);
}
