import 'dart:io';

import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

import '../data/index.dart';
import 'config.dart';

part 'RestClient.g.dart';

@RestApi(baseUrl: ApiUrl)
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  //User
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

  @DELETE('/logout')
  Future<UnregisterAccountResponse> unregisterAccount(
      @Query('token') String token);

  @PUT('/nickemail')
  Future<SetNickNameEmailResponse> setNickNameEmail(
      @Query('token') String token,
      @Body() SetNickNameEmail setNickNameEmailBody);

  @PUT('/info')
  Future<RegisterUserInfoResponse> registerUserInfo(
      @Query('token') String token,
      @Body() RegisterUserInfo registerUserInfoBody);

  @PUT('/rest/updatePwd')
  Future<UpdatePasswordResponse> updatePassword(
      @Body() UpdatePassword updatePasswordBody);

  @POST('/userAppeal')
  Future<AppealAccountResponse> appealAccount(
    @Query('token') String token,
    @Field() File file,
    @Field() int userType,
    @Field() String studentCode,
    @Field() String idfRealName,
    @Field() String schoolName, {
    @Field() String collegeName,
    @Field() String className,
  });

  @GET('/userAppeal')
  Future<GetAppealListResponse> getAppealList(@Query('token') String token);

  @PUT('/updateAvatar')
  Future<UpdateAvatarResponse> updateAvatar(
      @Query('token') String token, @Field() File file);

  @POST('/verify')
  Future<VerifyCodeAndRealNameResponse> verifyCodeAndRealName(
      @Query('token') String token,
      @Body() VerifyCodeAndRealName verifyCodeBody);

  @GET('/appUserNews/pageList')
  Future<GetInAppNewsResponse> getInAppNewsPage(@Query('token') String token,
      @Queries() Map<String, dynamic> getInAppNewsQueries);

  @PUT('/appUserNews/isRead/{userNewId}')
  Future<ReadInAppNewsResponse> readInAppNews(
      @Path('userNewId') String userNewId, @Query('token') String token);

  @PUT('/tele')
  Future<UpdatePhoneResponse> updatePhone(
      @Query('token') String token, @Field() String tele);
  //

  //Apps
  ///searchType: 1：新秀榜/2：热搜榜/3：下载榜
  @GET('/appInfo/rest/{searchType}')
  Future<GetLeaderBoardAppPageResponse> getLeaderBoardAppPage(
      @Path() int searchType,
      @Queries() Map<String, dynamic> getLeaderBoardAppPageQueries);

  ///searchType: 1：今日最佳/2：精品必备
  @GET('/appInfo/rest/list/{searchType}')
  Future<GetAppBestListResponse> getAppBestList(@Path() int searchType);

  @GET('/appInfo/rest/detail/{appId}')
  Future<GetAppDetailResponse> getAppDetail(@Path() int appId);

  @POST('/userAppraise')
  Future<CommentAppResponse> commentApp(
      @Query('token') String token, @Body() CommentApp commentAppBody);

  @DELETE('/userAppraise/{praiseId}')
  Future<DeleteUserAppCommentResponse> deleteUserAppComment(
      @Path('praiseId') String praiseId, @Query('token') String token);

  @GET('/userAppraise/pageList')
  Future<GetUserAppCommentsPageResponse> getUserAppCommentPage(
      @Query('token') String token,
      @Queries() Map<String, dynamic> getUserAppCommentsPage);

  ///不带参数拿父级列表，用父级参数拿子级列表
  @GET('/appLabel/rest/list')
  Future<GetAppLabelListResponse> getAppLabelList(
      [@Queries() Map<String, dynamic> getAppLabelListQueries]);

  @GET('/appLabelRelation/rest/{labelId}')
  Future<GetAppPageWithLabelResponse> getAppPageWithLabel(
      @Path('labelId') String labelId,
      @Queries() Map<String, dynamic> getAppPageWithLabelQueries);

  @GET('/appChoose/rest')
  Future<GetChoosenAppListResponse> getChoosenAppList();

  @GET('/mainTitle/rest')
  Future<GetHomeTagListResponse> getHomeTagList();

  @GET('/mainTitle/rest/{mainId}')
  Future<GetHomeTaggedAppListResponse> getHomeTaggedAppList(
      @Path('mainId') String mainId);

  @GET('/appTab/rest')
  Future<GetTabListResponse> getAllTabList();

  @GET('/userInfo')
  Future<GetUserInfoResponse> getUserInfo(@Query('token') String token);

  @GET('/userAppraise/rest/pageList/{appId}')
  Future<GetAppCommentListResponse> getAppCommentList(
      @Path('appId') String appId,
      @Body() GetAppCommentList getAppCommentListBody);

  @GET('/userAppraise/rest/avgPraise/{appId}')
  Future<GetAppAverageRatingResponse> getAppAverageRating(
      @Path('appId') String appId);

  @GET('/appInfo/rest/pageList')
  Future<SearchAppResponse> searchApp(Map<String, dynamic> searchAppQueries);

  @POST('/appInfo/appRecord')
  Future<RecordAppResponse> recordApp(
      @Query('token') String token, @Body() RecordApp recordAppBody);
  //

  //Other
  @GET('/appVersion/rest/newest')
  Future<GetLatestVersionResponse> getLatestVersion();

  @GET('/appQuestion/rest/typelist')
  Future<GetAllQuestionTypesResponse> getAllQuestionTypes();

  @POST('/appQuestion/rest')
  Future<PostUserQuestionResponse> postUserQuestion(
      @Body() PostUserQuestion postUserQuestionBody);

  @GET('/schoolInfo/rest/list')
  Future<GetSchoolListResponse> getSchoolList();
}
