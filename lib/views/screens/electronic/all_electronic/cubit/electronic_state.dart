part of 'electronic_cubit.dart';

@freezed
class ElectronicState with _$ElectronicState {
  const factory ElectronicState.loading() = _Loading;
  const factory ElectronicState.failure(String message) = _Failure;
  const factory ElectronicState.success() = _Success;
}
