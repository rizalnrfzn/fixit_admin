import 'package:dartz/dartz.dart';
import 'package:fixit_admin/core/error/failure.dart';
import 'package:fixit_admin/data/data.dart';
import 'package:fixit_admin/domain/domain.dart';

class TechnicianRepositoryImpl implements TechnicianRepository {
  final TechnicianRemoteDatasource _datasource;

  TechnicianRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, Technician>> getTechnician(String params) async {
    final response = await _datasource.getTechnician(params);

    return response.fold(
      (l) => Left(l),
      (r) => Right(r.toEntity()),
    );
  }

  @override
  Future<Either<Failure, List<Technician>>> getAllTechnicians() async {
    final response = await _datasource.getAllTechnicians();

    return response.fold(
      (l) => Left(l),
      (r) => Right(r.map((e) => e.toEntity()).toList()),
    );
  }

  @override
  Future<Either<Failure, List<Technician>>> getUnverifiedTechnician() async {
    final response = await _datasource.getUnverifiedTechnician();

    return response.fold(
      (l) => Left(l),
      (r) => Right(r.map((e) => e.toEntity()).toList()),
    );
  }

  @override
  Future<Either<Failure, int>> getTotalTechnician() async {
    final response = await _datasource.getTotalTechnician();

    return response.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }

  @override
  Future<Either<Failure, int>> getTotalUnverifiedTechnician() async {
    final response = await _datasource.getTotalUnverifiedTechnician();

    return response.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }

  @override
  Future<Either<Failure, Technician>> verifyTechnician(
      Technician params) async {
    final response = await _datasource.verifyTechnician(params);

    return response.fold(
      (l) => Left(l),
      (r) => Right(r.toEntity()),
    );
  }
}
