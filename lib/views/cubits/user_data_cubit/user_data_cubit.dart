import 'package:fixit_admin/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data_state.dart';
part 'user_data_cubit.freezed.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit() : super(const _Loading());

  var _userProfileImage = '';
  var _username = '';

  String get userProfileImage => _userProfileImage;
  String get username => _username;

  void loadData() {
    emit(const _Loading());
    _username = SharedPref.getUserChannel() ?? '';
    _userProfileImage = SharedPref.getUserChannel() ?? '';
    emit(const _Success());
  }

  void setUserData({
    String? userProfileImageUrl,
    String? username,
  }) {
    emit(const _Loading());
    if (userProfileImageUrl != null &&
        userProfileImageUrl != _userProfileImage) {
      _userProfileImage = userProfileImageUrl;
    }
    emit(const _Success());
  }

  void clearUserData() {
    emit(const _Loading());
    SharedPref.logout();
    _username = '';
    _userProfileImage = '';
    emit(const _Success());
  }

  bool isUserLoggedIn() {
    return _username.isNotEmpty;
  }
}
