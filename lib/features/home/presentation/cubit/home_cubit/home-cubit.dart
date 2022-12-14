import 'package:file_manager/app/utilities/constants.dart';
import 'package:file_manager/features/home/domain/models/groups_model.dart';
import 'package:file_manager/features/home/domain/params/pagination_params.dart';
import 'package:file_manager/features/home/domain/repositories/home_repo.dart';
import 'package:file_manager/features/home/presentation/cubit/home_cubit/home_states.dart';
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
        .getGroups(params: PaginationParams(page: groupsPage))
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
}
