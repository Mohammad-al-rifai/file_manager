import 'package:file_manager/features/home/domain/models/auth_model.dart';

abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class LoginLoadingState extends AuthStates {}

class LoginDoneState extends AuthStates {
  final AuthModel loginModel;

  LoginDoneState({required this.loginModel});
}

class LoginErrorState extends AuthStates {}
