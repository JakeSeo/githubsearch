import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'repositories/auth_repository.dart';
import 'repositories/github/repository.dart';
import 'repositories/github_auth/repository.dart';
import 'router/app_router.dart';
import 'services/interceptors/auth_interceptor.dart';

GetIt injector = GetIt.instance;

void initInjector() {
  injector.registerSingleton<AppRouter>(AppRouter());
  injector.registerSingleton<AuthRepository>(AuthRepository());
  final githubAuthDio = Dio();
  githubAuthDio.interceptors.addAll(
    [
      if (kDebugMode) PrettyDioLogger(),
    ],
  );
  injector.registerLazySingleton<GithubAuthRepository>(
    () => GithubAuthRepository(githubAuthDio),
  );
  final githubDio = Dio();
  githubDio.interceptors.addAll(
    [
      if (kDebugMode) PrettyDioLogger(),
      AuthInterceptor(),
    ],
  );
  injector.registerLazySingleton<GithubRepository>(
    () => GithubRepository(githubDio),
  );
}
