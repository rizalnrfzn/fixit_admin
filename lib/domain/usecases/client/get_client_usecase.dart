import 'package:dartz/dartz.dart';
import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';

class GetClientUsecase extends UseCase<Client, String> {
  final ClientRepository _repository;

  GetClientUsecase(this._repository);

  @override
  Future<Either<Failure, Client>> call(String params) =>
      _repository.getClient(params);
}
