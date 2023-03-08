import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class EmployeeDataManager {
  final SharedPreferences _sharedPreferences;

  final _employeeIDKey = 'tocken';
  final _employeeRefresh = 'refresh';

  EmployeeDataManager(this._sharedPreferences);

  Future<bool> saveAccess(String access) async {
    return _sharedPreferences.setString(_employeeIDKey, access);
  }

  Future<bool> saveRefresh(String refresh) async {
    return _sharedPreferences.setString(_employeeRefresh, refresh);
  }

  Future<String?> getAccess() async {
    return _sharedPreferences.getString(_employeeIDKey);
  }

  Future<String?> getRefresh() async {
    return _sharedPreferences.getString(_employeeRefresh);
  }

  Future<bool> clear() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.clear();
  }
}
