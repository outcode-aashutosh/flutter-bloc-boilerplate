import '../../base/network/resource/resource.dart';
import '../../data/api/auth/request/login/login_request_model.dart';
import '../../data/api/auth/response/login/login_response.dart';

abstract class AuthRemoteDataSource {
  Future<Resource<LoginResponse>> loginUser(
    LoginRequestModel loginRequestModel,
  );
}
