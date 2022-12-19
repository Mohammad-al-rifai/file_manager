import 'dart:io';

import 'package:file_manager/features/home/domain/models/all_users_model.dart';
import 'package:file_manager/features/home/domain/models/create_group_model.dart';
import 'package:file_manager/features/home/domain/models/groups_model.dart';
import 'package:file_manager/features/home/domain/models/upload_model.dart';
import 'package:file_manager/features/home/domain/params/pagination_params.dart';

import '../models/add_u2g_model.dart';

abstract class HomeRepo {
  Future<GroupsModel> getGroups({
    PaginationParams? params,
  });

  Future<AllUsersModel> getUsers({
    PaginationParams? params,
  });

  Future<AllUsersModel> getUserOfGroup({
    required PaginationParams params,
    required int groupId,
  });

  Future<CreateGroupModel> createGroup({
    String? grpName,
  });

  Future<AddU2GModel> addUserToGroup({
    required String groupId,
    required String userId,
  });

  // =========== File ==========

  Future<UploadModel> upload({
    required int groupId,
    required String userName,
    required File file,
  });
}
