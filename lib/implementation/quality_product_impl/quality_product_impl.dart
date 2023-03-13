// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:laser_tech_app/domain/models/products/quality_product_facade.dart';
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
      {required String name, required String description}) async {
    String? access = await _employeeDataManager.getRefresh();
    final _body = {
      "name": name,
      "description": description,
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
}