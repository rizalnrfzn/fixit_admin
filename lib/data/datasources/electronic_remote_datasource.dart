import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/data/data.dart';
import 'package:fixit_admin/domain/domain.dart';

abstract class ElectronicRemoteDatasource {
  Future<Either<Failure, ElectronicResponse>> getElectronic(String params);

  Future<Either<Failure, List<ElectronicResponse>>> getAllElectronic();

  Future<Either<Failure, ElectronicResponse>> addElectronic(
      AddElectronicParams params);

  Future<Either<Failure, ElectronicResponse>> editElectronic(
      EditElectronicParams params);

  Future<Either<Failure, ElectronicResponse>> deleteElectronic(String params);
}

class ElectronicRemoteDatasourceImpl implements ElectronicRemoteDatasource {
  final _collRef = FirebaseFirestore.instance
      .collection('electronic')
      .withConverter<ElectronicResponse>(
        fromFirestore: ElectronicResponse.fromFirestore,
        toFirestore: ElectronicResponse.toFirestore,
      );

  final _storage = FirebaseStorage.instance.ref('electronic');

  @override
  Future<Either<Failure, ElectronicResponse>> getElectronic(
      String params) async {
    try {
      final query = await _collRef.doc(params).get();
      if (query.exists) {
        final data = query.data();
        return Right(data!);
      } else {
        return Left(FirestoreFailure('Elektronik tidak ditemukan'));
      }
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, List<ElectronicResponse>>> getAllElectronic() async {
    try {
      final query = await _collRef.get();

      final listData = query.docs.map((e) => e.data()).toList();

      return Right(listData);
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, ElectronicResponse>> addElectronic(
      AddElectronicParams params) async {
    try {
      late String picture;
      final data = await _collRef.add(params.electronic.toModel());

      final idElectronic = data.id;

      final imageRef = _storage.child('$idElectronic.png');

      await imageRef.putData(params.picture);

      picture = await imageRef.getDownloadURL();

      final newElectronic = params.electronic
          .copyWith(id: idElectronic, image: picture)
          .toModel();

      await _collRef.doc(idElectronic).update(newElectronic.toJson());

      return Right(newElectronic);
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure(e.code));
    }
  }

  @override
  Future<Either<Failure, ElectronicResponse>> editElectronic(
      EditElectronicParams params) async {
    try {
      final imageRef = _storage.child('${params.electronic.id}.png');
      String? picture;

      if (params.picture != null) {
        await imageRef.putData(params.picture!);
        picture = await imageRef.getDownloadURL();
      } else {
        picture = params.electronic.image;
      }

      final data = params.electronic.copyWith(image: picture).toModel();

      await _collRef.doc(params.electronic.id).update(data.toJson());

      return Right(data);
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure(e.code));
    }
  }

  @override
  Future<Either<Failure, ElectronicResponse>> deleteElectronic(
    String params,
  ) async {
    try {
      final imageRef = _storage.child('$params.png');

      await imageRef.delete();

      await _collRef.doc(params).delete();

      return Right(ElectronicResponse(id: params));
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure(e.code));
    }
  }
}
