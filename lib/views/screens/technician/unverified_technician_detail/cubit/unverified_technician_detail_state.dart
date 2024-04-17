part of 'unverified_technician_detail_cubit.dart';

@freezed
class UnverifiedTechnicianDetailState with _$UnverifiedTechnicianDetailState {
  const factory UnverifiedTechnicianDetailState.initial() = _Initial;
  const factory UnverifiedTechnicianDetailState.loading() = _Loading;
  const factory UnverifiedTechnicianDetailState.success() = _Success;
  const factory UnverifiedTechnicianDetailState.successDialog() =
      _SuccessDialog;
  const factory UnverifiedTechnicianDetailState.failure(String message) =
      _Failure;
  const factory UnverifiedTechnicianDetailState.failureDialog(String message) =
      _FailureDialog;
}
