import 'package:file_manager/app/resources/routes_manager.dart';
import 'package:file_manager/app/resources/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/home/presentation/cubit/home_cubit/home-cubit.dart';
import 'di/injector.dart ';

class MyApp extends StatefulWidget {
  // named Constructor

  const MyApp._internal();

  static const MyApp _instance =
      MyApp._internal(); // Singleton or Single Instance.

  factory MyApp() => _instance; //factory

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => injector<HomeCubit>()..getGroups(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.splashRoute,
        theme: getApplicationTheme(),
      ),
    );
  }
}
