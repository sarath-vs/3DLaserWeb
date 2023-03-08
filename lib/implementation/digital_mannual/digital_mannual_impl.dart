// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:laser_tech_app/domain/models/digital_mammual/mannual_detail_model.dart';
import 'package:laser_tech_app/domain/models/digital_mammual/model.dart';
import 'package:laser_tech_app/domain/models/init_quality_check/answer_status_model.dart';
import 'package:laser_tech_app/domain/models/init_quality_check/product_name_model.dart';
import 'package:laser_tech_app/domain/models/init_quality_check/product_type_model.dart';
import 'package:laser_tech_app/domain/models/init_quality_check/product_entry_model.dart';
import '../../domain/employee_data/employee_data_manager.dart';
import '../../domain/log/custom_log.dart';
import '../../domain/models/digital_mammual/facade.dart';
import '../../domain/models/init_quality_check/int_quality_check_facade.dart';
import '../../domain/remote/connectivity/internet_connectivity.dart';
import '../../domain/remote/dioman.dart';
import '../../domain/remote/exceptions/network_exceptions.dart';
import '../../domain/remote/url/url_pool.dart';

@LazySingleton(as: DigitalMannualFacade)
class DigitalMannualmpl implements DigitalMannualFacade {
  final EmployeeDataManager _employeeDataManager;
  final URLPool _url;

  final InternetConnectivity _internetConnectivity;

  DigitalMannualmpl(
    this._employeeDataManager,
    this._url,
    this._internetConnectivity,
  );

  // @override
  // Future<Either<NetworkExceptions, ProductNameModel>> getproductName() async {
  //   String? access = await _employeeDataManager.getRefresh();
  //   final result = await Postman.sendGetRequest(_url.getProductname, access!);
  //   if (result.statusCode == 200) {
  //     final data = ProductNameModel.fromJson(
  //         jsonDecode(result.body) as Map<String, dynamic>);
  //     customLog(result.body);
  //     return right(data);
  //   } else {
  //     return left(getExceptionFromStatusCode(result.statusCode));
  //   }
  // }

  @override
  Future<Either<NetworkExceptions, DigitalMannualListModel>>
      getDigitalMannualList() async {
    String? access = await _employeeDataManager.getRefresh();
    final result =
        await Postman.sendGetRequest(_url.getDigitalMannualList, access!);
    if (result.statusCode == 200) {
      final data = DigitalMannualListModel.fromJson(
          jsonDecode(result.body) as Map<String, dynamic>);
      customLog(result.body);
      return right(data);
    } else {
      return left(getExceptionFromStatusCode(result.statusCode));
    }
  }

  @override
  Future<Either<NetworkExceptions, MannualDetailModel>> getDigitalMannualDetail(
      {required int id}) async {
    String? access = await _employeeDataManager.getRefresh();
    final result = await Postman.sendGetRequest(
        _url.getDigitalMannualDetail + '$id/', access!);
    if (result.statusCode == 200) {
      final data = MannualDetailModel.fromJson(
          jsonDecode(result.body) as Map<String, dynamic>);
      customLog(result.body);

      return right(data);
    } else {
      return left(getExceptionFromStatusCode(result.statusCode));
    }
  }
}
