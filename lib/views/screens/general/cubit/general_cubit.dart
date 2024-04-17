import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'general_state.dart';
part 'general_cubit.freezed.dart';

class GeneralCubit extends Cubit<GeneralState> {
  GeneralCubit(
    this._recentOrder,
    this._client,
    this._electronic,
    this._technician,
    this._totalTechnician,
    this._totalUnverifiedTechnician,
    this._totalClient,
  ) : super(const _Loading());

  final GetRacentOrderUsecase _recentOrder;
  final GetClientUsecase _client;
  final GetElectronicUsecase _electronic;
  final GetTechnicianUsecase _technician;
  final GetTotalTechnicianUsecase _totalTechnician;
  final GetTotalUnverifiedTechnicianUsecase _totalUnverifiedTechnician;
  final GetTotalCLientUsecase _totalClient;

  List<RepairOrder> orders = [];
  int totalOrder = 0;
  int totalTechnician = 0;
  int totalUnverifiedTechnician = 0;
  int totalClient = 0;

  Future<void> openPage() async {
    emit(const _Loading());
    await recentOrder();
    await getTotalClient();
    await getTotalTechnician();
    await getTotalUnverifiedTechnician();
    emit(const _Success());
  }

  Future<void> recentOrder() async {
    final data = await _recentOrder.call(NoParams());

    data.fold(
      (l) {
        if (l is FirestoreFailure) {
          emit(_Failure(l.code));
        }
      },
      (r) async {
        orders.clear();
        for (var i = 0; i < r.length; i++) {
          var client = await getClient(r[i].clientUid!);
          var technician = await getTechnician(r[i].technicianUid!);
          var electronic = await getElectronic(r[i].electronicId!);

          orders.add(
            r[i].copyWith(
              client: client,
              technician: technician,
              electronic: electronic,
            ),
          );
        }
        totalOrder = orders.length;
      },
    );
  }

  Future<Client?> getClient(String uid) async {
    final data = await _client.call(uid);

    return data.fold(
      (l) {
        if (l is FirestoreFailure) {
          emit(_Failure(l.code));
        }
        return null;
      },
      (r) => r,
    );
  }

  Future<Technician?> getTechnician(String uid) async {
    final data = await _technician.call(uid);

    return data.fold(
      (l) {
        if (l is FirestoreFailure) {
          emit(_Failure(l.code));
        }
        return null;
      },
      (r) => r,
    );
  }

  Future<Electronic?> getElectronic(String id) async {
    final data = await _electronic.call(id);

    return data.fold(
      (l) {
        if (l is FirestoreFailure) {
          emit(_Failure(l.code));
        }
        return null;
      },
      (r) => r,
    );
  }

  Future<void> getTotalTechnician() async {
    final data = await _totalTechnician.call(NoParams());

    data.fold(
      (l) {
        if (l is FirestoreFailure) {
          emit(_Failure(l.code));
        }
      },
      (r) {
        totalTechnician = r;
      },
    );
  }

  Future<void> getTotalUnverifiedTechnician() async {
    final data = await _totalUnverifiedTechnician.call(NoParams());

    data.fold(
      (l) {
        if (l is FirestoreFailure) {
          emit(_Failure(l.code));
        }
      },
      (r) {
        totalUnverifiedTechnician = r;
      },
    );
  }

  Future<void> getTotalClient() async {
    final data = await _totalClient.call(NoParams());

    data.fold(
      (l) {
        if (l is FirestoreFailure) {
          emit(_Failure(l.code));
        }
      },
      (r) {
        totalClient = r;
      },
    );
  }
}
