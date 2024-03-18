import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/search_response/code/info.dart';
import '../../models/search_response/info.dart';
import '../../models/search_response/issues/info.dart';
import '../../models/search_response/repositories/info.dart';
import '../../models/search_response/user/info.dart';
import '../../models/search_result_info.dart';
import '../../repositories/search_strategy.dart';
part 'event.dart';
part 'state.dart';

mixin SearchHistoryMixin on Bloc<SearchEvent, SearchState> {
  SearchType get type;
  SearchStrategy get strategy;

  int currentPage = 0;
  late String q;

  _initialize(SearchInitialize event, Emitter<SearchState> emit) async {
    emit(SearchInitialized());
  }

  _search(Search event, Emitter<SearchState> emit) async {
    if (state is Searching) return;

    q = event.q;
    currentPage = 0;

    emit(Searching());

    add(LoadMore());
  }

  _loadMore(LoadMore event, Emitter<SearchState> emit) async {
    if (state is LoadingMore) {
      return;
    }
    if (state is! Searching) {
      emit(
        LoadingMore(
          hasMore: state.hasMore,
          totalCount: state.totalCount,
          result: state.result,
        ),
      );
    }
    try {
      final searchResponse = await strategy.search(q: q, page: currentPage + 1);
      late List<SearchResultInfo> searchResult;
      switch (type) {
        case SearchType.code:
          searchResult = (searchResponse as SearchCodeResponseInfo).codeList;
          break;
        case SearchType.repositories:
          searchResult =
              (searchResponse as SearchRepositoriesResponseInfo).repositories;
          break;
        case SearchType.issues:
          searchResult = (searchResponse as SearchIssuesResponseInfo).issueList;
          break;
        case SearchType.pullRequest:
          searchResult = (searchResponse as SearchIssuesResponseInfo).issueList;
          break;
        case SearchType.users:
          searchResult = (searchResponse as SearchUserResponseInfo).userList;
          break;
        case SearchType.organizations:
          searchResult = (searchResponse as SearchUserResponseInfo).userList;
          break;
      }
      currentPage++;
      final newList = [
        ...state.result,
        ...searchResult,
      ];
      emit(
        Searched(
          hasMore: searchResult.length < searchResponse.totalCount,
          totalCount: searchResponse.totalCount,
          result: newList,
        ),
      );
    } catch (e) {
      emit(SearchError(errorCode: "SB-0001", error: e));
    }
  }
}

abstract class SearchBloc extends Bloc<SearchEvent, SearchState>
    with SearchHistoryMixin {
  SearchBloc({
    required this.type,
    required this.strategy,
  }) : super(SearchInitial()) {
    on<SearchInitialize>(_initialize);
    on<Search>(_search);
    on<LoadMore>(_loadMore);
  }
  @override
  final SearchStrategy strategy;
  @override
  final SearchType type;
}

class SearchUsersBloc extends SearchBloc {
  SearchUsersBloc()
      : super(
          type: SearchType.users,
          strategy: SearchUsersStrategy(),
        );
}

class SearchOrganizationsBloc extends SearchBloc {
  SearchOrganizationsBloc()
      : super(
          type: SearchType.organizations,
          strategy: SearchOrganizationsStrategy(),
        );
}

class SearchIssuesBloc extends SearchBloc {
  SearchIssuesBloc()
      : super(
          type: SearchType.issues,
          strategy: SearchIssuesStrategy(),
        );
}

class SearchPullRequestsBloc extends SearchBloc {
  SearchPullRequestsBloc()
      : super(
          type: SearchType.pullRequest,
          strategy: SearchPullRequestsStrategy(),
        );
}

class SearchRepositoriesBloc extends SearchBloc {
  SearchRepositoriesBloc()
      : super(
          type: SearchType.repositories,
          strategy: SearchRepositoriesStrategy(),
        );
}

class SearchCodeBloc extends SearchBloc {
  SearchCodeBloc()
      : super(
          type: SearchType.code,
          strategy: SearchCodeStrategy(),
        );
}
