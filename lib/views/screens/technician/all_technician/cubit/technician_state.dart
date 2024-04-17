part of 'technician_cubit.dart';

@freezed
class TechnicianState with _$TechnicianState {
  const factory TechnicianState.loading() = _Loading;
  const factory TechnicianState.success() = _Success;
  const factory TechnicianState.failure(String message) = _Failure;
}
