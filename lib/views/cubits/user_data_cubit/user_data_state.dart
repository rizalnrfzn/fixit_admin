part of 'user_data_cubit.dart';

@freezed
class UserDataState with _$UserDataState {
  const factory UserDataState.loading() = _Loading;
  const factory UserDataState.success() = _Success;
  const factory UserDataState.failure(String message) = _Failure;
}
