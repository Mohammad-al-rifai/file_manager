import 'dart:io';

import 'package:file_manager/app/utilities/constants.dart';
import 'package:file_manager/features/home/domain/models/all_users_model.dart';
import 'package:file_manager/features/home/domain/models/groups_model.dart';
import 'package:file_manager/features/home/domain/params/pagination_params.dart';
import 'package:file_manager/features/home/domain/repositories/home_repo.dart';
import 'package:file_manager/features/home/presentation/cubit/home_cubit/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(this._homeRepo) : super(HomeInitialState());
  final HomeRepo _homeRepo;

  bool noMoreGroups = false;
  List<Group> groups = [];
  int groupsPage = 1;

  getGroups() async {
    print(groupsPage);
    if (noMoreGroups) {
      return;
    }
    if (groups.isEmpty) {
      emit(GetGroupsLoadingState());
    }
    await _homeRepo
        .getGroups(
            params: PaginationParams(
      page: groupsPage,
    ))
        .then((value) {
      noMoreGroups = value.groups!.length < Constants.pageSize;
      groups.addAll(value.groups!);
      groupsPage++;
      emit(GetGroupsDoneState(
        groups: groups,
        noMoreGroups: noMoreGroups,
      ));
    }).catchError((error) {
      print(error.toString());
      emit(GetGroupsErrorState());
    });
  }

  createGroup({
    required String grpName,
  }) async {
    emit(CreateGroupLoadingState());
    await _homeRepo.createGroup(grpName: grpName).then((value) {
      emit(CreateGroupDoneState(createGroupModel: value));
    }).catchError((error) {
      print(error.toString());
      emit(CreateGroupErrorState());
    });
  }

  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;

  void changeBottomSheet({
    required bool isShow,
    required IconData icon,
  }) {
    isBottomSheetShown = isShow;
    fabIcon = icon;
    emit(AppChangeBottomSheetState());
  }

  addUserToGroup({
    required String groupId,
    required String userId,
  }) async {
    emit(AddUserToGroupLoadingState());
    await _homeRepo
        .addUserToGroup(
      groupId: groupId,
      userId: userId,
    )
        .then((value) {
      emit(AddUserToGroupDoneState(response: 'User Added Successfully'));
    }).catchError((error) {
      print(error.toString());
      emit(AddUserToGroupErrorState());
    });
  }

  // Get All Users
  bool noMoreUsers = false;
  List<User> users = [];
  int usersPage = 1;

  getUsers() async {
    if (noMoreUsers) {
      return;
    }
    if (users.isEmpty) {
      emit(GetUsersLoadingState());
    }
    await _homeRepo
        .getUsers(
            params: PaginationParams(
      page: usersPage,
      size: 20,
    ))
        .then((value) {
      noMoreUsers = value.users!.length < Constants.pageSize;
      users.addAll(value.users!);
      usersPage++;
      emit(GetUsersDoneState(
        users: users,
        noMoreUsers: noMoreUsers,
      ));
    }).catchError((error) {
      print(error.toString());
      emit(GetUsersErrorState());
    });
  }

  List<User> uInG = [];

  getAllUsersInGroup({
    required int groupId,
  }) async {
    emit(GetAllUsersInGroupLoadingState());
    await _homeRepo
        .getUserOfGroup(params: PaginationParams(), groupId: groupId)
        .then((value) {
      uInG.addAll(value.users!);
      emit(GetAllUsersInGroupDoneState());
    }).catchError((error) {
      print(error.toString());
      emit(GetAllUsersInGroupErrorState());
    });
  }

  // ===================== Files ==========================

  upload({
    required int groupId,
    required String userName,
    required File file,
  }) async {
    emit(UploadLoadingState());
    await _homeRepo
        .upload(
      groupId: groupId,
      userName: userName,
      file: file,
    )
        .then((value) {
      emit(UploadDoneState());
    }).catchError((error) {
      emit(UploadErrorState());
    });
  }
}
