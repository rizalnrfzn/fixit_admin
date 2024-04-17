part of 'banner_cubit.dart';

@freezed
class BannerState with _$BannerState {
  const factory BannerState.loading() = _Loading;
  const factory BannerState.failure(String message) = _Failure;
  const factory BannerState.success() = _Success;
}
