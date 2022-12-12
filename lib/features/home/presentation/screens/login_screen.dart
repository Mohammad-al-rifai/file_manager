import 'package:file_manager/app/di/injector.dart';
import 'package:file_manager/app/resources/color_manager.dart';
import 'package:file_manager/app/resources/styles_manager.dart';
import 'package:file_manager/app/utilities/global_components/defalut_form_field.dart';
import 'package:file_manager/app/utilities/global_components/default_button.dart';
import 'package:file_manager/app/utilities/global_components/toast_notification.dart';
import 'package:file_manager/features/home/domain/bodies/login_body.dart';
import 'package:file_manager/features/home/presentation/cubit/auth_states.dart';
import 'package:file_manager/features/home/presentation/screens/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/auth_cubit.dart';
import 'home_layout.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  LoginBody loginBody = LoginBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Manager'),
      ),
      body: BlocProvider(
        create: (context) => injector<AuthCubit>(),
        child: BlocConsumer<AuthCubit, AuthStates>(
          listener: (context, state) {
            if (state is LoginDoneState) {
              if (state.loginModel.message == 'Faield') {
                showToast(
                  text: 'Please Check Your E-mail or Password!',
                  state: ToastStates.WARNING,
                );
              } else {
                showToast(
                  text: 'Login Done Success',
                  state: ToastStates.SUCCESS,
                );
              }
            }
            if (state is LoginErrorState) {
              showToast(
                text: 'No Internet Connection-Try Again',
                state: ToastStates.ERROR,
              );
            }
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
                          'LOGIN',
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
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          label: 'Email-Address',
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
                              loginBody.email = emailController.text;
                              loginBody.password = passwordController.text;
                              context
                                  .read<AuthCubit>()
                                  .login(loginBody: loginBody);
                            } else {
                              print('Else');
                            }
                          },
                          text: 'Login',
                          isUpperCase: true,
                          isLoading: (state is LoginLoadingState),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Don\'t Have Account? ',
                              style: getLightStyle(
                                color: ColorManager.lightGrey,
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegisterScreen(),
                                    ));
                              },
                              child: Text(
                                'Register Now',
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
