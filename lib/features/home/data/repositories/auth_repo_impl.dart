import 'package:file_manager/features/home/data/data_sources/remote/auth_service/auth_api_service.dart';
import 'package:file_manager/features/home/domain/bodies/login_body.dart';
import 'package:file_manager/features/home/domain/models/auth_model.dart';
import 'package:file_manager/features/home/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl extends AuthRepo {
  final AuthApiService _authApiService;

  AuthRepoImpl(this._authApiService);

  @override
  Future<AuthModel> login({
    required LoginBody loginBody,
  }) async {
    return await _authApiService.login(loginBody: loginBody);
  }
}
