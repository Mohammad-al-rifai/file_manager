// ignore_for_file: must_be_immutable

import 'package:file_manager/app/di/injector.dart%20';
import 'package:file_manager/features/home/domain/bodies/register_body.dart';
import 'package:file_manager/features/home/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:file_manager/app/utilities/global_components/defalut_form_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/resources/color_manager.dart';
import '../../../../app/resources/styles_manager.dart';
import '../../../../app/utilities/constants.dart';
import '../../../../app/utilities/global_components/default_button.dart';
import '../../../../app/utilities/global_components/toast_notification.dart';
import '../cubit/auth_cubit/auth_states.dart';
import 'home_layout.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var fullNameController = TextEditingController();
  var userNameController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  final RegisterBody _registerBody = RegisterBody(isAdmin: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File manager'),
      ),
      body: BlocProvider(
        create: (context) => injector<AuthCubit>(),
        child: BlocConsumer<AuthCubit, AuthStates>(
          listener: (context, state) {
            if (state is RegisterDoneState) {
              // ===============SAVE TOKEN HERE=================
              Constants.token = state.registerModel.data?.token;
              // ===============================================
              showToast(
                text: 'Register Done Success',
                state: ToastStates.SUCCESS,
              );
            }
            if (state is RegisterErrorState) {
              showToast(
                text: 'No Internet Connection-Try Again',
                state: ToastStates.ERROR,
              );
            }
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomeLayout()));
          },
          builder: (context, state) {
            print(state.runtimeType);
            return Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Register',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'File manager will save your file in Secure Place',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        DefaultFormField(
                          controller: fullNameController,
                          keyboardType: TextInputType.text,
                          label: 'Full Name',
                          prefixIcon: Icons.drive_file_rename_outline,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Full Name Required!';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        DefaultFormField(
                          controller: userNameController,
                          keyboardType: TextInputType.text,
                          label: 'User Name',
                          prefixIcon: Icons.person,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return ' User Name Required!';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        DefaultFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          label: 'Email Address',
                          prefixIcon: Icons.email,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Email Address Required!';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        DefaultFormField(
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          label: 'Password',
                          prefixIcon: Icons.lock,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Password Required!';
                            }
                          },
                          suffix: context.read<AuthCubit>().suffix,
                          suffixPressed: () {
                            context.read<AuthCubit>().changeVisibility();
                          },
                          isPassword: context.read<AuthCubit>().isPassWord,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        DefaultButton(
                          function: () {
                            if (formKey.currentState!.validate()) {
                              _registerBody.fullName = fullNameController.text;
                              _registerBody.userName = userNameController.text;
                              _registerBody.email = emailController.text;
                              _registerBody.password = passwordController.text;
                              context.read<AuthCubit>().register(
                                    registerBody: _registerBody,
                                  );
                            } else {
                              print('Else');
                            }
                          },
                          text: 'register',
                          isUpperCase: true,
                          isLoading: (state is RegisterLoadingState),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Have Account? ',
                              style: getLightStyle(
                                color: ColorManager.lightGrey,
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginScreen(),
                                    ));
                              },
                              child: Text(
                                'Login Now',
                                style: getMediumStyle(
                                  color: ColorManager.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
