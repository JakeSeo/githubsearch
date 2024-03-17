import '../injector.dart';
import '../models/search_request_param/info.dart';
import '../models/search_response/info.dart';
import '../models/search_response/user/info.dart';
import 'github/repository.dart';

abstract class SearchStrategy {
  static const int defaultPerPage = 30;
  static const int defaultPage = 1;
  final GithubRepository repository = injector.get<GithubRepository>();
  Future<SearchResponseInfo> search({required String q, int perPage, int page});
}

class SearchUsersStrategy extends SearchStrategy {
  @override
  Future<SearchUserResponseInfo> search({
    required String q,
    int perPage = SearchStrategy.defaultPerPage,
    int page = SearchStrategy.defaultPage,
  }) async {
    final response = await repository.searchUsers(
      param: SearchRequestParamInfo(
        q: "$q type:user",
        perPage: perPage,
        page: page,
      ),
    );
    return response;
  }
}

class SearchOrganizationsStrategy extends SearchStrategy {
  @override
  Future<SearchUserResponseInfo> search({
    required String q,
    int perPage = SearchStrategy.defaultPerPage,
    int page = SearchStrategy.defaultPage,
  }) async {
    final response = await repository.searchUsers(
      param: SearchRequestParamInfo(
        q: "$q type:organization",
        perPage: perPage,
        page: page,
      ),
    );
    return response;
  }
}
