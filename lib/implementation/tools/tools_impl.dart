// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:file_picker/file_picker.dart';
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

  @override
  Future<Either<NetworkExceptions, String>> saveToolsDetail(
      {required String name,
      required String image_base_64,
      required String description}) async {
    String? access = await _employeeDataManager.getRefresh();
    final _body = {
      "name": name,
      "image_base_64": image_base_64,
      "description": description,
    };

    final result = await Postman.sendPostRequest(_url.saveTools, _body, access);

    if (result.statusCode == 201) {
      // final data =
      //     ToolsModel.fromJson(jsonDecode(result.body) as Map<String, dynamic>);

      customLog('--->>>');
      customLog(result.statusCode);

      return right(result.statusCode.toString());
    } else {
      print('${result.statusCode}');
      return left(getExceptionFromStatusCode(result.statusCode));
    }
  }

  @override
  Future<Either<NetworkExceptions, String>> deleteTool(
      {required int id}) async {
    String? access = await _employeeDataManager.getRefresh();

    final result =
        await Postman.sendDeleteRequest(_url.deleteTools + '$id/', access!);
    if (result.statusCode == 204) {
      // final data = SaveQualtyProductModel.fromJson(
      //     jsonDecode(result.body) as Map<String, dynamic>);
      customLog('--->>>');
      customLog(result.statusCode);

      return right(result.statusCode.toString());
    } else {
      print('${result.statusCode}');
      return left(getExceptionFromStatusCode(result.statusCode));
    }
  }
}
