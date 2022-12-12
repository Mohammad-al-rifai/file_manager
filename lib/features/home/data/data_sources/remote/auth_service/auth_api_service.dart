import 'package:dio/dio.dart';
import 'package:file_manager/app/utilities/constants.dart';
import 'package:file_manager/features/home/domain/bodies/login_body.dart';
import 'package:file_manager/features/home/domain/bodies/register_body.dart';
import 'package:file_manager/features/home/domain/models/auth_model.dart';
import 'package:file_manager/features/home/domain/models/register_model.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  // Login
  @POST(Constants.logIn)
  Future<AuthModel> login({
    @Body() LoginBody? loginBody,
  });

  // Register
  @POST(Constants.register)
  Future<RegisterModel> register({
    @Body() RegisterBody? registerBody,
  });
}
