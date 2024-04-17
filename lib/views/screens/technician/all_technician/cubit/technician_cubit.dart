import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'technician_state.dart';
part 'technician_cubit.freezed.dart';

class TechnicianCubit extends Cubit<TechnicianState> {
  TechnicianCubit(this._getAllTechnician) : super(const _Loading());

  final GetAllTechniciansUsecase _getAllTechnician;

  List<Technician> technicians = [];

  Future<void> openPage() async {
    await getAllTechnicians();
  }

  Future<void> getAllTechnicians() async {
    emit(const _Loading());
    final response = await _getAllTechnician.call(NoParams());

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
