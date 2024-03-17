part of 'bloc.dart';

class ProfileState extends Equatable {
  final GithubUserInfo? profile;
  const ProfileState({this.profile});

  @override
  List<Object?> get props => [profile?.nodeId];
}

class ProfileInitial extends ProfileState {}

class ProfileInitializing extends ProfileState {}

class LoadingProfile extends ProfileState {
  const LoadingProfile({super.profile});
  @override
  List<Object?> get props => [profile?.nodeId];
}

class LoadedProfile extends ProfileState {
  const LoadedProfile({required GithubUserInfo profile})
      : super(profile: profile);
  @override
  List<Object?> get props => [profile!.nodeId];
}

class ProfileError extends ProfileState {
  final String errorCode;
  final dynamic error;
  const ProfileError({required this.errorCode, this.error});
  @override
  List<Object?> get props => [errorCode];
}
