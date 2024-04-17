import 'package:file_picker/file_picker.dart';
import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_electronic_state.dart';
part 'add_electronic_cubit.freezed.dart';

class AddElectronicCubit extends Cubit<AddElectronicState> {
  AddElectronicCubit(
    this._addElectronic,
  ) : super(const AddElectronicState.initial());

  final AddElectronicUsecase _addElectronic;
  Uint8List? picture;

  List<TextEditingController> controller = [
    TextEditingController(),
  ];

  void addController() {
    emit(const _Initial());
    controller.add(TextEditingController());
    emit(const _Success());
  }

  void removeController(int index) {
    emit(const _Initial());
    controller.removeAt(index);
    emit(const _Success());
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

  Future<void> addElectronic(AddElectronicParams params) async {
    emit(const _Loading());
    final data = await _addElectronic.call(params);

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
