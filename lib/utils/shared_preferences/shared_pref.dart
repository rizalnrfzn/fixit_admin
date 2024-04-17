import 'dart:convert';

import 'package:fixit_admin/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pref_key.dart';

class SharedPref {
  static late SharedPreferences? _preferences;

  static Future<void> init() async =>
      _preferences = await SharedPreferences.getInstance();

  //delete pref dengan key
  static void remove(String prefKey) => _preferences!.remove(prefKey);

  static void logout() {
    remove(PrefKey.isLogin);
    remove(PrefKey.infoUser);
    remove(PrefKey.userId);
    remove(PrefKey.userToken);
  }

  // app language
  static void setLanguage(String language) =>
      _preferences!.setString(PrefKey.language, language);

  static String getLanguage() =>
      _preferences!.getString(PrefKey.language) ?? 'en';

  // app theme
  static void setTheme(ThemeMode theme) =>
      _preferences!.setString(PrefKey.theme, theme.name);

  static ThemeMode getTheme() => ThemeMode.values
      .byName(_preferences!.getString(PrefKey.theme) ?? ThemeMode.light.name);

  /// welcome screen
  static void setIsWelcomePassed() =>
      _preferences!.setBool(PrefKey.isWelcome, true);
  static bool? getIsWelcomePassed() => _preferences!.getBool(PrefKey.isWelcome);

  /// user channel token
  static void setUserChannel(String userChannel) =>
      _preferences!.setString(PrefKey.userId, userChannel);

  static String? getUserChannel() => _preferences!.getString(PrefKey.userId);

  // isLogin
  static void setIsLogin() => _preferences!.setBool(PrefKey.isLogin, true);

  static bool? getIsLogin() => _preferences!.getBool(PrefKey.isLogin);

  /// user token
  static void setAccessToken(String token) =>
      _preferences!.setString(PrefKey.userToken, token);

  static String? getAccessToken() => _preferences!.getString(PrefKey.userToken);

  // info user
  static void setInfoUser(AuthUser user) =>
      _preferences?.setString(PrefKey.infoUser, jsonEncode(user.toJson()));

  static AuthUser? getInfoUser() => AuthUser.fromJson(
      jsonDecode(_preferences?.getString(PrefKey.infoUser) ?? '')
          as Map<String, dynamic>);
}
