import 'package:dio/dio.dart';
import 'package:file_manager/app/di/injector.config.dart';
import 'package:file_manager/app/utilities/constants.dart';
import 'package:file_manager/features/home/data/data_sources/remote/home_service/home_api_service.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../features/home/data/data_sources/remote/auth_service/auth_api_service.dart';

final injector = GetIt.instance;

@InjectableInit()
GetIt init() => injector.init();

@module
abstract class RegisterModule {
  AuthApiService getService(Dio client) => AuthApiService(
        client,
        baseUrl: Constants.baseUrl,
      );

  @lazySingleton
  Dio dio() => Dio(
        BaseOptions(
          connectTimeout: 600000,
          receiveDataWhenStatusError: true,
          receiveTimeout: 600000,
        ),
      );

  HomeApiService getHomeService(Dio client) => HomeApiService(
        client,
        baseUrl: Constants.baseUrl,
      );
}
