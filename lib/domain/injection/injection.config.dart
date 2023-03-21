// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:laser_tech_app/application/ansswered_product_controller/answered_product_controller.dart'
    as _i20;
import 'package:laser_tech_app/application/auth_controller/auth_controller.dart'
    as _i21;
import 'package:laser_tech_app/application/home_screen_controller/controller.dart'
    as _i8;
import 'package:laser_tech_app/application/quality_products_controller/quality_product_controller.dart'
    as _i18;
import 'package:laser_tech_app/application/quality_question_edit_controller/quality_question_edit_controller.dart'
    as _i11;
import 'package:laser_tech_app/application/tools_controller/tools_controller.dart'
    as _i19;
import 'package:laser_tech_app/domain/employee_data/employee_data_manager.dart'
    as _i7;
import 'package:laser_tech_app/domain/models/answered_product_list/answered_product_facade.dart'
    as _i14;
import 'package:laser_tech_app/domain/models/login/login_facade.dart' as _i16;
import 'package:laser_tech_app/domain/models/products/quality_product_facade.dart'
    as _i9;
import 'package:laser_tech_app/domain/models/tools_model/tools_facade.dart'
    as _i12;
import 'package:laser_tech_app/domain/remote/connectivity/internet_connectivity.dart'
    as _i4;
import 'package:laser_tech_app/domain/remote/url/url_pool.dart' as _i6;
import 'package:laser_tech_app/implementation/answered_product_list_impl/answered_product_impl.dart'
    as _i15;
import 'package:laser_tech_app/implementation/auth/auth_impl.dart' as _i17;
import 'package:laser_tech_app/implementation/quality_product_impl/quality_product_impl.dart'
    as _i10;
import 'package:laser_tech_app/implementation/tools/tools_impl.dart' as _i13;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import '../modules/modules.dart' as _i22;
import '../remote/connectivity/internet_connectivity.dart' as _i23;

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
    gh.lazySingleton<_i9.QualityProductFacade>(() => _i10.QualityProductImpl(
          gh<_i7.EmployeeDataManager>(),
          gh<_i6.URLPool>(),
        ));
    gh.factory<_i11.QualityQuestionEditController>(
        () => _i11.QualityQuestionEditController(
              gh<_i9.QualityProductFacade>(),
              gh<_i7.EmployeeDataManager>(),
            ));
    gh.lazySingleton<_i12.ToolsFacade>(() => _i13.ToolsListImpl(
          gh<_i7.EmployeeDataManager>(),
          gh<_i6.URLPool>(),
          gh<_i4.InternetConnectivity>(),
        ));
    gh.lazySingleton<_i14.AnsweredProductFacade>(() => _i15.AnsweredProductImpl(
          gh<_i7.EmployeeDataManager>(),
          gh<_i6.URLPool>(),
          gh<_i4.InternetConnectivity>(),
        ));
    gh.lazySingleton<_i16.AuthFacade>(() => _i17.AuthImpl(
          gh<_i7.EmployeeDataManager>(),
          gh<_i6.URLPool>(),
          gh<_i4.InternetConnectivity>(),
        ));
    gh.factory<_i18.QualityProductController>(
        () => _i18.QualityProductController(
              gh<_i9.QualityProductFacade>(),
              gh<_i7.EmployeeDataManager>(),
            ));
    gh.factory<_i19.ToolsController>(() => _i19.ToolsController(
          gh<_i12.ToolsFacade>(),
          gh<_i7.EmployeeDataManager>(),
        ));
    gh.factory<_i20.AnsweredProductController>(
        () => _i20.AnsweredProductController(gh<_i14.AnsweredProductFacade>()));
    gh.factory<_i21.AuthController>(() => _i21.AuthController(
          gh<_i16.AuthFacade>(),
          gh<_i7.EmployeeDataManager>(),
        ));
    return this;
  }
}

class _$Modules extends _i22.Modules {}

class _$ConnectivityModule extends _i23.ConnectivityModule {}
