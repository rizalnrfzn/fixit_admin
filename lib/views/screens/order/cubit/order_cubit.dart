import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_state.dart';
part 'order_cubit.freezed.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(
    this._getAllOrder,
    this._getOrder,
    this._client,
    this._electronic,
    this._technician,
  ) : super(const _Loading());

  final GetAllOrdersUsecase _getAllOrder;
  final GetOrderUsecase _getOrder;
  final GetClientUsecase _client;
  final GetElectronicUsecase _electronic;
  final GetTechnicianUsecase _technician;

  List<RepairOrder> orders = [];
  RepairOrder? order;

  Future<void> openPage() async {
    await getAllOrder();
  }

  Future<void> getAllOrder() async {
    emit(const _Loading());
    final data = await _getAllOrder.call(NoParams());

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
        emit(const _Success());
      },
    );
  }

  Future<void> getOrder(String params) async {
    emit(const _Loading());
    final data = await _getOrder.call(params);

    data.fold(
      (l) {
        if (l is FirestoreFailure) {
          emit(_Failure(l.code));
        }
      },
      (r) async {
        var client = await getClient(r.clientUid!);
        var technician = await getTechnician(r.technicianUid!);
        var electronic = await getElectronic(r.electronicId!);

        order = r.copyWith(
          client: client,
          technician: technician,
          electronic: electronic,
        );
        emit(const _Success());
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
}
