import 'dart:io';

import 'package:file_manager/app/resources/constants_manager.dart';
import 'package:file_manager/app/utilities/constants.dart';
import 'package:file_manager/features/home/domain/models/all_users_model.dart';
import 'package:file_manager/features/home/domain/models/create_group_model.dart';
import 'package:file_manager/features/home/domain/models/groups_model.dart';
import 'package:file_manager/features/home/domain/models/upload_model.dart';
import 'package:file_manager/features/home/domain/params/pagination_params.dart';
import 'package:injectable/injectable.dart';

import '../../domain/models/add_u2g_model.dart';
import '../../domain/repositories/home_repo.dart';
import '../data_sources/remote/home_service/home_api_service.dart';

@LazySingleton(as: HomeRepo)
class HomeRepoImpl extends HomeRepo {
  final HomeApiService _homeApiService;

  HomeRepoImpl(this._homeApiService);

  @override
  Future<GroupsModel> getGroups({
    PaginationParams? params,
  }) async {
    return await _homeApiService.getGroups(
      authorization: Constants.token,
      page: params?.page,
      size: params?.size,
    );
  }

  @override
  Future<CreateGroupModel> createGroup({String? grpName}) async {
    return await _homeApiService.createGroup(
      authorization: Constants.token,
      grpName: grpName,
    );
  }

  @override
  Future<AddU2GModel> addUserToGroup({
    required String groupId,
    required String userId,
  }) async {
    return await _homeApiService.addUserToGroup(
      authorization: Constants.token,
      groupId: groupId,
      userId: userId,
    );
  }

  @override
  Future<AllUsersModel> getUsers({
    PaginationParams? params,
  }) async {
    return await _homeApiService.getUsers(
      authorization: Constants.token,
      page: params?.page,
      size: params?.size,
    );
  }

  @override
  Future<AllUsersModel> getUserOfGroup({
    required PaginationParams params,
    required int groupId,
  }) async {
    return await _homeApiService.getUserOfGroup(
      groupId: groupId,
      page: params.page,
      size: params.size,
      authorization: Constants.token,
    );
  }

  @override
  Future<UploadModel> upload({
    required int groupId,
    required String userName,
    required File file,
  }) async {
    return await _homeApiService.upload(
      authorization: Constants.token,
      GroupId: groupId,
      userName: userName,
      file: file,
    );
  }
}
