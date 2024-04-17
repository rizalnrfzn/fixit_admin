import 'package:dartz/dartz.dart';
import 'package:fixit_admin/core/error/failure.dart';
import 'package:fixit_admin/data/data.dart';
import 'package:fixit_admin/domain/domain.dart';

class ClientRepositoryImpl implements ClientRepository {
  final ClientRemoteDatasource _datasource;

  ClientRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, Client>> getClient(String params) async {
    final response = await _datasource.getClient(params);

    return response.fold(
      (l) => Left(l),
      (r) => Right(r.toEntity()),
    );
  }

  @override
  Future<Either<Failure, List<Client>>> getAllClients() async {
    final response = await _datasource.getAllClients();

    return response.fold(
      (l) => Left(l),
      (r) => Right(r.map((e) => e.toEntity()).toList()),
    );
  }

  @override
  Future<Either<Failure, int>> getTotalClient() async {
    final response = await _datasource.getTotalClient();

    return response.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }
}
