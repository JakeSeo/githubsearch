part of 'bloc.dart';

class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileInitialize extends ProfileEvent {}

class LoadProfile extends ProfileEvent {}

class ResetProfile extends ProfileEvent {}
