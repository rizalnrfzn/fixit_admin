import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_state.dart';
part 'banner_cubit.freezed.dart';

class BannerCubit extends Cubit<BannerState> {
  BannerCubit(this._allBanner) : super(const _Loading());

  final GetAllBannerUsecase _allBanner;

  List<BannerAd> banners = [];

  Future<void> getAllBanner() async {
    emit(const _Loading());
    final data = await _allBanner.call(NoParams());

    data.fold(
      (l) {
        if (l is FirestoreFailure) {
          emit(_Failure(l.code));
        }
      },
      (r) {
        banners
          ..clear()
          ..addAll(r);
        emit(const _Success());
      },
    );
  }
}
