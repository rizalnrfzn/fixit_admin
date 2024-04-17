import 'package:dartz/dartz.dart';
import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';

abstract class ClientRepository {
  Future<Either<Failure, Client>> getClient(String params);

  Future<Either<Failure, List<Client>>> getAllClients();

  Future<Either<Failure, int>> getTotalClient();
}
