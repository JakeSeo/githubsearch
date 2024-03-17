part of 'bloc.dart';

class SearchState {
  final bool hasMore;
  final int totalCount;
  final List<SearchResultInfo> result;
  SearchState({
    this.hasMore = true,
    this.totalCount = 0,
    this.result = const [],
  });
}

class SearchInitial extends SearchState {}

class SearchInitialized extends SearchState {}

class Searching extends SearchState {
  Searching({
    super.hasMore,
    super.totalCount,
    super.result,
  });
}

class LoadingMore extends SearchState {
  LoadingMore({
    super.hasMore,
    super.totalCount,
    super.result,
  });
}

class Searched extends SearchState {
  Searched({
    super.hasMore,
    super.totalCount,
    super.result,
  });
}

class SearchError extends SearchState {
  final String errorCode;
  final dynamic error;
  SearchError({required this.errorCode, this.error});
}
