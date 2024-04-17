import 'package:file_picker/file_picker.dart';
import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'electronic_detail_state.dart';
part 'electronic_detail_cubit.freezed.dart';

class ElectronicDetailCubit extends Cubit<ElectronicDetailState> {
  ElectronicDetailCubit(
    this._getElectronic,
    this._editElectronic,
    this._deleteElectronic,
  ) : super(const ElectronicDetailState.initial());

  final GetElectronicUsecase _getElectronic;
  final EditElectronicUsecase _editElectronic;
  final DeleteElectronicUsecase _deleteElectronic;

  Electronic? electronic;

  Uint8List? picture;

  List<TextEditingController> controller = [];

  void getGripe(Electronic electronic) {
    final gripe = electronic.gripe;
    for (var element in gripe) {
      controller.add(TextEditingController(text: element));
    }
  }

  Future<void> getElectronic(String params) async {
    emit(const _Initial());
    final data = await _getElectronic.call(params);

    data.fold(
      (l) {
        if (l is FirestoreFailure) {
          emit(_Failure(l.code));
        }
      },
      (r) {
        getGripe(r);
        electronic = r;
        emit(const _Success());
      },
    );
  }

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

  Future<void> editElectronic(EditElectronicParams params) async {
    emit(const _Loading());
    emit(const _Success());
    final data = await _editElectronic.call(params);

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

  Future<void> deleteElectronic() async {
    emit(const _Loading());
    emit(const _Success());
    final data = await _deleteElectronic.call(electronic!.id!);

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
