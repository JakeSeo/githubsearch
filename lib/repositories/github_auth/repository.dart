import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../models/auth/info.dart';
import '../../models/auth_request_param/info.dart';
import '../../models/refresh_token_request_param/info.dart';

part 'repository.g.dart';

// TODO: 해당 부분은 서버쪽에서 처리하도록 콜백설정을 해야함
@RestApi(baseUrl: 'https://github.com/login/oauth')
abstract class GithubAuthRepository {
  factory GithubAuthRepository(Dio dio, {String baseUrl}) =
      _GithubAuthRepository;

  @POST("/access_token")
  @Headers({
    'accept': 'application/json',
  })
  Future<AuthInfo> authorize({
    @Queries() required AuthRequestParamInfo param,
  });

  @POST("/access_token")
  @Headers({
    'accept': 'application/json',
  })
  Future<AuthInfo> refreshToken({
    @Queries() required RefreshTokenRequestParamInfo param,
  });
}
