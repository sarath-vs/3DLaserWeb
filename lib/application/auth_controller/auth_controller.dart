import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:laser_tech_app/domain/log/custom_log.dart';
import 'package:laser_tech_app/presentation/widgets/snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/employee_data/employee_data_manager.dart';
import '../../domain/models/login/login_facade.dart';
import '../../domain/models/login/login_model.dart';
import '../../domain/models/login/refresh_model.dart';
import '../../domain/remote/exceptions/network_exceptions.dart';
import '../../main.dart';
import '../../presentation/01_Screen_splash/screen_splash.dart';
import '../../presentation/03_Screen_home/screen_home.dart';
import '../../presentation/widgets/circular_progress_dialog.dart';
import '../../presentation/widgets/single_button_alert_dialog.dart';

@injectable
class AuthController extends GetxController {
  final AuthFacade _authFacade;
  final EmployeeDataManager _employeeDataManager;

  AuthController(this._authFacade, this._employeeDataManager);

  Future<void> login(String username, String password) async {
    showCircularProgressDialog(msg: 'Signing in');
    final result = await _authFacade.loginWithUsernameAndPassword(
      username: username,
      password: password,
    );
    Navigator.of(navigatorKey.currentContext!).pop();
    result.fold((NetworkExceptions exp) {
      return showSingleButtonAlertDialog(
        Get.context!,
        'Warning',
        getMessageFromException(exp),
        () {
          Navigator.of(Get.context!).pop();
        },
      );
    }, (LoginModel resp) async {
      Navigator.of(navigatorKey.currentContext!)
          .pushReplacementNamed(ScreenHome.routeName);
    });
  }

  Future<void> refreshTocken() async {
    showCircularProgressDialog(msg: 'Refreshing');
    final refreshTocken = await _employeeDataManager.getRefresh();
    customLog('--->>>RT${refreshTocken.toString()}');
    final result = await _authFacade.refreshTocken(refresh: refreshTocken!);
    Navigator.of(navigatorKey.currentContext!).pop();
    result.fold((NetworkExceptions exp) {
      return showSingleButtonAlertDialog(
        Get.context!,
        'Warning',
        getMessageFromException(exp),
        () {
          Navigator.of(Get.context!).pop();
        },
      );
    }, (RefreshTockenModel resp) {
      _employeeDataManager.saveAccess(resp.access!);
      _employeeDataManager.saveRefresh(resp.refresh!);
      showSnackBar(message: 'Tocken Updated');
    });
  }

  Future<bool> authCheckRequested() async {
    return _authFacade.isUserAuthenticated();
  }

  Future<void> logOut() async {
    Navigator.of(navigatorKey.currentContext!).pushNamedAndRemoveUntil(
      ScreenSplash.routeName,
      (route) => false,
    );
    Get.deleteAll();
    initializeGetxController();

    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
