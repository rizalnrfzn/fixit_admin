import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'electronic_state.dart';
part 'electronic_cubit.freezed.dart';

class ElectronicCubit extends Cubit<ElectronicState> {
  ElectronicCubit(this._allElectronic) : super(const _Loading());

  final GetAllElectronicUsecase _allElectronic;

  List<Electronic> electronics = [];

  Future<void> getAllElectronic() async {
    emit(const _Loading());
    final data = await _allElectronic.call(NoParams());

    data.fold(
      (l) {
        if (l is FirestoreFailure) {
          emit(_Failure(l.code));
        }
      },
      (r) {
        electronics
          ..clear()
          ..addAll(r);
        electronics.removeWhere(
          (element) => element.id == 'wzicVyX1YzsQfn9cmAaq',
        );
        emit(const _Success());
      },
    );
  }
}
