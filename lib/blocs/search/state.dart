part of 'bloc.dart';

class SearchState {}

class SearchInitial extends SearchState {}

class SearchError extends SearchState {
  final String errorCode;
  final dynamic error;
  SearchError({required this.errorCode, this.error});
}
