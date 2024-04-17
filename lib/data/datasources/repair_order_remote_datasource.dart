import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/data/data.dart';

abstract class RepairOrderRemoteDatasource {
  Future<Either<Failure, List<RepairOrderResponse>>> recentOrders();

  Future<Either<Failure, List<RepairOrderResponse>>> allOrders();

  Future<Either<Failure, RepairOrderResponse>> getOrder(String params);
}

class RepairOrderRemoteDatasourceImpl implements RepairOrderRemoteDatasource {
  final _collRef = FirebaseFirestore.instance
      .collection('order')
      .withConverter<RepairOrderResponse>(
        fromFirestore: RepairOrderResponse.fromFirestore,
        toFirestore: RepairOrderResponse.toFirestore,
      );

  @override
  Future<Either<Failure, List<RepairOrderResponse>>> allOrders() async {
    try {
      final query = await _collRef.get();

      final listOrder = query.docs.map((e) => e.data()).toList();

      return Right(listOrder);
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, List<RepairOrderResponse>>> recentOrders() async {
    try {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day - 2, 0, 1);

      final query = await _collRef
          .where('dateTime', isGreaterThanOrEqualTo: Timestamp.fromDate(today))
          .get();

      final listOrder = query.docs.map((e) => e.data()).toList();

      return Right(listOrder);
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, RepairOrderResponse>> getOrder(String params) async {
    try {
      final query = await _collRef.doc(params).get();

      final order = query.data()!;

      return Right(order);
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure(e.message!));
    }
  }
}
