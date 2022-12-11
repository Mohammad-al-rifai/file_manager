// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:file_manager/app/utilities/global_components/defalut_form_field.dart';

import '../../../../app/resources/color_manager.dart';
import '../../../../app/resources/styles_manager.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File manager'),
      ),
      body: Center(
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
                  ),
                  const SizedBox(
                    height: 20.0,
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
      ),
    );
  }
}
