import 'dart:async';

import 'package:bloc_demo/config/app_config.dart';
import 'package:bloc_demo/injector/injector.dart';
import 'package:bloc_demo/services/local_storage_service/local_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService implements LocalStorageService {
  SharedPreferenceService() {
    init();
  }

  late final SharedPreferences _pref;

  @override
  String tokenKey = 'tokenKey';
  @override
  String localeKey = 'localeKey';

  @override
  FutureOr<void> init() async {
    _pref = await SharedPreferences.getInstance();
    Injector.instance.signalReady(this);
  }

  @override
  String? get token => _pref.getString(tokenKey);

  @override
  getValue({required String key}) {
    return _pref.get(key);
  }

  @override
  String get locale => _pref.getString(localeKey) ?? AppConfig.defaultLocale;

  @override
  Future<bool> setLocale(String locale) async {
    return await _pref.setString(localeKey, locale);
  }

  @override
  Future<bool> setToken(String token) async {
    return await _pref.setString(tokenKey, token);
  }

  @override
  Future<bool> clearCache() async {
    return await _pref.clear();
  }

  @override
  void setValue({required String key, required value}) {}
}
