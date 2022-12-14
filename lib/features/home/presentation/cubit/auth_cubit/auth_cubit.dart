import 'package:file_manager/app/utilities/constants.dart';
import 'package:file_manager/features/home/domain/bodies/login_body.dart';
import 'package:file_manager/features/home/domain/bodies/register_body.dart';
import 'package:file_manager/features/home/domain/repositories/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'auth_states.dart';


@injectable
class AuthCubit extends Cubit<AuthStates> {
  AuthCubit(this._authRepo) : super(AuthInitialState());
  final AuthRepo _authRepo;

  login({
    required LoginBody loginBody,
  }) async {
    emit(LoginLoadingState());
    await _authRepo.login(loginBody: loginBody).then((value) {
      print(value.user?.token);
      emit(LoginDoneState(loginModel: value));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState());
    });
  }

  register({
    required RegisterBody registerBody,
  }) async {
    emit(RegisterLoadingState());
    await _authRepo.register(registerBody: registerBody).then((value) {
      print(value.data?.token);
      emit(RegisterDoneState(registerModel: value));
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState());
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassWord = true;

  void changeVisibility() {
    isPassWord = !isPassWord;
    suffix =
        isPassWord ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }
}
