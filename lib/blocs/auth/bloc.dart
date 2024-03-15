import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';

import '../../models/auth_request_param/info.dart';
import '../../models/refresh_token_request_param/info.dart';
import '../../repositories/auth_repository.dart';
import '../../repositories/github_auth/repository.dart';

part 'event.dart';
part 'state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthInitialize>(_initialize);
    on<Login>(_login);
    on<Logout>(_logout);
  }

  final AuthRepository _authRepository = AuthRepository();
  final GithubAuthRepository _githubAuthRepository =
      GithubAuthRepository(Dio());

  _initialize(AuthInitialize event, Emitter<AuthState> emit) async {
    emit(AuthInitializing());
    try {
      // 기기에 저장된 인증 토큰 정보 불러오기
      final auth = await _authRepository.getAuthInfo();
      if (auth == null) {
        emit(NotLoggedIn());
        return;
      }
      // 토큰 정보 새로고침
      final newAuth = await _githubAuthRepository.refreshToken(
          param: RefreshTokenRequestParamInfo(refreshToken: auth.refreshToken));
      final success = await _authRepository.saveAuthInfo(auth: newAuth);
      if (success) {
        emit(LoggedIn());
      } else {
        emit(AuthError(errorCode: "AB-0001"));
      }
    } catch (e) {
      emit(AuthError(errorCode: "AB-0002", error: e));
    }
  }

  _login(Login event, Emitter<AuthState> emit) async {
    if (state is LoggingIn) return;
    emit(LoggingIn());
    String? code;
    try {
      final url = Uri.https(
        'github.com',
        '/login/oauth/authorize',
        {
          'client_id': dotenv.env['CLIENT_ID'],
        },
      );
      final result = await FlutterWebAuth.authenticate(
        url: url.toString(),
        callbackUrlScheme: "githubsearch",
      );
      code = Uri.parse(result).queryParameters['code'];
      if (code == null) {
        emit(AuthError(errorCode: "AB-0005"));
        return;
      }
    } catch (e) {
      emit(AuthError(errorCode: "AB-0006", error: e));
    }

    await Future.delayed(const Duration(seconds: 2));

    try {
      final auth = await _githubAuthRepository.authorize(
        param: AuthRequestParamInfo(code: code!),
      );
      final success = await _authRepository.saveAuthInfo(auth: auth);
      if (success) {
        emit(LoggedIn());
      } else {
        emit(AuthError(errorCode: "AB-0003"));
      }
    } catch (e) {
      emit(AuthError(errorCode: "AB-0004", error: e));
    }
  }

  _logout(Logout event, Emitter<AuthState> emit) async {
    if (state is LoggingOut) return;
    emit(LoggingOut());
    try {
      final success = await _authRepository.removeAuthInfo();
      if (success) {
        emit(NotLoggedIn());
      } else {
        emit(AuthError(errorCode: "AB-0005"));
      }
    } catch (e) {
      emit(AuthError(errorCode: "AB-0006", error: e));
    }
  }
}
