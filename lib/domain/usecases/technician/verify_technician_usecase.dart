import 'package:dartz/dartz.dart';
import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';

class VerifyTechnicianUsecase extends UseCase<Technician, Technician> {
  final TechnicianRepository _repository;

  VerifyTechnicianUsecase(this._repository);

  @override
  Future<Either<Failure, Technician>> call(Technician params) =>
      _repository.verifyTechnician(params);
}
