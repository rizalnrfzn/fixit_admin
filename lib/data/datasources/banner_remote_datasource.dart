import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/data/data.dart';
import 'package:fixit_admin/domain/domain.dart';

abstract class BannerRemoteDatasource {
  Future<Either<Failure, BannerAdResponse>> getBanner(String params);

  Future<Either<Failure, List<BannerAdResponse>>> getAllBanner();

  Future<Either<Failure, BannerAdResponse>> addBanner(AddBannerParams params);

  Future<Either<Failure, BannerAdResponse>> editBanner(EditBannerParams params);

  Future<Either<Failure, BannerAdResponse>> deleteBanner(String params);
}

class BannerRemoteDatasourceImpl implements BannerRemoteDatasource {
  final _collRef = FirebaseFirestore.instance
      .collection('banner')
      .withConverter<BannerAdResponse>(
        fromFirestore: BannerAdResponse.fromFirestore,
        toFirestore: BannerAdResponse.toFirestore,
      );

  final _storage = FirebaseStorage.instance.ref('banner');

  @override
  Future<Either<Failure, BannerAdResponse>> getBanner(String params) async {
    try {
      final query = await _collRef.doc(params).get();
      if (query.exists) {
        final data = query.data();
        return Right(data!);
      } else {
        return Left(FirestoreFailure('Banner tidak ditemukan'));
      }
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, List<BannerAdResponse>>> getAllBanner() async {
    try {
      final query = await _collRef.get();

      final listData = query.docs.map((e) => e.data()).toList();

      return Right(listData);
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, BannerAdResponse>> addBanner(
      AddBannerParams params) async {
    try {
      late String picture;
      final data = await _collRef.add(params.banner.toModel());

      final idBanner = data.id;

      final imageRef = _storage.child('$idBanner.png');

      await imageRef.putData(params.picture);

      picture = await imageRef.getDownloadURL();

      final newBanner =
          params.banner.copyWith(id: idBanner, image: picture).toModel();

      await _collRef.doc(idBanner).update(newBanner.toJson());

      return Right(newBanner);
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure(e.code));
    }
  }

  @override
  Future<Either<Failure, BannerAdResponse>> editBanner(
      EditBannerParams params) async {
    try {
      final imageRef = _storage.child('${params.banner.id}.png');
      String? picture;

      if (params.picture != null) {
        await imageRef.putData(params.picture!);
        picture = await imageRef.getDownloadURL();
      } else {
        picture = params.banner.image;
      }

      final data = params.banner.copyWith(image: picture).toModel();

      await _collRef.doc(params.banner.id).update(data.toJson());

      return Right(data);
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure(e.code));
    }
  }

  @override
  Future<Either<Failure, BannerAdResponse>> deleteBanner(
    String params,
  ) async {
    try {
      final imageRef = _storage.child('$params.png');

      await imageRef.delete();

      await _collRef.doc(params).delete();

      return Right(BannerAdResponse(id: params));
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure(e.code));
    }
  }
}
