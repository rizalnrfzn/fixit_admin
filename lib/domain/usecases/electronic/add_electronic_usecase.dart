import 'package:dartz/dartz.dart';
import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';
import 'package:flutter/services.dart';

class AddElectronicUsecase extends UseCase<Electronic, AddElectronicParams> {
  final ElectronicRepository _repository;

  AddElectronicUsecase(this._repository);

  @override
  Future<Either<Failure, Electronic>> call(AddElectronicParams params) =>
      _repository.addElectronic(params);
}

class AddElectronicParams {
  final Electronic electronic;
  final Uint8List picture;

  AddElectronicParams({
    required this.electronic,
    required this.picture,
  });
}
