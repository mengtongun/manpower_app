import 'dart:async';

import 'package:app/data/sharedpref/shared_preference_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../di/service_locator.dart';

mixin LocalModule {
  static Future<void> configureLocalModuleInjection() async {
    // preference manager:------------------------------------------------------
    getIt.registerSingletonAsync<SharedPreferences>(
        SharedPreferences.getInstance);
    getIt.registerSingleton<SharedPreferenceHelper>(
      SharedPreferenceHelper(await getIt.getAsync<SharedPreferences>()),
    );
  }
}
