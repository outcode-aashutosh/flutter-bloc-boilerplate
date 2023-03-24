import 'package:bloc_demo/domain/remote/auth_remote_data_source.dart';
import 'package:bloc_demo/services/local_storage_service/local_storage_service.dart';

abstract class AuthRepository {
  String? getSavedToken();
  void saveToken(String token);
  void clearCache();
}

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
    required LocalStorageService localStorageService,
  }) {
    _remoteDataSource = remoteDataSource;
    _localStorageService = localStorageService;
  }
  late final AuthRemoteDataSource _remoteDataSource;
  late final LocalStorageService _localStorageService;

  @override
  String? getSavedToken() {
    return _localStorageService.token;
  }

  @override
  void saveToken(String token) {
    _localStorageService.setToken(token);
  }

  @override
  void clearCache() {
    _localStorageService.clearCache();
  }
}
