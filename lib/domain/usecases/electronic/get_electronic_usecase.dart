import 'package:dartz/dartz.dart';
import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';

class GetElectronicUsecase extends UseCase<Electronic, String> {
  final ElectronicRepository _repository;

  GetElectronicUsecase(this._repository);

  @override
  Future<Either<Failure, Electronic>> call(String params) =>
      _repository.getElectronic(params);
}
