// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:laser_tech_app/domain/models/init_quality_check/answer_status_model.dart';
import 'package:laser_tech_app/domain/models/init_quality_check/product_name_model.dart';
import 'package:laser_tech_app/domain/models/init_quality_check/product_type_model.dart';
import 'package:laser_tech_app/domain/models/init_quality_check/product_entry_model.dart';
import '../../domain/employee_data/employee_data_manager.dart';
import '../../domain/log/custom_log.dart';
import '../../domain/models/init_quality_check/int_quality_check_facade.dart';
import '../../domain/remote/connectivity/internet_connectivity.dart';
import '../../domain/remote/dioman.dart';
import '../../domain/remote/exceptions/network_exceptions.dart';
import '../../domain/remote/url/url_pool.dart';

@LazySingleton(as: InitialQualityCheckFacade)
class InitQualityImpl implements InitialQualityCheckFacade {
  final EmployeeDataManager _employeeDataManager;
  final URLPool _url;

  final InternetConnectivity _internetConnectivity;

  InitQualityImpl(
    this._employeeDataManager,
    this._url,
    this._internetConnectivity,
  );

  @override
  Future<Either<NetworkExceptions, ProductNameModel>> getproductName() async {
    String? access = await _employeeDataManager.getRefresh();
    final result = await Postman.sendGetRequest(_url.getProductname, access!);
    if (result.statusCode == 200) {
      final data = ProductNameModel.fromJson(
          jsonDecode(result.body) as Map<String, dynamic>);

      return right(data);
    } else {
      return left(getExceptionFromStatusCode(result.statusCode));
    }
  }

  @override
  Future<Either<NetworkExceptions, ProductTypeModel>> getProductType(
      {required String id}) async {
    String? access = await _employeeDataManager.getRefresh();
    final result = await Postman.sendGetRequest(
        _url.getProductType + '?category_id=$id', access!);
    if (result.statusCode == 200) {
      final data = ProductTypeModel.fromJson(
          jsonDecode(result.body) as Map<String, dynamic>);

      return right(data);
    } else {
      return left(getExceptionFromStatusCode(result.statusCode));
    }
  }

  @override
  Future<Either<NetworkExceptions, ProductEntryModel>> getQuestions(
      {required String product_subcategory,
      required String sl_no,
      required String size,
      required String manufacture_name}) async {
    String? access = await _employeeDataManager.getRefresh();

    final result = await Postman.sendGetRequest(
        _url.getQuestions +
            '?subcategory_id=$product_subcategory&sl_no=$sl_no&manufacture_name=$manufacture_name&size=$size',
        access!);
    if (result.statusCode == 200) {
      customLog("---json${result.body}");
      final data = ProductEntryModel.fromJson(
          jsonDecode(result.body) as Map<String, dynamic>);
      customLog("---data${data}");

      return right(data);
    } else {
      customLog(result.statusCode);
      return left(getExceptionFromStatusCode(result.statusCode));
    }
  }

  @override
  Future<Either<NetworkExceptions, AnswerStatusModel>> saveAnswer(
      {required int id, required bool answer}) async {
    String? access = await _employeeDataManager.getRefresh();
    final _body = {
      "answer": answer,
      "answer_language_code": "EN",
      "question_id": id,
    };
    final result =
        await Postman.sendPostRequest(_url.saveAnswer, _body, access!);
    if (result.statusCode == 200) {
      final data = AnswerStatusModel.fromJson(
          jsonDecode(result.body) as Map<String, dynamic>);
      customLog(data.status!);
      return right(data);
    } else {
      customLog('Error occured${result.statusCode}');

      return left(getExceptionFromStatusCode(result.statusCode));
    }
  }
}
