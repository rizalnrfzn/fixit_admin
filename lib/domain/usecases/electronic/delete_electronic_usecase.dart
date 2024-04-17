import 'package:dartz/dartz.dart';
import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';

class DeleteElectronicUsecase extends UseCase<Electronic, String> {
  final ElectronicRepository _repository;

  DeleteElectronicUsecase(this._repository);

  @override
  Future<Either<Failure, Electronic>> call(String params) =>
      _repository.deleteElectronic(params);
}
