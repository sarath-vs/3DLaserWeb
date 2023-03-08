// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:laser_tech_app/domain/models/login/refresh_model.dart';
import '../../domain/employee_data/employee_data_manager.dart';
import '../../domain/log/custom_log.dart';
import '../../domain/models/login/login_facade.dart';
import '../../domain/models/login/login_model.dart';
import '../../domain/remote/connectivity/internet_connectivity.dart';
import '../../domain/remote/dioman.dart';
import '../../domain/remote/exceptions/network_exceptions.dart';
import '../../domain/remote/url/url_pool.dart';

@LazySingleton(as: AuthFacade)
class AuthImpl implements AuthFacade {
  final EmployeeDataManager _employeeDataManager;
  final URLPool _url;

  final InternetConnectivity _internetConnectivity;

  AuthImpl(
    this._employeeDataManager,
    this._url,
    this._internetConnectivity,
  );

  @override
  Future<Either<NetworkExceptions, LoginModel>> loginWithUsernameAndPassword({
    required String username,
    required String password,
  }) async {
    if (await _internetConnectivity.isNotConnectedToInternet()) {
      return left(const NoInternet());
    }

    final _body = {
      "email": username,
      "password": password,
    };

    final result = await Postman.sendPostRequestNoAuth(
      _url.login,
      _body,
    );
    customLog(result.body);
    if (result.statusCode == 200) {
      final data =
          LoginModel.fromJson(jsonDecode(result.body) as Map<String, dynamic>);
      _employeeDataManager.saveAccess(data.access!);
      _employeeDataManager.saveRefresh(data.refresh!);

      return right(data);
    } else {
      return left(getExceptionFromStatusCode(result.statusCode));
    }
  }

  @override
  Future<bool> isUserAuthenticated() async {
    final _employeeID = await _employeeDataManager.getAccess();
    return _employeeID != null && _employeeID.isNotEmpty;
  }

  @override
  Future<bool> logOut() {
    _employeeDataManager.clear();
    return _employeeDataManager.clear();
  }

  @override
  Future<Either<NetworkExceptions, RefreshTockenModel>> refreshTocken(
      {required String refresh}) async {
    if (await _internetConnectivity.isNotConnectedToInternet()) {
      return left(const NoInternet());
    }

    final _body = {"refresh": refresh};
    customLog(refresh);
    final result = await Postman.sendPostRequestNoAuth(
      _url.refreshTocken,
      _body,
    );
    customLog(result.body);

    if (result.statusCode == 200) {
      final data = RefreshTockenModel.fromJson(
          jsonDecode(result.body) as Map<String, dynamic>);

      return right(data);
    } else {
      return left(getExceptionFromStatusCode(result.statusCode));
    }
  }
}
