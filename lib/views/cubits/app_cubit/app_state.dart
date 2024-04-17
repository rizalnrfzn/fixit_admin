part of 'app_cubit.dart';

@freezed
class AppState with _$AppState {
  const factory AppState.loading() = _Loading;
  const factory AppState.success() = _Success;
  const factory AppState.failure(String message) = _Failure;
}
