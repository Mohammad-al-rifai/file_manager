import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_manager/features/home/domain/models/all_users_model.dart';
import 'package:file_manager/features/home/domain/models/create_group_model.dart';
import 'package:file_manager/features/home/domain/models/groups_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../../app/utilities/constants.dart';
import '../../../../domain/models/add_u2g_model.dart';
import '../../../../domain/models/upload_model.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String baseUrl}) = _HomeApiService;

  // getGroups
  @GET(Constants.getGroups)
  Future<GroupsModel> getGroups({
    @Query("page") int? page,
    @Query("size") int? size,
    @Header("Authorization") String? authorization,
  });

  // getUsers
  @GET(Constants.getUsers)
  Future<AllUsersModel> getUsers({
    @Query("page") int? page,
    @Query("size") int? size,
    @Header("Authorization") String? authorization,
  });

  // getUsersInGroup
  @GET(Constants.getUserOfGroup)
  Future<AllUsersModel> getUserOfGroup({
    @Query("page") int? page,
    @Query("size") int? size,
    @Query("groupId") int? groupId,
    @Header("Authorization") String? authorization,
  });

  // createGroup
  @POST(Constants.createGroup)
  Future<CreateGroupModel> createGroup({
    @Header("Authorization") String? authorization,
    @Field("grpName") String? grpName,
  });

  // addUserToGroup
  @POST(Constants.addUserToGroup)
  Future<AddU2GModel> addUserToGroup({
    @Header("Authorization") String? authorization,
    @Field("GroupId") String? groupId,
    @Field("UserId") String? userId,
  });

  // ================ File ====================

//

  @POST(Constants.upload)
  @MultiPart()
  Future<UploadModel> upload({
    @Header("Authorization") String? authorization,
    @Part() File? file,
    @Part() int? GroupId,
    @Part() String? userName,
  });
}
