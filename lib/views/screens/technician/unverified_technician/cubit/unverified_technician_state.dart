part of 'unverified_technician_cubit.dart';

@freezed
class UnverifiedTechnicianState with _$UnverifiedTechnicianState {
  const factory UnverifiedTechnicianState.loading() = _Loading;
  const factory UnverifiedTechnicianState.success() = _Success;
  const factory UnverifiedTechnicianState.failure(String message) = _Failure;
}
