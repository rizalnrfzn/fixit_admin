import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fixit_admin/utils/utils.dart';

part 'app_state.dart';
part 'app_cubit.freezed.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const _Loading());

  var _locale = Locale(SharedPref.getLanguage());
  var _themeMode = SharedPref.getTheme();

  Locale get locale => _locale;
  ThemeMode get themeMode => _themeMode;

  Future<void> loadAsync() async {
    emit(const _Loading());
    final langCode = (SharedPref.getLanguage());

    if (langCode.contains('_')) {
      final values = langCode.split('_');

      _locale =
          Locale.fromSubtags(languageCode: values[0], scriptCode: values[1]);
    } else {
      _locale = Locale(langCode);
    }

    _themeMode = SharedPref.getTheme();
  }

  Future<void> setLocale({
    required Locale locale,
    save = true,
  }) async {
    emit(const _Loading());
    if (locale != _locale) {
      _locale = locale;

      if (save) {
        var langCode = locale.languageCode;

        if (locale.scriptCode != null) {
          langCode += '_${locale.scriptCode}';
        }
        SharedPref.setLanguage(langCode);
      }
    }
    emit(const _Success());
  }

  Future<void> setThemeMode({
    required ThemeMode themeMode,
    save = true,
  }) async {
    emit(const _Loading());
    if (themeMode != _themeMode) {
      _themeMode = themeMode;

      if (save) {
        SharedPref.setTheme(_themeMode);
      }
    }
    emit(const _Success());
  }
}
