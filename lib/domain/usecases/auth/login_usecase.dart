import 'package:dartz/dartz.dart';
import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';

class LoginUsecase extends UseCase<AuthUser, LoginParams> {
  final AuthRepository _repository;

  LoginUsecase(this._repository);

  @override
  Future<Either<Failure, AuthUser>> call(LoginParams params) =>
      _repository.login(params);
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({
    required this.email,
    required this.password,
  });
}
