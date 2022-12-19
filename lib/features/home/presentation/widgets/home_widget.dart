import 'package:file_manager/app/di/injector.dart%20';
import 'package:file_manager/app/resources/color_manager.dart';
import 'package:file_manager/app/resources/styles_manager.dart';
import 'package:file_manager/app/resources/values_manager.dart';
import 'package:file_manager/app/utilities/global_components/default_button.dart';
import 'package:file_manager/app/utilities/global_components/default_loading.dart';
import 'package:file_manager/features/home/presentation/cubit/home_cubit/home-cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/home_cubit/home_states.dart';
import '../screens/group_details.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(
      () {
        final maxScroll = scrollController.position.maxScrollExtent;
        final currentScroll = scrollController.position.pixels;

        final HomeCubit homeCubit = context.read<HomeCubit>();

        final state = homeCubit.state;

        if (maxScroll == currentScroll) {
          homeCubit.getGroups();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<HomeCubit>()..getGroups(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          print(state.runtimeType);
          if (state is GetGroupsLoadingState) {
            return Center(
              child: DefaultLoading(),
            );
          }

          if (state is GetGroupsDoneState) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView(
                controller: scrollController,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  mainAxisExtent: 200.0,
                ),
                children: [
                  ...List<Widget>.from(
                    context.read<HomeCubit>().groups.map(
                          (e) => Builder(
                            builder: (context) => GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        GroupDetails(group: e),
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsetsDirectional.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: ColorManager.lightGrey.withOpacity(.5),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      CupertinoIcons.group,
                                      size: AppSize.s60,
                                      color: ColorManager.white,
                                    ),
                                    Text(
                                      e.grpName ?? 'No Name Group',
                                      style: getBoldStyle(
                                        color: ColorManager.primary,
                                        fontSize: AppPadding.p18,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8.0,
                                    ),
                                    Text(
                                      e.grpId.toString() ?? '0 Member',
                                      style: getLightStyle(
                                          color: ColorManager.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                  ),
                ],
              ),
            );
          }

          if (state is GetGroupsErrorState) {
            return Center(
              child: Column(
                children: [
                  const Text('Something Error  try-again'),
                  DefaultButton(
                    text: 'Refresh',
                    function: () {
                      context.read<HomeCubit>().getGroups();
                    },
                  ),
                ],
              ),
            );
          }
          return const SizedBox(
            child: Text('No Data'),
          );
        },
      ),
    );
  }
}
