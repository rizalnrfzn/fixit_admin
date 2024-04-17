import 'package:dartz/dartz.dart';
import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';
import 'package:flutter/services.dart';

class EditElectronicUsecase extends UseCase<Electronic, EditElectronicParams> {
  final ElectronicRepository _repository;

  EditElectronicUsecase(this._repository);

  @override
  Future<Either<Failure, Electronic>> call(EditElectronicParams params) =>
      _repository.editElectronic(params);
}

class EditElectronicParams {
  final Electronic electronic;
  final Uint8List? picture;

  EditElectronicParams({
    required this.electronic,
    this.picture,
  });
}
