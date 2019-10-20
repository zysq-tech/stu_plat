import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../data/index.dart';

part 'RestClient.g.dart';

@RestApi(baseUrl: "http://www.zhiyuantech.net/api/")
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @POST('/session')
  Future<LoginResponse> login(@Body() Login loginBody);

  @DELETE('/session')
  Future<LogoutResponse> logout(@Query('token') String token);

  @POST('/rest/sendCode')
  Future<RequsetCodeResponse> requestCode(@Body() RequsetCode requsetCodeBody);

  @POST('/rest/verifyCode')
  Future<VerifyCodeResponse> verifyCode(@Body() VerifyCode verifyCodeBody);

  @POST('/rest/register')
  Future<RegisterResponse> register(@Body() Register registerBody);

  @PUT('/nickemail')
  Future<SetNickNameEmailResponse> setNickNameEmail(
      @Query('token') String token,
      @Body() SetNickNameEmail setNickNameEmailBody);

  ///searchType: 1：新秀榜/2：热搜榜/3：下载榜
  @GET('/appInfo/rest/{searchType}')
  Future<GetAppInfoPageResponse> getAppInfoPage(
      @Path() int searchType, @Queries() Map<String, dynamic> pageSize);

  ///searchType: 1：今日最佳/2：精品必备
  @GET('/appInfo/rest/list/{searchType}')
  Future<GetAppBestListResponse> getAppBestList(@Path() int searchType);

  @GET('/appInfo/rest/detail/{appId}')
  Future<GetAppDetailResponse> getAppDetail(@Path() int appId);

  @POST('/userAppraise')
  Future<CommentAppResponse> commentApp(
      @Query('token') String token, @Body() CommentApp commentAppBody);

  @GET('/userAppraise/pageList')
  Future<GetAppCommentsPageResponse> getAppCommentPage(
      @Query('token') String token,
      @Queries() Map<String, dynamic> getAppCommentsPage);

  @GET('/appLabel/rest/list')
  Future<GetAppLabelListResponse> getAppLabelList(
      @Queries() Map<String, dynamic> getAppLabelListQueries);

  @GET('/appLabelRelation/rest/{labelId}')
  Future<GetAppPageWithLabelResponse> getAppPageWithLabel(
      @Path('labelId') String labelId,
      @Queries() Map<String, dynamic> getAppPageWithLabelQueries);

  @GET('/appChoose/rest')
  Future<GetChoosenAppListResponse> getChoosenAppList();

  @GET('/appVersion/rest/newest')
  Future<GetLatestVersionResponse> getLatestVersion();

  @GET('/appQuestion/rest/typelist')
  Future<GetAllQuestionTypesResponse> getAllQuestionTypes();

  @POST('/appQuestion/rest')
  Future<PostUserQuestionResponse> postUserQuestion(
      @Body() PostUserQuestion postUserQuestion);
}
