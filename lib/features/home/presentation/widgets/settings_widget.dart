// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:file_manager/app/di/injector.dart%20';
import 'package:file_manager/app/utilities/global_components/defalut_form_field.dart';
import 'package:file_manager/app/utilities/global_components/default_button.dart';
import 'package:file_manager/app/utilities/global_components/default_loading.dart';
import 'package:file_manager/features/home/presentation/cubit/home_cubit/home-cubit.dart';
import 'package:file_manager/features/home/presentation/cubit/home_cubit/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/utilities/global_components/toast_notification.dart';
// import 'package:file_picker/file_picker.dart';

class SettingsWidget extends StatelessWidget {
  SettingsWidget({Key? key}) : super(key: key);

  var createGController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            DefaultButton(
              function: () {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return BlocConsumer<HomeCubit, HomeStates>(
                        listener: (context, state) {
                          if (state is CreateGroupDoneState) {
                            showToast(
                              text: 'Group Created Done ✅',
                              state: ToastStates.SUCCESS,
                            );
                            Navigator.of(context).pop();
                          }
                        },
                        builder: (context, state) {
                          return AlertDialog(
                            title: const Center(
                              child: Text(
                                'Create New Group',
                              ),
                            ),
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Form(
                                key: formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    DefaultFormField(
                                      controller: createGController,
                                      label: 'Group Name',
                                      prefixIcon: Icons.group_add,
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return 'Group Name Required!';
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            actions: <Widget>[
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    bottom: 30.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.close,
                                          size: 50.0,
                                          color: Colors.blue,
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: IconButton(
                                        icon: (state is CreateGroupLoadingState)
                                            ? DefaultLoading(
                                                yT: -20.0,
                                              )
                                            : const Icon(
                                                Icons.add_task_sharp,
                                                size: 50.0,
                                                color: Colors.green,
                                              ),
                                        onPressed: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            context
                                                .read<HomeCubit>()
                                                .createGroup(
                                                  grpName:
                                                      createGController.text,
                                                );
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    });
              },
              text: 'Create Group',
            ),
            const SizedBox(
              height: 16.0,
            ),
            DefaultButton(
              function: () async {
                // FilePickerResult? result = await FilePicker.platform.pickFiles(
                //   type: FileType.custom,
                //   allowedExtensions: ['txt'],
                // );
                //
                // if (result != null) {
                //   File file = File(result.files.single.path!);
                // } else {
                //   // User canceled the picker
                // }
              },
              text: 'Upload File',
            ),
          ],
        ),
      ),
    );
  }
}
