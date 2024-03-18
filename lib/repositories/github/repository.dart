import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../models/github_user/info.dart';
import '../../models/search_request_param/info.dart';
import '../../models/search_response/code/info.dart';
import '../../models/search_response/issues/info.dart';
import '../../models/search_response/repositories/info.dart';
import '../../models/search_response/user/info.dart';

part 'repository.g.dart';

@RestApi(baseUrl: 'https://api.github.com')
abstract class GithubRepository {
  factory GithubRepository(Dio dio, {String baseUrl}) = _GithubRepository;

  @GET("/user")
  @Headers({'access_token': true})
  Future<GithubUserInfo> getUser();

  @GET("/search/code")
  @Headers({'access_token': true})
  Future<SearchCodeResponseInfo> searchCode({
    @Queries() required SearchRequestParamInfo param,
  });

  // @GET("//search/commits")
  // Future searchCommits();

  @GET("/search/issues")
  Future<SearchIssuesResponseInfo> searchIssues({
    @Queries() required SearchRequestParamInfo param,
  });

  // @GET("/search/labels")
  // Future searchLabels();

  @GET("/search/repositories")
  Future<SearchRepositoriesResponseInfo> searchRepositories({
    @Queries() required SearchRequestParamInfo param,
  });

  // @GET("/search/topics")
  // Future searchTopics();

  @GET("/search/users")
  Future<SearchUserResponseInfo> searchUsers({
    @Queries() required SearchRequestParamInfo param,
  });
}
