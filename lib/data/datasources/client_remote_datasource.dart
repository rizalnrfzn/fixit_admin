import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/data/data.dart';

abstract class ClientRemoteDatasource {
  Future<Either<Failure, ClientResponse>> getClient(String params);

  Future<Either<Failure, List<ClientResponse>>> getAllClients();

  Future<Either<Failure, int>> getTotalClient();
}

class ClientRemoteDatasourceImpl implements ClientRemoteDatasource {
  final _collRef = FirebaseFirestore.instance
      .collection('client')
      .withConverter<ClientResponse>(
        fromFirestore: ClientResponse.fromFirestore,
        toFirestore: ClientResponse.toFirestore,
      );

  @override
  Future<Either<Failure, ClientResponse>> getClient(String params) async {
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
  Future<Either<Failure, List<ClientResponse>>> getAllClients() async {
    try {
      final query = await _collRef.where('isRegistered', isEqualTo: true).get();
      final listClient = query.docs.map((e) => e.data()).toList();

      if (listClient.isEmpty) {
        return Left(FirestoreFailure('Data tidak ada'));
      } else {
        return Right(listClient);
      }
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure(e.code));
    }
  }

  @override
  Future<Either<Failure, int>> getTotalClient() async {
    try {
      final query = await _collRef.where('isRegistered', isEqualTo: true).get();

      final total = query.docs.map((e) => e.data()).length;

      return Right(total);
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure(e.code));
    }
  }
}
