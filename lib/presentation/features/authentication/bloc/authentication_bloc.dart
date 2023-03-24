// ignore: depend_on_referenced_packages
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_demo/repository/auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc_demo/services/local_storage_service/local_storage_service.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';
part 'authentication_bloc.freezed.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AuthRepository authRepository,
  }) : super(const Initial()) {
    _authRepository = authRepository;
    on<CheckAuthenticationStatus>(_checkAuthenticationStatus);
  }

  late final AuthRepository _authRepository;

  FutureOr<void> _checkAuthenticationStatus(CheckAuthenticationStatus event,
      Emitter<AuthenticationState> emit) async {
    event.whenOrNull(
      checkAuthStatus: () {
        var token = _authRepository.getSavedToken();
        if (token != null && token.isNotEmpty) {
          // var profileCompleteFlag = _authRepository.isProfileComplete();
          emit(const AuthenticationState.authenticated(true));
        } else {
          emit(const AuthenticationState.unauthenticated());
        }
      },
    );
  }
}
