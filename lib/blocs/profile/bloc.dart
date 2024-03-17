import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injector.dart';
import '../../models/github_user/info.dart';
import '../../repositories/github/repository.dart';

part 'event.dart';
part 'state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileInitialize>(_initialize);
    on<LoadProfile>(_loadProfile);
    on<ResetProfile>((_, emit) => emit(ProfileInitial()));
  }
  final GithubRepository _githubRepository = injector.get<GithubRepository>();

  _initialize(ProfileInitialize event, Emitter<ProfileState> emit) {
    emit(ProfileInitializing());
    add(LoadProfile());
  }

  _loadProfile(LoadProfile event, Emitter<ProfileState> emit) async {
    emit(LoadingProfile(profile: state.profile));

    try {
      final profile = await _githubRepository.getUser();
      emit(LoadedProfile(profile: profile));
    } catch (e) {
      emit(const ProfileError(errorCode: "PB-0001"));
    }
  }
}
