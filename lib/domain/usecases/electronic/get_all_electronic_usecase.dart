import 'package:dartz/dartz.dart';
import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';

class GetAllElectronicUsecase extends UseCase<List<Electronic>, NoParams> {
  final ElectronicRepository _repository;

  GetAllElectronicUsecase(this._repository);

  @override
  Future<Either<Failure, List<Electronic>>> call(NoParams params) =>
      _repository.getAllElectronic();
}
