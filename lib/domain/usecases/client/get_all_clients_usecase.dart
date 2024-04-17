import 'package:dartz/dartz.dart';
import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';

class GetAllClientsUsecase extends UseCase<List<Client>, NoParams> {
  final ClientRepository _repository;

  GetAllClientsUsecase(this._repository);

  @override
  Future<Either<Failure, List<Client>>> call(NoParams params) =>
      _repository.getAllClients();
}
