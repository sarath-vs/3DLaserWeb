// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:laser_tech_app/application/auth_controller/auth_controller.dart'
    as _i15;
import 'package:laser_tech_app/application/home_screen_controller/controller.dart'
    as _i8;
import 'package:laser_tech_app/domain/employee_data/employee_data_manager.dart'
    as _i7;
import 'package:laser_tech_app/domain/models/digital_mammual/facade.dart'
    as _i13;
import 'package:laser_tech_app/domain/models/init_quality_check/int_quality_check_facade.dart'
    as _i9;
import 'package:laser_tech_app/domain/models/login/login_facade.dart' as _i11;
import 'package:laser_tech_app/domain/remote/connectivity/internet_connectivity.dart'
    as _i4;
import 'package:laser_tech_app/domain/remote/url/url_pool.dart' as _i6;
import 'package:laser_tech_app/implementation/auth/auth_impl.dart' as _i12;
import 'package:laser_tech_app/implementation/digital_mannual/digital_mannual_impl.dart'
    as _i14;
import 'package:laser_tech_app/implementation/init_quality_check_impl/init_quality_impl.dart'
    as _i10;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import '../modules/modules.dart' as _i16;
import '../remote/connectivity/internet_connectivity.dart' as _i17;

const String _prod = 'prod';
const String _dev = 'dev';

// ignore_for_file: unnecessary_lambdas
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
    final connectivityModule = _$ConnectivityModule();
    final modules = _$Modules();
    gh.singleton<_i3.Connectivity>(connectivityModule.connectivity);
    gh.singleton<_i4.InternetConnectivity>(
        _i4.InternetConnectivity(gh<_i3.Connectivity>()));
    await gh.singletonAsync<_i5.SharedPreferences>(
      () => modules.sharedPreferences,
      preResolve: true,
    );
    gh.singleton<_i6.URLPool>(
      _i6.URLPool(),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.singleton<_i7.EmployeeDataManager>(
        _i7.EmployeeDataManager(gh<_i5.SharedPreferences>()));
    gh.factory<_i8.HomeScreenController>(
        () => _i8.HomeScreenController(gh<_i7.EmployeeDataManager>()));
    gh.lazySingleton<_i9.InitialQualityCheckFacade>(() => _i10.InitQualityImpl(
          gh<_i7.EmployeeDataManager>(),
          gh<_i6.URLPool>(),
          gh<_i4.InternetConnectivity>(),
        ));
    gh.lazySingleton<_i11.AuthFacade>(() => _i12.AuthImpl(
          gh<_i7.EmployeeDataManager>(),
          gh<_i6.URLPool>(),
          gh<_i4.InternetConnectivity>(),
        ));
    gh.lazySingleton<_i13.DigitalMannualFacade>(() => _i14.DigitalMannualmpl(
          gh<_i7.EmployeeDataManager>(),
          gh<_i6.URLPool>(),
          gh<_i4.InternetConnectivity>(),
        ));
    gh.factory<_i15.AuthController>(() => _i15.AuthController(
          gh<_i11.AuthFacade>(),
          gh<_i7.EmployeeDataManager>(),
        ));
    return this;
  }
}

class _$Modules extends _i16.Modules {}

class _$ConnectivityModule extends _i17.ConnectivityModule {}
