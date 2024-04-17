part of 'add_electronic_cubit.dart';

@freezed
class AddElectronicState with _$AddElectronicState {
  const factory AddElectronicState.initial() = _Initial;
  const factory AddElectronicState.success() = _Success;
  const factory AddElectronicState.failure(String message) = _Failure;
  const factory AddElectronicState.loading() = _Loading;
  const factory AddElectronicState.successAdd() = _SuccessAdd;
}
