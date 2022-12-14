import 'package:file_manager/app/di/injector.dart%20';
import 'package:file_manager/app/utilities/global_components/default_button.dart';
import 'package:file_manager/features/home/presentation/cubit/home_cubit/home-cubit.dart';
import 'package:file_manager/features/home/presentation/cubit/home_cubit/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocProvider(
        create: (context) => injector<HomeCubit>(),
        child: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            print(state.runtimeType);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  DefaultButton(
                    function: () {
                      context
                          .read<HomeCubit>()
                          .createGroup(grpName: 'Software Engineering');
                    },
                    text: 'Create Group',
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
