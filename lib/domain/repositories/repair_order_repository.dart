import 'package:dartz/dartz.dart';
import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';

abstract class RepairOrderRepository {
  Future<Either<Failure, List<RepairOrder>>> recentOrder();

  Future<Either<Failure, List<RepairOrder>>> allOrder();

  Future<Either<Failure, RepairOrder>> getOrder(String params);
}
