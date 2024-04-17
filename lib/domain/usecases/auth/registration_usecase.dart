import 'package:dartz/dartz.dart';
import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';

class RegistrationUsecase extends UseCase<AuthUser, RegistrationParams> {
  final AuthRepository _repository;

  RegistrationUsecase(this._repository);

  @override
  Future<Either<Failure, AuthUser>> call(RegistrationParams params) =>
      _repository.registration(params);
}

class RegistrationParams {
  final String email;
  final String password;
  final String name;

  RegistrationParams({
    required this.email,
    required this.password,
    required this.name,
  });
}
