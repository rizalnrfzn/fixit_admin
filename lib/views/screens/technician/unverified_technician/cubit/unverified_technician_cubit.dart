import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'unverified_technician_state.dart';
part 'unverified_technician_cubit.freezed.dart';

class UnverifiedTechnicianCubit extends Cubit<UnverifiedTechnicianState> {
  UnverifiedTechnicianCubit(this._getUnverifiedTechnician)
      : super(const _Loading());

  final GetUnverifiedTechnicianUsecase _getUnverifiedTechnician;

  List<Technician> technicians = [];

  Future<void> openPage() async {
    await getUnverifiedTechnicians();
  }

  Future<void> getUnverifiedTechnicians() async {
    emit(const _Loading());
    final response = await _getUnverifiedTechnician.call(NoParams());

    response.fold(
      (l) {
        if (l is FirestoreFailure) {
          emit(_Failure(l.code));
        }
      },
      (r) {
        technicians
          ..clear()
          ..addAll(r);
        emit(const _Success());
      },
    );
  }
}
