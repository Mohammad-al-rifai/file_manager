import 'package:file_manager/features/home/domain/bodies/login_body.dart';
import 'package:retrofit/dio.dart';

import '../models/auth_model.dart';

abstract class AuthRepo {
  Future<AuthModel> login({
    required LoginBody loginBody,
  });
}
