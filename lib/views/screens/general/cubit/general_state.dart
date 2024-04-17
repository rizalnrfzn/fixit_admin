part of 'general_cubit.dart';

@freezed
class GeneralState with _$GeneralState {
  const factory GeneralState.loading() = _Loading;
  const factory GeneralState.success() = _Success;
  const factory GeneralState.failure(String message) = _Failure;
}
