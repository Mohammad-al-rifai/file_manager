// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:file_manager/app/di/injector.dart' as _i8;
import 'package:file_manager/features/home/data/data_sources/remote/auth_service/auth_api_service.dart'
    as _i4;
import 'package:file_manager/features/home/data/repositories/auth_repo_impl.dart'
    as _i6;
import 'package:file_manager/features/home/domain/repositories/auth_repo.dart'
    as _i5;
import 'package:file_manager/features/home/presentation/cubit/auth_cubit.dart'
    as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.Dio>(() => registerModule.dio());
    gh.factory<_i4.AuthApiService>(
        () => registerModule.getService(gh<_i3.Dio>()));
    gh.lazySingleton<_i5.AuthRepo>(
        () => _i6.AuthRepoImpl(gh<_i4.AuthApiService>()));
    gh.factory<_i7.AuthCubit>(() => _i7.AuthCubit(gh<_i5.AuthRepo>()));
    return this;
  }
}

class _$RegisterModule extends _i8.RegisterModule {}
