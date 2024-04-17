import 'package:dartz/dartz.dart';
import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';

class GetTechnicianUsecase extends UseCase<Technician, String> {
  final TechnicianRepository _repository;

  GetTechnicianUsecase(this._repository);

  @override
  Future<Either<Failure, Technician>> call(String params) =>
      _repository.getTechnician(params);
}
