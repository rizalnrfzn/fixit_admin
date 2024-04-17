import 'package:file_picker/file_picker.dart';
import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_detail_state.dart';
part 'banner_detail_cubit.freezed.dart';

class BannerDetailCubit extends Cubit<BannerDetailState> {
  BannerDetailCubit(
    this._getBanner,
    this._editBanner,
    this._deleteBanner,
  ) : super(const BannerDetailState.initial());

  final GetBannerUsecase _getBanner;
  final EditBannerUsecase _editBanner;
  final DeleteBannerUsecase _deleteBanner;

  BannerAd? banner;

  Uint8List? picture;

  Future<void> getBanner(String params) async {
    emit(const _Initial());
    final data = await _getBanner.call(params);

    data.fold(
      (l) {
        if (l is FirestoreFailure) {
          emit(_Failure(l.code));
        }
      },
      (r) {
        banner = r;
        emit(const _Success());
      },
    );
  }

  void pickPicture() async {
    emit(const _Initial());
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      Uint8List fileBytes = result.files.first.bytes!;
      picture = fileBytes;
    }
    emit(const _Success());
  }

  Future<void> editBanner(EditBannerParams params) async {
    emit(const _Loading());
    emit(const _Success());
    final data = await _editBanner.call(params);

    data.fold(
      (l) {
        if (l is FirestoreFailure) {
          emit(_Failure(l.code));
          emit(const _Success());
        }
      },
      (r) {
        emit(const _SuccessEdit());
        emit(const _Success());
      },
    );
  }

  Future<void> deleteBanner() async {
    emit(const _Loading());
    emit(const _Success());
    final data = await _deleteBanner.call(banner!.id!);

    data.fold(
      (l) {
        if (l is FirestoreFailure) {
          emit(_Failure(l.code));
          emit(const _Success());
        }
      },
      (r) {
        emit(const _SuccessDelete());
        emit(const _Success());
      },
    );
  }
}
