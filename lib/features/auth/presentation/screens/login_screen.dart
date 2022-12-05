// ignore_for_file: must_be_immutable

import 'package:file_manager/app/resources/values_manager.dart';
import 'package:file_manager/app/utilities/global_components/defalut_form_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(AppSize.s16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultFormField(
                  controller: emailController,
                  type: TextInputType.emailAddress,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'Email Address Required!';
                    }
                  },
                  label: 'Email',
                  prefix: Icons.email,
                ),
                const SizedBox(
                  height: AppSize.s8,
                ),
                DefaultFormField(
                  controller: emailController,
                  type: TextInputType.emailAddress,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'Email Address Required!';
                    }
                  },
                  label: 'Email',
                  prefix: Icons.email,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
