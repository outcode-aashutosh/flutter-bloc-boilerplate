import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc_demo/base/network/exception/exception_handler.dart';
import 'package:bloc_demo/base/network/handler/api_call_handler.dart';
import 'package:bloc_demo/config/app_config.dart';

import '../../../base/network/client.dart';
import 'request/login/login_request_model.dart';

class AuthApi {
  UserAgentClient client;

  AuthApi({required this.client});

  FutureOr<ExceptionHandler> login(
    LoginRequestModel loginRequestModel,
  ) async {
    try {
      var loginRequest = jsonEncode(loginRequestModel.toJson());
      var response = await client.post(
        Uri.http(AppConfig.baseUrl, "${AppConfig.endPoint}login"),
        body: loginRequest,
      );
      log(response.body);
      return response.handleException();
    } finally {
      client.close();
    }
  }
}
