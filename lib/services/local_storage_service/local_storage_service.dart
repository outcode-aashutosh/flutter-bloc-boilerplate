import 'dart:async';

abstract class LocalStorageService {
  String tokenKey = '';
  String localeKey = '';

  FutureOr<void> init();
  String? get token;
  String get locale;

  Future<bool> setToken(String token);
  Future<bool> setLocale(String locale);
  Future<bool> clearCache();

  void setValue({required String key, required dynamic value});
  dynamic getValue({required String key});
}
