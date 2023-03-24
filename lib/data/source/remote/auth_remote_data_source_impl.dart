import 'dart:convert';

import 'package:bloc_demo/domain/remote/auth_remote_data_source.dart';

import '../../../base/network/resource/resource.dart';
import '../../api/auth/auth_api.dart';
import '../../api/auth/request/login/login_request_model.dart';
import '../../api/auth/response/login/login_response.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({required AuthApi api}) : _api = api;
  late final AuthApi _api;

  @override
  Future<Resource<LoginResponse>> loginUser(
      LoginRequestModel loginRequestModel) async {
    var response = await _api.login(loginRequestModel);
    return response.when(successResponse: (body) {
      return Resource.successState(LoginResponse.fromJson(jsonDecode(body)));
    }, errorResponse: (error) {
      return Resource.errorState(error);
    });
  }
}
