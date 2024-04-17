import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/data/data.dart';
import 'package:fixit_admin/domain/domain.dart';

abstract class ProfileRemoteDatasource {
  Future<Either<Failure, AuthUserResponse>> editProfile(
      EditProfileParams params);
}

class ProfileRemoteDatasourceImpl implements ProfileRemoteDatasource {
  final _collRef = FirebaseFirestore.instance
      .collection('admin')
      .withConverter<AuthUserResponse>(
        fromFirestore: AuthUserResponse.fromFirestore,
        toFirestore: AuthUserResponse.toFirestore,
      );

  final _storage = FirebaseStorage.instance.ref('admin');

  @override
  Future<Either<Failure, AuthUserResponse>> editProfile(
      EditProfileParams params) async {
    try {
      final imageRef = _storage.child('${params.user.uid}/profilePicture.png');
      String? profilePicture;

      if (params.file != null) {
        await imageRef.putData(params.file!);
        profilePicture = await imageRef.getDownloadURL();
      } else {
        profilePicture = params.user.profilePicture;
      }

      final data =
          params.user.copyWith(profilePicture: profilePicture).toModel();

      await _collRef.doc(params.user.uid).update(data.toJson());

      return Right(data);
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure(e.code));
    }
  }
}
