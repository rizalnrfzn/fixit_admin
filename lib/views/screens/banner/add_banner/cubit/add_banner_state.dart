part of 'add_banner_cubit.dart';

@freezed
class AddBannerState with _$AddBannerState {
  const factory AddBannerState.initial() = _Initial;
  const factory AddBannerState.success() = _Success;
  const factory AddBannerState.failure(String message) = _Failure;
  const factory AddBannerState.loading() = _Loading;
  const factory AddBannerState.successAdd() = _SuccessAdd;
}
