import 'package:dartz/dartz.dart';
import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';

abstract class ElectronicRepository {
  Future<Either<Failure, Electronic>> getElectronic(String params);

  Future<Either<Failure, List<Electronic>>> getAllElectronic();

  Future<Either<Failure, Electronic>> addElectronic(AddElectronicParams params);

  Future<Either<Failure, Electronic>> editElectronic(
      EditElectronicParams params);

  Future<Either<Failure, Electronic>> deleteElectronic(String params);
}
