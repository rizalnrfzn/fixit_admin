import 'package:file_picker/file_picker.dart';
import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';
import 'package:fixit_admin/utils/utils.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._editProfile) : super(const ProfileState.initial());

  final EditProfileUsecase _editProfile;

  String? profilePicture = SharedPref.getInfoUser()?.profilePicture;
  Uint8List? newProfilePicture;

  void pickProfilePicture() async {
    emit(const _Initial());
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      Uint8List fileBytes = result.files.first.bytes!;
      newProfilePicture = fileBytes;
    }
    emit(const _Success());
  }

  Future<void> editProfile(EditProfileParams params) async {
    emit(const _Loading());

    final data = await _editProfile.call(params);

    data.fold(
      (l) {
        if (l is FirestoreFailure) {
          emit(_Failure(l.code));
        }
      },
      (r) {
        emit(const _SuccessEdit());
      },
    );
  }
}
