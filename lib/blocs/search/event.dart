part of 'bloc.dart';

class SearchEvent {}

class Search extends SearchEvent {
  final String q;
  Search({required this.q});
}

class LoadMore extends SearchEvent {}

class SearchInitialize extends SearchEvent {}
