import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'unverified_technician_detail_state.dart';
part 'unverified_technician_detail_cubit.freezed.dart';

class UnverifiedTechnicianDetailCubit
    extends Cubit<UnverifiedTechnicianDetailState> {
  UnverifiedTechnicianDetailCubit(
    this._getTechnician,
    this._getElectronic,
    this._verifyTechnician,
  ) : super(const UnverifiedTechnicianDetailState.initial());

  final GetTechnicianUsecase _getTechnician;
  final GetElectronicUsecase _getElectronic;
  final VerifyTechnicianUsecase _verifyTechnician;

  Technician? technician;

  Future<void> getTechnician(String params) async {
    emit(const _Initial());
    final data = await _getTechnician.call(params);

    data.fold(
      (l) {
        if (l is FirestoreFailure) {
          emit(_Failure(l.code));
        }
      },
      (r) async {
        List<Electronic> electronics = [];
        for (var i = 0; i < r.electronicId!.length; i++) {
          var electronic = await getElectronic(r.electronicId![i]);

          electronics.add(
            electronic!,
          );
        }
        technician = r.copyWith(electronics: electronics);
        emit(const _Success());
      },
    );
  }

  Future<Electronic?> getElectronic(String params) async {
    final data = await _getElectronic.call(params);

    return data.fold(
      (l) {
        if (l is FirestoreFailure) {
          emit(_Failure(l.code));
        }
        return null;
      },
      (r) {
        return r;
      },
    );
  }

  Future<void> verifyTechnician() async {
    emit(const _Loading());
    emit(const _Success());
    final data = await _verifyTechnician.call(technician!);

    data.fold(
      (l) {
        if (l is FirestoreFailure) {
          emit(_FailureDialog(l.code));
          emit(const _Success());
        }
      },
      (r) {
        emit(const _SuccessDialog());
        emit(const _Success());
      },
    );
  }
}
