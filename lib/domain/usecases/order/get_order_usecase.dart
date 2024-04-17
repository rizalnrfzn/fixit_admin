import 'package:dartz/dartz.dart';
import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';

class GetOrderUsecase extends UseCase<RepairOrder, String> {
  final RepairOrderRepository _repository;

  GetOrderUsecase(this._repository);

  @override
  Future<Either<Failure, RepairOrder>> call(String params) =>
      _repository.getOrder(params);
}
