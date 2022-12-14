import 'package:file_manager/features/home/domain/models/create_group_model.dart';
import 'package:file_manager/features/home/domain/models/groups_model.dart';
import 'package:file_manager/features/home/domain/params/pagination_params.dart';

abstract class HomeRepo {
  Future<GroupsModel> getGroups({
    PaginationParams? params,
  });

  Future<CreateGroupModel> createGroup({
    String? grpName,
  });
}
