// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:laser_tech_app/domain/models/answered_product_list/answered_product_list_model.dart';
import 'package:laser_tech_app/domain/models/tools_model/tools_model.dart';
import '../../domain/employee_data/employee_data_manager.dart';
import '../../domain/log/custom_log.dart';
import '../../domain/models/answered_product_list/answered_product_facade.dart';
import '../../domain/models/tools_model/tools_facade.dart';
import '../../domain/remote/connectivity/internet_connectivity.dart';
import '../../domain/remote/dioman.dart';
import '../../domain/remote/exceptions/network_exceptions.dart';
import '../../domain/remote/url/url_pool.dart';

@LazySingleton(as: AnsweredProductFacade)
class AnsweredProductImpl implements AnsweredProductFacade {
  final EmployeeDataManager _employeeDataManager;
  final URLPool _url;

  final InternetConnectivity _internetConnectivity;

  AnsweredProductImpl(
    this._employeeDataManager,
    this._url,
    this._internetConnectivity,
  );





  @override
  Future<Either<NetworkExceptions, AnsweredProductListModel>> getAnsweredProductList({required int id})  async {
    String? access = await _employeeDataManager.getRefresh();

    final result =
        await Postman.sendGetRequest(_url.getAnsweredProduct + '?category_id=$id', access!);
    if (result.statusCode == 200) {
      final data = AnsweredProductListModel.fromJson(
          jsonDecode(result.body) as Map<String, dynamic>);
      customLog('--->>>');
      customLog(result.body);

      return right(data);
    } else {
      print('${result.statusCode}');
      return left(getExceptionFromStatusCode(result.statusCode));
    }
  }
}
