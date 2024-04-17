import 'package:dartz/dartz.dart';
import 'package:fixit_admin/core/error/failure.dart';
import 'package:fixit_admin/data/datasources/electronic_remote_datasource.dart';
import 'package:fixit_admin/domain/domain.dart';

class ElectronicRepositoryImpl implements ElectronicRepository {
  final ElectronicRemoteDatasource _datasource;

  ElectronicRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, Electronic>> getElectronic(String params) async {
    final response = await _datasource.getElectronic(params);

    return response.fold(
      (l) => Left(l),
      (r) => Right(r.toEntity()),
    );
  }

  @override
  Future<Either<Failure, List<Electronic>>> getAllElectronic() async {
    final response = await _datasource.getAllElectronic();

    return response.fold(
      (l) => Left(l),
      (r) => Right(r.map((e) => e.toEntity()).toList()),
    );
  }

  @override
  Future<Either<Failure, Electronic>> addElectronic(
      AddElectronicParams params) async {
    final response = await _datasource.addElectronic(params);

    return response.fold(
      (l) => Left(l),
      (r) => Right(r.toEntity()),
    );
  }

  @override
  Future<Either<Failure, Electronic>> editElectronic(
      EditElectronicParams params) async {
    final response = await _datasource.editElectronic(params);

    return response.fold(
      (l) => Left(l),
      (r) => Right(r.toEntity()),
    );
  }

  @override
  Future<Either<Failure, Electronic>> deleteElectronic(String params) async {
    final response = await _datasource.deleteElectronic(params);

    return response.fold(
      (l) => Left(l),
      (r) => Right(r.toEntity()),
    );
  }
}
