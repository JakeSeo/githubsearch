part of 'bloc.dart';

class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthInitializing extends AuthState {
  @override
  List<Object?> get props => [];
}

class LoggingIn extends AuthState {
  @override
  List<Object?> get props => [];
}

class LoggedIn extends AuthState {
  @override
  List<Object?> get props => [];
}

class LoggingOut extends AuthState {
  @override
  List<Object?> get props => [];
}

class NotLoggedIn extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthError extends AuthState {
  final String errorCode;
  final dynamic error;
  AuthError({required this.errorCode, this.error});

  @override
  List<Object?> get props => [errorCode];
}
