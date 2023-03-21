// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:laser_tech_app/domain/models/products/get_question_details_model.dart';

import 'package:laser_tech_app/domain/models/products/quality_product_facade.dart';
import 'package:laser_tech_app/domain/models/products/questionModel.dart';
import '../../domain/employee_data/employee_data_manager.dart';
import '../../domain/log/custom_log.dart';

import '../../domain/models/products/quality_products_model.dart';
import '../../domain/models/products/save_quality_product_model.dart';
import '../../domain/remote/dioman.dart';
import '../../domain/remote/exceptions/network_exceptions.dart';
import '../../domain/remote/url/url_pool.dart';

@LazySingleton(as: QualityProductFacade)
class QualityProductImpl implements QualityProductFacade {
  final EmployeeDataManager _employeeDataManager;
  final URLPool _url;

  QualityProductImpl(
    this._employeeDataManager,
    this._url,
  );

  @override
  Future<Either<NetworkExceptions, QualtyProductListModel>>
      getQualityProduct() async {
    String? access = await _employeeDataManager.getRefresh();
    final result =
        await Postman.sendGetRequest(_url.getQualityProducts, access!);
    if (result.statusCode == 200) {
      final data = QualtyProductListModel.fromJson(
          jsonDecode(result.body) as Map<String, dynamic>);
      customLog('--->>>');
      customLog(result.body);

      return right(data);
    } else {
      return left(getExceptionFromStatusCode(result.statusCode));
    }
  }

  @override
  Future<Either<NetworkExceptions, String>> saveQualityProduct(
      {required String name, required String description,required String time}) async {
    String? access = await _employeeDataManager.getRefresh();
    final _body = {
      "name": name,
      "description": description,
      "time_limit": time,
    };

    final result =
        await Postman.sendPostRequest(_url.saveQualityProducts, _body, access);
    if (result.statusCode == 201) {
      final data = SaveQualtyProductModel.fromJson(
          jsonDecode(result.body) as Map<String, dynamic>);
      customLog('--->>>');
      customLog(result.body);

      return right(data.name!);
    } else {
      print('${result.statusCode}');
      return left(getExceptionFromStatusCode(result.statusCode));
    }
  }

  

  @override
  Future<Either<NetworkExceptions, String>> deleteQualityProduct(
      {required int id}) async {
    String? access = await _employeeDataManager.getRefresh();

    final result = await Postman.sendDeleteRequest(
        _url.deleteQualityProducts + '/$id/', access!);
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

  @override
  Future<Either<NetworkExceptions, QualityProductQuestionModel>>
      getQualityQuestions({required int id}) async {
    String? access = await _employeeDataManager.getRefresh();
    final result = await Postman.sendGetRequest(
        _url.getQualityQuestions + '?category_id=$id', access!);
    if (result.statusCode == 200) {
      final data = QualityProductQuestionModel.fromJson(
          jsonDecode(result.body) as Map<String, dynamic>);
      customLog('--->>>');
      customLog(result.body);

      return right(data);
    } else {
      return left(getExceptionFromStatusCode(result.statusCode));
    }
  }

  @override
  Future<Either<NetworkExceptions, String>> deleteQualityQuestions(
      {required int id}) async {
    String? access = await _employeeDataManager.getRefresh();
    final result = await Postman.sendDeleteRequest(
        _url.deleteQualityQuestions + '$id/', access!);
    if (result.statusCode == 204) {
      // final data = QualityProductQuestionModel.fromJson(
      //     jsonDecode(result.body) as Map<String, dynamic>);
      customLog('--->>>');
      customLog(result.body);

      return right(result.statusCode.toString());
    } else {
      return left(getExceptionFromStatusCode(result.statusCode));
    }
  }

  @override
  Future<Either<NetworkExceptions, String>> postQualityQuestions(
      {required Map<String, Object?> dataToSend}) async {
    String? access = await _employeeDataManager.getRefresh();

    final result = await Postman.sendPostRequest(
        _url.postQualityQuestions, dataToSend, access);
    if (result.statusCode == 201) {
      // final data = Sting.fromJson(
      //     jsonDecode(result.body) as Map<String, dynamic>);
      customLog('--->>>result.statusCode');
      customLog(result.body);

      return right(result.statusCode.toString());
    } else {
      print('${result.statusCode}');
      return left(getExceptionFromStatusCode(result.statusCode));
    }
  }

  @override
  Future<Either<NetworkExceptions, GetQuestionDetailsModel>> getQuestionDetails({required String id})  async {
    String? access = await _employeeDataManager.getRefresh();
    final result = await Postman.sendGetRequest(
        _url.editQualityQuestions + '$id/', access!);
    if (result.statusCode == 200) {
      final data = GetQuestionDetailsModel.fromJson(
          jsonDecode(result.body) as Map<String, dynamic>);
      customLog('--->>> Question Details');
      customLog(result.body);

      return right(data);
    } else {
      return left(getExceptionFromStatusCode(result.statusCode));
    }}
    
      @override
      Future<Either<NetworkExceptions, String>> putQuestionEdit({required String id,required Map<String, Object?> dataToSend}) async {
    String? access = await _employeeDataManager.getRefresh();
    final result = await Postman.sendPutRequest(_url.editQualityQuestions + '$id/',dataToSend, access);
    if (result.statusCode == 200) {
      // final data = GetQuestionDetailsModel.fromJson(
      //     jsonDecode(result.body) as Map<String, dynamic>);
      customLog('--->>> Question Details');
      customLog(result.body);

      return right(result.body.length.toString());
    } else {
      return left(getExceptionFromStatusCode(result.statusCode));
    }}
    
      @override
      Future<Either<NetworkExceptions, String>> putQualityProduct({required int id, required String name, required String description, required String time})async {
    String? access = await _employeeDataManager.getRefresh();
    final _body = {
      "name": name,
      "description": description,
      "time_limit": time,
    };

    final result =
        await Postman.sendPutRequest(_url.saveQualityProducts+'$id/', _body, access);
    if (result.statusCode == 200) {
      final data = SaveQualtyProductModel.fromJson(
          jsonDecode(result.body) as Map<String, dynamic>);
      customLog('--->>>');
      customLog(result.body);

      return right(data.name!);
    } else {
      print('${result.statusCode}');
      return left(getExceptionFromStatusCode(result.statusCode));
    }
  }
}
