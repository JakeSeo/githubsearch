import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'repositories/github_auth/repository.dart';
import 'router/app_router.dart';

GetIt injector = GetIt.instance;

void initInjector() {
  injector.registerSingleton<AppRouter>(AppRouter());
  injector.registerLazySingleton<GithubAuthRepository>(
    () => GithubAuthRepository(
      Dio(),
    ),
  );
}
