import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/data/data.dart';
import 'package:fixit_admin/domain/domain.dart';
import 'package:fixit_admin/domain/usecases/auth/edit_profile_usecase.dart';

abstract class AuthRemoteDatasource {
  Future<Either<Failure, AuthUserResponse>> login(LoginParams params);

  Future<Either<Failure, AuthUserResponse>> registration(
      RegistrationParams params);

  Future<Either<Failure, AuthUserResponse>> editProfile(EditUserParams params);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final _auth = FirebaseAuth.instance;
  final _storage = FirebaseStorage.instance.ref('admin');

  final _collRef = FirebaseFirestore.instance
      .collection('admin')
      .withConverter<AuthUserResponse>(
        fromFirestore: AuthUserResponse.fromFirestore,
        toFirestore: AuthUserResponse.toFirestore,
      );

  @override
  Future<Either<Failure, AuthUserResponse>> login(LoginParams params) async {
    try {
      final account = await _auth.signInWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );

      final accountData = await _collRef.doc(account.user?.uid).get();

      if (!(accountData.exists)) {
        _auth.signOut();
        return Left(AuthFailure('Email sudah terdafter sebagai role lain'));
      }

      return Right(accountData.data()!);
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure(e.code));
    }
  }

  @override
  Future<Either<Failure, AuthUserResponse>> registration(
      RegistrationParams params) async {
    try {
      final account = await _auth.createUserWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );

      final data = AuthUserResponse(
        uid: account.user?.uid,
        email: params.email,
        name: params.email.split('@')[0],
        profilePicture:
            'https://firebasestorage.googleapis.com/v0/b/fixit-1c96e.appspot.com/o/no-profile-picture.png?alt=media&token=4704d7ed-e468-4cfd-9ffa-ef04b1efdf54',
      );

      await _collRef.doc(account.user?.uid).set(data);

      return Right(data);
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure(e.code));
    }
  }

  @override
  Future<Either<Failure, AuthUserResponse>> editProfile(
      EditUserParams params) async {
    try {
      final account = _auth.currentUser!;
      final imageRef = _storage.child('${account.uid}/profilePicture.png');

      String? profilePicture;
      if (params.profilePicture != null) {
        await imageRef.putData(params.profilePicture!);
        profilePicture = await imageRef.getDownloadURL();
      } else {
        profilePicture = params.user.profilePicture;
      }

      final data =
          params.user.copyWith(profilePicture: profilePicture).toModel();

      await _collRef.doc(account.uid).update(data.toJson());

      return Right(data);
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure(e.code));
    }
  }
}
