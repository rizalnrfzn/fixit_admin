import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_state.dart';
part 'client_cubit.freezed.dart';

class ClientCubit extends Cubit<ClientState> {
  ClientCubit(
    this._getAllClient,
    this._getClient,
  ) : super(const _Loading());

  final GetAllClientsUsecase _getAllClient;
  final GetClientUsecase _getClient;

  List<Client> clients = [];

  Client? client;

  Future<void> openPage() async {
    await getAllClient();
  }

  Future<void> getAllClient() async {
    emit(const _Loading());
    final response = await _getAllClient.call(NoParams());

    response.fold(
      (l) {
        if (l is FirestoreFailure) {
          emit(_Failure(l.code));
        }
      },
      (r) {
        clients
          ..clear()
          ..addAll(r);
        emit(const _Success());
      },
    );
  }

  Future<void> getClient(String params) async {
    emit(const _Loading());
    final response = await _getClient.call(params);

    response.fold(
      (l) {
        if (l is FirestoreFailure) {
          emit(_Failure(l.code));
        }
      },
      (r) {
        client = r;
        emit(const _Success());
      },
    );
  }
}
