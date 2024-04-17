import 'package:dartz/dartz.dart';
import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';

class GetTotalUnverifiedTechnicianUsecase extends UseCase<int, NoParams> {
  final TechnicianRepository _repository;

  GetTotalUnverifiedTechnicianUsecase(this._repository);

  @override
  Future<Either<Failure, int>> call(NoParams params) =>
      _repository.getTotalUnverifiedTechnician();
}
