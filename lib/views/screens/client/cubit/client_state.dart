part of 'client_cubit.dart';

@freezed
class ClientState with _$ClientState {
  const factory ClientState.loading() = _Loading;
  const factory ClientState.success() = _Success;
  const factory ClientState.failure(String messaage) = _Failure;
}
