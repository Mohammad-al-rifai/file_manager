import 'package:file_manager/features/home/domain/models/auth_model.dart';
import 'package:file_manager/features/home/domain/models/register_model.dart';

abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class ChangePasswordVisibilityState extends AuthStates {}

// Login States

class LoginLoadingState extends AuthStates {}

class LoginDoneState extends AuthStates {
  final AuthModel loginModel;

  LoginDoneState({required this.loginModel});
}

class LoginErrorState extends AuthStates {}

// Register States
class RegisterLoadingState extends AuthStates {}

class RegisterDoneState extends AuthStates {
  final RegisterModel registerModel;

  RegisterDoneState({required this.registerModel});
}

class RegisterErrorState extends AuthStates {}
