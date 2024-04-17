part of 'electronic_detail_cubit.dart';

@freezed
class ElectronicDetailState with _$ElectronicDetailState {
  const factory ElectronicDetailState.initial() = _Initial;
  const factory ElectronicDetailState.success() = _Success;
  const factory ElectronicDetailState.failure(String message) = _Failure;
  const factory ElectronicDetailState.loading() = _Loading;
  const factory ElectronicDetailState.successEdit() = _SuccessEdit;
  const factory ElectronicDetailState.successDelete() = _SuccessDelete;
  const factory ElectronicDetailState.failureDialog(String message) =
      _FailureDialog;
}
