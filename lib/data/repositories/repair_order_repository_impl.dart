import 'package:dartz/dartz.dart';
import 'package:fixit_admin/core/error/failure.dart';
import 'package:fixit_admin/data/data.dart';
import 'package:fixit_admin/domain/domain.dart';

class RepairOrderRepositoryImpl implements RepairOrderRepository {
  final RepairOrderRemoteDatasource _datasource;

  RepairOrderRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, List<RepairOrder>>> allOrder() async {
    final response = await _datasource.allOrders();

    return response.fold(
      (l) => Left(l),
      (r) => Right(r.map((e) => e.toEntity()).toList()),
    );
  }

  @override
  Future<Either<Failure, List<RepairOrder>>> recentOrder() async {
    final response = await _datasource.recentOrders();

    return response.fold(
      (l) => Left(l),
      (r) => Right(r.map((e) => e.toEntity()).toList()),
    );
  }

  @override
  Future<Either<Failure, RepairOrder>> getOrder(String params) async {
    final response = await _datasource.getOrder(params);

    return response.fold(
      (l) => Left(l),
      (r) => Right(r.toEntity()),
    );
  }
}
