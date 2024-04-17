import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/data/data.dart';
import 'package:fixit_admin/domain/domain.dart';

abstract class TechnicianRemoteDatasource {
  Future<Either<Failure, TechnicianResponse>> getTechnician(String params);

  Future<Either<Failure, List<TechnicianResponse>>> getAllTechnicians();

  Future<Either<Failure, List<TechnicianResponse>>> getUnverifiedTechnician();

  Future<Either<Failure, int>> getTotalTechnician();

  Future<Either<Failure, int>> getTotalUnverifiedTechnician();

  Future<Either<Failure, TechnicianResponse>> verifyTechnician(
      Technician params);
}

class TechnicianRemoteDatasourceImpl implements TechnicianRemoteDatasource {
  final _collRef = FirebaseFirestore.instance
      .collection('technician')
      .withConverter<TechnicianResponse>(
        fromFirestore: TechnicianResponse.fromFirestore,
        toFirestore: TechnicianResponse.toFirestore,
      );

  @override
  Future<Either<Failure, TechnicianResponse>> getTechnician(
      String params) async {
    try {
      final query = await _collRef.doc(params).get();

      if (query.exists) {
        final data = query.data();
        return Right(data!);
      } else {
        return Left(FirestoreFailure('Client tidak ditemukan'));
      }
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, List<TechnicianResponse>>> getAllTechnicians() async {
    try {
      final query = await _collRef.where('isVerified', isEqualTo: true).get();
      final listTechnician = query.docs.map((e) => e.data()).toList();

      if (listTechnician.isEmpty) {
        return Left(FirestoreFailure('Data tidak ada'));
      } else {
        return Right(listTechnician);
      }
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure(e.code));
    }
  }

  @override
  Future<Either<Failure, List<TechnicianResponse>>>
      getUnverifiedTechnician() async {
    try {
      final query = await _collRef
          .where('isRegistered', isEqualTo: true)
          .where('isVerified', isEqualTo: false)
          .get();
      final listTechnician = query.docs.map((e) => e.data()).toList();

      if (listTechnician.isEmpty) {
        return Left(FirestoreFailure('Data tidak ada'));
      } else {
        return Right(listTechnician);
      }
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure(e.code));
    }
  }

  @override
  Future<Either<Failure, int>> getTotalTechnician() async {
    try {
      final query = await _collRef.where('isVerified', isEqualTo: true).get();

      final total = query.docs.map((e) => e.data()).length;

      return Right(total);
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure(e.code));
    }
  }

  @override
  Future<Either<Failure, int>> getTotalUnverifiedTechnician() async {
    try {
      final query = await _collRef
          .where('isRegistered', isEqualTo: true)
          .where('isVerified', isEqualTo: false)
          .get();

      final total = query.docs.map((e) => e.data()).length;

      return Right(total);
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure(e.code));
    }
  }

  @override
  Future<Either<Failure, TechnicianResponse>> verifyTechnician(
      Technician params) async {
    try {
      final technician = params.copyWith(isVerified: true).toModel();

      await _collRef.doc(params.uid).update(technician.toJson());

      return Right(technician);
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure(e.code));
    }
  }
}
