import 'package:dartz/dartz.dart';
import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';

abstract class TechnicianRepository {
  Future<Either<Failure, Technician>> getTechnician(String params);

  Future<Either<Failure, List<Technician>>> getAllTechnicians();

  Future<Either<Failure, List<Technician>>> getUnverifiedTechnician();

  Future<Either<Failure, int>> getTotalTechnician();

  Future<Either<Failure, int>> getTotalUnverifiedTechnician();

  Future<Either<Failure, Technician>> verifyTechnician(Technician params);
}
