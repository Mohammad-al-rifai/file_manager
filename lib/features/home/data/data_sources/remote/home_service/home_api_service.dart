import 'package:dio/dio.dart';
import 'package:file_manager/features/home/domain/models/create_group_model.dart';
import 'package:file_manager/features/home/domain/models/groups_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../../app/utilities/constants.dart';

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

  // createGroup
  @POST(Constants.createGroup)
  Future<CreateGroupModel> createGroup({
    @Header("Authorization") String? authorization,
    @Field("grpName") String? grpName,
  });
}
