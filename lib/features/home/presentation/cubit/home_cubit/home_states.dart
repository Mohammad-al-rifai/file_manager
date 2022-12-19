import 'package:file_manager/features/home/domain/models/all_users_model.dart';
import 'package:file_manager/features/home/domain/models/create_group_model.dart';

import '../../../domain/models/groups_model.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

// Get Groups States

class GetGroupsLoadingState extends HomeStates {}

class GetGroupsDoneState extends HomeStates {
  bool? noMoreGroups;
  List<Group>? groups;

  GetGroupsDoneState({this.groups, this.noMoreGroups});
}

class GetGroupsErrorState extends HomeStates {}

// Create Group
class CreateGroupLoadingState extends HomeStates {}

class CreateGroupDoneState extends HomeStates {
  CreateGroupModel? createGroupModel;

  CreateGroupDoneState({this.createGroupModel});
}

class CreateGroupErrorState extends HomeStates {}

// Bottom Sheet
class AppChangeBottomSheetState extends HomeStates {}

// Add User To Group
class AddUserToGroupLoadingState extends HomeStates {}

class AddUserToGroupDoneState extends HomeStates {
  String? response;

  AddUserToGroupDoneState({
    this.response,
  });
}

class AddUserToGroupErrorState extends HomeStates {}

// Get All Users

class GetUsersLoadingState extends HomeStates {}

class GetUsersDoneState extends HomeStates {
  bool? noMoreUsers;
  List<User>? users;

  GetUsersDoneState({this.users, this.noMoreUsers});
}

class GetUsersErrorState extends HomeStates {}

// Get All Users
class GetAllUsersInGroupLoadingState extends HomeStates {}

class GetAllUsersInGroupDoneState extends HomeStates {}

class GetAllUsersInGroupErrorState extends HomeStates {}

// ================= Files =====================

class UploadLoadingState extends HomeStates {}

class UploadDoneState extends HomeStates {}

class UploadErrorState extends HomeStates {}
