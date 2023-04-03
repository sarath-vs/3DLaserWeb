// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:laser_tech_app/domain/models/assembly_product/assembly_facade.dart';
import 'package:laser_tech_app/domain/models/products/get_question_details_model.dart';
import '../../domain/employee_data/employee_data_manager.dart';
import '../../domain/log/custom_log.dart';

import '../../domain/models/products/quality_products_model.dart';
import '../../domain/models/products/questionModel.dart';
import '../../domain/models/products/save_quality_product_model.dart';
import '../../domain/remote/dioman.dart';
import '../../domain/remote/exceptions/network_exceptions.dart';
import '../../domain/remote/url/url_pool.dart';

@LazySingleton(as: AssemblyProductFacade)
class AssemblyProductImpl implements AssemblyProductFacade {
  final EmployeeDataManager _employeeDataManager;
  final URLPool _url;

  AssemblyProductImpl(
    this._employeeDataManager,
    this._url,
  );

  @override
  Future<Either<NetworkExceptions, QualtyProductListModel>>
      getAssemblyProduct() async {
    String? access = await _employeeDataManager.getRefresh();
    final result =
        await Postman.sendGetRequest(_url.assemblyDetails, access!);
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
  Future<Either<NetworkExceptions, String>> saveAssemblyProduct(
    {required String name,
     required String description, 
     required String time,
      required String ip, 
      required String port, 
      required String printerData})  async {
    String? access = await _employeeDataManager.getRefresh();
    final _body = {
      "name": name,
      "description": description,
      "time_limit": time,
      "ip_address":ip,
      "port":port,
      "product_obj":{"zebraData":printerData},

    };

    final result =
        await Postman.sendPostRequest(_url.assemblyDetails, _body, access);
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
  Future<Either<NetworkExceptions, String>> deleteAssemblyProduct({required int id}) async {
    String? access = await _employeeDataManager.getRefresh();

    final result = await Postman.sendDeleteRequest(
        _url.assemblyDetails + '$id/', access!);
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
  Future<Either<NetworkExceptions, String>> putAssemblyProduct(
    {required int id,
     required String name, 
     required String description, 
     required String time, 
     required String ip, 
     required String port, 
     required String printerData}) async {
    String? access = await _employeeDataManager.getRefresh();
    final _body = {
      "name": name,
      "description": description,
      "time_limit": time,
      "ip_address":ip,
      "port":port,
    "product_obj":{"zebraData":printerData},
    };

    final result =
        await Postman.sendPutRequest(_url.assemblyDetails+'$id/', _body, access);
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
  
  @override
  Future<Either<NetworkExceptions, QualityProductQuestionModel>> getAssemblyQuestions({required int id})  async {
    String? access = await _employeeDataManager.getRefresh();
    final result = await Postman.sendGetRequest(
        _url.assemblyQuestionDetails + '?assembly_category_id=$id', access!);
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
  Future<Either<NetworkExceptions, String>> postAssemblyQuestions(
      {required Map<String, Object?> dataToSend}) async {
    String? access = await _employeeDataManager.getRefresh();

    final result = await Postman.sendPostRequest(
        _url.assemblyQuestionDetails, dataToSend, access);
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

 





    
  
    
  
}
