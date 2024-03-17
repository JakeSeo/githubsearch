import 'package:dio/dio.dart';

import '../../injector.dart';
import '../../models/refresh_token_request_param/info.dart';
import '../../repositories/auth_repository.dart';
import '../../repositories/github_auth/repository.dart';

class AuthInterceptor extends QueuedInterceptor {
  AuthInterceptor();
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.headers['accessToken'] ?? false) {
      options.headers.remove('accessToken');
      super.onRequest(options, handler);
      return;
    }

    final auth = await injector.get<AuthRepository>().getAuthInfo();
    options.headers.remove('accessTokenNotRequired');
    options.headers.addAll(
      {
        'Authorization': 'Bearer ${auth?.accessToken ?? ""}',
      },
    );
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    try {
      final auth = await injector.get<AuthRepository>().getAuthInfo();
      final newAuth = await injector.get<GithubAuthRepository>().refreshToken(
            param: RefreshTokenRequestParamInfo(
              refreshToken: auth?.refreshToken ?? "",
            ),
          );

      err.requestOptions.headers['Authorization'] =
          "Bearer ${newAuth.accessToken}";

      return handler.resolve(await Dio().fetch(err.requestOptions));
    } catch (_) {}
    super.onError(err, handler);
  }
}
