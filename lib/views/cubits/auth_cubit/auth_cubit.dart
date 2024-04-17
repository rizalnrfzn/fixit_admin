import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';
import 'package:fixit_admin/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this._login,
    this._registration,
  ) : super(const AuthState.initial());

  final LoginUsecase _login;
  final RegistrationUsecase _registration;

  AuthUser? user;

  Future<void> login(LoginParams params) async {
    emit(const _Loading());
    final data = await _login.call(params);

    data.fold(
      (l) {
        if (l is AuthFailure) {
          emit(_Failure(l.code));
          emit(const _Initial());
        }
      },
      (r) {
        user = r;
        emit(const _Success());
        emit(const _Initial());
      },
    );
  }

  Future<void> registration(RegistrationParams params) async {
    emit(const _Loading());
    final data = await _registration.call(params);

    data.fold(
      (l) {
        if (l is AuthFailure) {
          emit(_Failure(l.code));
          emit(const _Initial());
        }
      },
      (r) {
        user = r;
        emit(const _Success());
        emit(const _Initial());
      },
    );
  }

  Future<void> logout() async {
    emit(const _Loading());
    FirebaseAuth.instance.signOut();
    SharedPref.logout();
    emit(const _Success());
    emit(const _Initial());
  }
}
