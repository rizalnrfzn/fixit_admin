import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'technician_detail_state.dart';
part 'technician_detail_cubit.freezed.dart';

class TechnicianDetailCubit extends Cubit<TechnicianDetailState> {
  TechnicianDetailCubit(
    this._getTechnician,
    this._getElectronic,
  ) : super(const _Loading());

  final GetTechnicianUsecase _getTechnician;
  final GetElectronicUsecase _getElectronic;

  Technician? technician;

  Future<void> getTechnician(String params) async {
    emit(const _Loading());
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
}
