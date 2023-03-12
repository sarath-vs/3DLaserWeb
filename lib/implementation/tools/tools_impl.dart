// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:laser_tech_app/domain/models/tools_model/tools_model.dart';
import '../../domain/employee_data/employee_data_manager.dart';
import '../../domain/log/custom_log.dart';
import '../../domain/models/tools_model/tools_facade.dart';
import '../../domain/remote/connectivity/internet_connectivity.dart';
import '../../domain/remote/dioman.dart';
import '../../domain/remote/exceptions/network_exceptions.dart';
import '../../domain/remote/url/url_pool.dart';

@LazySingleton(as: ToolsFacade)
class ToolsListImpl implements ToolsFacade {
  final EmployeeDataManager _employeeDataManager;
  final URLPool _url;

  final InternetConnectivity _internetConnectivity;

  ToolsListImpl(
    this._employeeDataManager,
    this._url,
    this._internetConnectivity,
  );

  @override
  Future<Either<NetworkExceptions, ToolsModel>> getToolsDetail() async {
    String? access = await _employeeDataManager.getRefresh();
    final result = await Postman.sendGetRequest(_url.getToolsList, access!);
    if (result.statusCode == 200) {
      final data =
          ToolsModel.fromJson(jsonDecode(result.body) as Map<String, dynamic>);
      customLog(result.body);

      return right(data);
    } else {
      customLog(result.statusCode);
      return left(getExceptionFromStatusCode(result.statusCode));
    }
  }
}
