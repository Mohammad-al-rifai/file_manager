import 'package:file_manager/features/home/domain/bodies/login_body.dart';
import 'package:file_manager/features/home/domain/bodies/register_body.dart';
import 'package:file_manager/features/home/domain/models/register_model.dart';

import '../models/auth_model.dart';

abstract class AuthRepo {
  Future<AuthModel> login({
    required LoginBody loginBody,
  });

  Future<RegisterModel> register({
    required RegisterBody registerBody,
  });
}
