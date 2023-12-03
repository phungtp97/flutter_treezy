// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:flutter_treezy/blocs/app/app_bloc.dart' as _i18;
import 'package:flutter_treezy/blocs/feed/feed_bloc.dart' as _i5;
import 'package:flutter_treezy/blocs/history/history_bloc.dart' as _i6;
import 'package:flutter_treezy/blocs/home/home_bloc.dart' as _i7;
import 'package:flutter_treezy/blocs/map/map_bloc.dart' as _i8;
import 'package:flutter_treezy/blocs/plan_new/plan_new_bloc.dart' as _i9;
import 'package:flutter_treezy/blocs/profile/profile_bloc.dart' as _i10;
import 'package:flutter_treezy/blocs/splash/splash_bloc.dart' as _i12;
import 'package:flutter_treezy/core/service/connectivity_service.dart' as _i3;
import 'package:flutter_treezy/core/service/tracker_service.dart' as _i13;
import 'package:flutter_treezy/data/api/networking_service.dart' as _i19;
import 'package:flutter_treezy/data/repository/iml/user_repository_iml.dart'
    as _i15;
import 'package:flutter_treezy/data/repository/repository.dart' as _i14;
import 'package:flutter_treezy/local/local.dart' as _i11;
import 'package:flutter_treezy/main.dart' as _i20;
import 'package:flutter_treezy/pages/home/home_page.dart' as _i17;
import 'package:flutter_treezy/ui.dart' as _i16;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart'
    as _i2; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerService = _$RegisterService();
    gh.singleton<_i3.ConnectivityService>(
      _i3.ConnectivityService(),
      dispose: (i) => i.dispose(),
    );
    await gh.singletonAsync<_i4.Dio>(
      () => registerService.userDio,
      instanceName: 'userDio',
      preResolve: true,
    );
    gh.singleton<_i4.Dio>(
      registerService.publicDio,
      instanceName: 'publicDio',
    );
    gh.factory<_i5.FeedBloc>(() => _i5.FeedBloc());
    gh.factory<_i6.HistoryBloc>(() => _i6.HistoryBloc());
    gh.factory<_i7.HomeBloc>(() => _i7.HomeBloc());
    gh.factory<_i8.MapBloc>(() => _i8.MapBloc());
    gh.factory<_i9.Plan_newBloc>(() => _i9.Plan_newBloc());
    gh.factory<_i10.ProfileBloc>(() => _i10.ProfileBloc());
    await gh.singletonAsync<_i11.SharedPrefService>(
      () => registerService.prefs,
      preResolve: true,
    );
    gh.factory<_i12.SplashBloc>(() => _i12.SplashBloc());
    gh.factory<String>(
      () => registerService.trackerId,
      instanceName: 'trackerId',
    );
    gh.factory<String>(
      () => registerService.env,
      instanceName: 'env',
    );
    gh.factory<String>(
      () => registerService.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.singleton<_i13.TrackerConfiguration>(_i13.TrackerConfiguration(
      trackerId: gh<String>(instanceName: 'trackerId'),
      env: gh<String>(instanceName: 'env'),
    ));
    gh.singleton<_i14.UserRepository>(_i15.UserRepositoryIml());
    gh.factory<_i16.Widget>(
      () => _i17.HomePage(),
      instanceName: '/home',
    );
    gh.singleton<_i18.AppBloc>(
      _i18.AppBloc(gh<_i11.SharedPrefService>()),
      dispose: (i) => i.dispose(),
    );
    gh.singleton<_i19.NetworkingService>(_i19.NetworkingService(
      prefServices: gh<_i11.SharedPrefService>(),
      baseUrl: gh<String>(instanceName: 'baseUrl'),
      userDio: gh<_i4.Dio>(instanceName: 'userDio'),
      publicDio: gh<_i4.Dio>(instanceName: 'publicDio'),
    ));
    return this;
  }
}

class _$RegisterService extends _i20.RegisterService {}
