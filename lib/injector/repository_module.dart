import 'package:bloc_demo/repository/auth_repository.dart';

import 'injector.dart';

class RepositoryModule {
  RepositoryModule._();

  static void init() {
    final injector = Injector.instance;
    injector.registerSingleton<AuthRepository>(AuthRepositoryImpl(
        remoteDataSource: injector(), localStorageService: injector()));
  }
}
