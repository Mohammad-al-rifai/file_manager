// ignore_for_file: must_be_immutable

import 'package:file_manager/app/di/injector.dart%20';
import 'package:file_manager/app/resources/color_manager.dart';
import 'package:file_manager/app/resources/styles_manager.dart';
import 'package:file_manager/app/resources/values_manager.dart';
import 'package:file_manager/app/utilities/global_components/default_button.dart';
import 'package:file_manager/app/utilities/global_components/default_loading.dart';
import 'package:file_manager/app/utilities/global_components/toast_notification.dart';
import 'package:file_manager/features/home/domain/models/all_users_model.dart';
import 'package:file_manager/features/home/presentation/cubit/home_cubit/home-cubit.dart';
import 'package:file_manager/features/home/presentation/cubit/home_cubit/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/groups_model.dart';

class GroupDetails extends StatefulWidget {
  const GroupDetails({
    required this.group,
    Key? key,
  }) : super(key: key);

  final Group group;

  @override
  State<GroupDetails> createState() => _GroupDetailsState();
}

class _GroupDetailsState extends State<GroupDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorManager.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          AppPadding.p12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('Group Name:'),
                Text(
                  widget.group.grpName ?? 'No Name',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ],
            ),
            DefaultButton(
              function: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return BlocProvider(
                      create: (context) => injector<HomeCubit>()..getUsers(),
                      child: BlocConsumer<HomeCubit, HomeStates>(
                        listener: (context, state) {
                          if (state is AddUserToGroupDoneState) {
                            showToast(
                              text: 'User Has Been Added Successfully',
                              state: ToastStates.SUCCESS,
                            );
                            Navigator.of(context).pop();
                          }
                        },
                        builder: (context, state) {
                          return AlertDialog(
                            title: const Center(
                              child: Text(
                                'Add User To This Group',
                              ),
                            ),
                            content: ListView.separated(
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    context.read<HomeCubit>().addUserToGroup(
                                          groupId:
                                              (widget.group.grpId!).toString(),
                                          userId: (context
                                                  .read<HomeCubit>()
                                                  .users[index]
                                                  .userId)
                                              .toString(),
                                        );
                                  },
                                  child: userItem(
                                      context.read<HomeCubit>().users[index]),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox();
                              },
                              itemCount: context.read<HomeCubit>().users.length,
                            ),
                            actions: <Widget>[
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  bottom: 30.0,
                                ),
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
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  },
                );
              },
              text: 'Add User To This Group',
            ),
            Expanded(
              child: BlocProvider(
                create: (context) => injector<HomeCubit>()
                  ..getAllUsersInGroup(groupId: widget.group.grpId!),
                child: BlocConsumer<HomeCubit, HomeStates>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    print(state.runtimeType);
                    if (state is GetAllUsersInGroupLoadingState) {
                      return Center(
                        child: DefaultLoading(),
                      );
                    }
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        return userItem(context.read<HomeCubit>().uInG[index]);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox();
                      },
                      itemCount: context.read<HomeCubit>().uInG.length,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget userItem(User user) => Container(
        padding: const EdgeInsetsDirectional.all(16.0),
        margin: const EdgeInsetsDirectional.all(4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: ColorManager.primary.withOpacity(.3),
        ),
        child: Row(
          children: [
            const Text(
              'UID: ',
            ),
            Text(
              '${user.userId}',
              style: getBoldStyle(
                color: ColorManager.black,
              ),
            ),
            const SizedBox(
              width: 15.0,
            ),
            const Text('U-Name: '),
            Text(
              '${user.userName}',
              style: getBoldStyle(color: ColorManager.black),
            ),
          ],
        ),
      );
}
