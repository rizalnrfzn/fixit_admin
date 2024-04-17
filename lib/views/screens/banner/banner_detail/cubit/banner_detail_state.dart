part of 'banner_detail_cubit.dart';

@freezed
class BannerDetailState with _$BannerDetailState {
  const factory BannerDetailState.initial() = _Initial;
  const factory BannerDetailState.success() = _Success;
  const factory BannerDetailState.failure(String message) = _Failure;
  const factory BannerDetailState.loading() = _Loading;
  const factory BannerDetailState.successEdit() = _SuccessEdit;
  const factory BannerDetailState.successDelete() = _SuccessDelete;
  const factory BannerDetailState.failureDialog(String message) =
      _FailureDialog;
}
