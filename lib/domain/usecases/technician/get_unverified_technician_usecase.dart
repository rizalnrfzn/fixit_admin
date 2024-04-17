import 'package:dartz/dartz.dart';
import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';

class GetUnverifiedTechnicianUsecase
    extends UseCase<List<Technician>, NoParams> {
  final TechnicianRepository _repository;

  GetUnverifiedTechnicianUsecase(this._repository);

  @override
  Future<Either<Failure, List<Technician>>> call(NoParams params) =>
      _repository.getUnverifiedTechnician();
}
