import 'package:dartz/dartz.dart';
import 'package:fixit_admin/core/error/failure.dart';
import 'package:fixit_admin/data/data.dart';
import 'package:fixit_admin/domain/domain.dart';
import 'package:fixit_admin/domain/usecases/auth/edit_profile_usecase.dart';
import 'package:fixit_admin/utils/utils.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _datasource;

  AuthRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, AuthUser>> login(LoginParams params) async {
    final response = await _datasource.login(params);

    return response.fold(
      (l) => Left(l),
      (r) {
        SharedPref.setIsLogin();
        SharedPref.setInfoUser(r.toEntity());

        return Right(r.toEntity());
      },
    );
  }

  @override
  Future<Either<Failure, AuthUser>> registration(
      RegistrationParams params) async {
    final response = await _datasource.registration(params);

    return response.fold(
      (l) => Left(l),
      (r) {
        SharedPref.setIsLogin();
        SharedPref.setInfoUser(r.toEntity());

        return Right(r.toEntity());
      },
    );
  }

  @override
  Future<Either<Failure, AuthUser>> editProfile(EditUserParams params) async {
    final response = await _datasource.editProfile(params);

    return response.fold(
      (l) => Left(l),
      (r) => Right(r.toEntity()),
    );
  }
}
