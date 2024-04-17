import 'package:dartz/dartz.dart';
import 'package:fixit_admin/core/error/failure.dart';
import 'package:fixit_admin/data/data.dart';
import 'package:fixit_admin/domain/domain.dart';
import 'package:fixit_admin/utils/utils.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDatasource _datasource;

  ProfileRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, AuthUser>> editProfile(
      EditProfileParams params) async {
    final response = await _datasource.editProfile(params);

    return response.fold(
      (l) => Left(l),
      (r) {
        SharedPref.setInfoUser(r.toEntity());
        return Right(r.toEntity());
      },
    );
  }
}
