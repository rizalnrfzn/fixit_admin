import 'package:file_picker/file_picker.dart';
import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_banner_state.dart';
part 'add_banner_cubit.freezed.dart';

class AddBannerCubit extends Cubit<AddBannerState> {
  AddBannerCubit(this._addBanner) : super(const AddBannerState.initial());

  final AddBannerUsecase _addBanner;
  Uint8List? picture;

  void pickPicture() async {
    emit(const _Initial());
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      Uint8List fileBytes = result.files.first.bytes!;
      picture = fileBytes;
    }
    emit(const _Success());
  }

  Future<void> addBanner(AddBannerParams params) async {
    emit(const _Loading());
    final data = await _addBanner.call(params);

    data.fold(
      (l) {
        if (l is FirestoreFailure) {
          emit(_Failure(l.code));
        }
      },
      (r) {
        emit(const _SuccessAdd());
      },
    );
  }
}
