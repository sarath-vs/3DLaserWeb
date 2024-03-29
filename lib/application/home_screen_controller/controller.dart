import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../domain/employee_data/employee_data_manager.dart';

@injectable
class HomeScreenController extends GetxController {
  final EmployeeDataManager _employeeDataManager;

  HomeScreenController(this._employeeDataManager);

  String get screenHomeWidget => 'screenHomeWidget';
  // String screen = 'DashBoard';
  String screen = 'Quality Plan';
  String appBar = '';
  String qualityProductName = '';
  String qualityProductDisc = '';

  Future<void> setHomeScreen(
    String screenS,
  ) async {
    screen = screenS;
    update([screenHomeWidget]);
  }

  Future<void> appBarName(
    String appBarS,
  ) async {
    appBar = appBarS;
    update([screenHomeWidget]);
  }

  // Future<bool> authCheckRequested() async {
  //   return _authFacade.isUserAuthenticated();
  // }
}
