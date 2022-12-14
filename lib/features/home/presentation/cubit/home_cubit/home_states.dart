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
