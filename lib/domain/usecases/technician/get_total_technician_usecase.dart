import 'package:dartz/dartz.dart';
import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';

class GetTotalTechnicianUsecase extends UseCase<int, NoParams> {
  final TechnicianRepository _repository;

  GetTotalTechnicianUsecase(this._repository);

  @override
  Future<Either<Failure, int>> call(NoParams params) =>
      _repository.getTotalTechnician();
}
