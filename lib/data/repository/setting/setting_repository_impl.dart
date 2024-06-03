import 'dart:async';

import 'package:app/domain/repository/setting/setting_repository.dart';
import 'package:app/data/sharedpref/shared_preference_helper.dart';

class SettingRepositoryImpl extends SettingRepository {
  // shared pref object
  final SharedPreferenceHelper _sharedPrefHelper;

  // constructor
  SettingRepositoryImpl(this._sharedPrefHelper);

  // Theme: --------------------------------------------------------------------
  @override
  Future<void> changeBrightnessToDark(bool value) =>
      _sharedPrefHelper.changeBrightnessToDark(value);

  @override
  bool get isDarkMode => _sharedPrefHelper.isDarkMode;

  // Language: -----------------------------------------------------------------
  @override
  Future<void> changeLanguage(String value) =>
      _sharedPrefHelper.changeLanguage(value);

  @override
  String? get currentLanguage => _sharedPrefHelper.currentLanguage;
}
