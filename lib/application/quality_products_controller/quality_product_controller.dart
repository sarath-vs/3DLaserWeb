import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:laser_tech_app/domain/log/custom_log.dart';
import 'package:laser_tech_app/domain/models/products/questionModel.dart';
import 'package:laser_tech_app/domain/models/products/save_quality_product_model.dart';
import 'package:laser_tech_app/presentation/03_Screen_home/widgets/qualitycontrol_questions.dart';

import '../../domain/employee_data/employee_data_manager.dart';

import '../../domain/models/products/quality_product_facade.dart';
import '../../domain/models/products/quality_products_model.dart';
import '../../domain/remote/exceptions/network_exceptions.dart';
import '../../main.dart';

import '../../presentation/widgets/circular_progress_dialog.dart';
import '../../presentation/widgets/single_button_alert_dialog.dart';

@injectable
class QualityProductController extends GetxController {
  final QualityProductFacade _qualityProductFacade;
  final EmployeeDataManager _employeeDataManager;

  QualityProductController(
      this._qualityProductFacade, this._employeeDataManager);

  String get qualityProductID => 'qualityProductID';
  String get qualityQuestionID => 'qualityQuestionID';

  List<QualityProductResult> qualityProductList = [];
  List<QuestionResult> qualityQuestionList = [];

  String name = '';
  int productId = 0;
  Future<void> getQualityProducts() async {
    showCircularProgressDialog(msg: 'Signing in');
    final result = await _qualityProductFacade.getQualityProduct();
    Navigator.of(navigatorKey.currentContext!).pop();
    result.fold((NetworkExceptions exp) {
      return showSingleButtonAlertDialog(
        Get.context!,
        'Warning',
        getMessageFromException(exp),
        () {
          Navigator.of(Get.context!).pop();
        },
      );
    }, (QualtyProductListModel resp) async {
      qualityProductList.clear();
      qualityProductList.addAll(resp.results!);
      customLog(qualityProductList);
      update([qualityProductID]);
    });
  }

  Future<void> saveQualityQuestions(
      {required String name, required String discription}) async {
    showCircularProgressDialog(msg: 'Signing in');
    final result = await _qualityProductFacade.saveQualityProduct(
        name: name, description: discription);
    Navigator.of(navigatorKey.currentContext!).pop();
    result.fold((NetworkExceptions exp) {
      return showSingleButtonAlertDialog(
        Get.context!,
        'Warning',
        getMessageFromException(exp),
        () {
          Navigator.of(Get.context!).pop();
        },
      );
    }, (String resp) async {
      //qualityProductList.clear();
      // qualityProductList.addAll(resp);
      name = resp;
      customLog(resp);
      update([qualityProductID]);
    });
  }

  // Future<void> editQualityProduct({
  //   required int id,
  // }) async {
  //   showCircularProgressDialog(msg: 'Signing in');
  //   final result = await _qualityProductFacade.editQualityProduct(id: id);
  //   Navigator.of(navigatorKey.currentContext!).pop();
  //   result.fold((NetworkExceptions exp) {
  //     return showSingleButtonAlertDialog(
  //       Get.context!,
  //       'Warning',
  //       getMessageFromException(exp),
  //       () {
  //         Navigator.of(Get.context!).pop();
  //       },
  //     );
  //   }, (String resp) async {
  //     //qualityProductList.clear();
  //     // qualityProductList.addAll(resp);
  //     name = resp;
  //     customLog(resp);
  //     update([qualityProductID]);
  //   });
  // }

  Future<void> deleteQualityProduct({
    required int id,
  }) async {
    showCircularProgressDialog(msg: 'Signing in');
    final result = await _qualityProductFacade.deleteQualityProduct(id: id);
    Navigator.of(navigatorKey.currentContext!).pop();
    result.fold((NetworkExceptions exp) {
      return showSingleButtonAlertDialog(
        Get.context!,
        'Warning',
        getMessageFromException(exp),
        () {
          Navigator.of(Get.context!).pop();
        },
      );
    }, (String resp) async {
      //qualityProductList.clear();
      // qualityProductList.addAll(resp);
      name = resp;
      customLog(resp);
      update([qualityProductID]);
    });
  }

  Future<void> getQualityQuestions({required int id}) async {
    showCircularProgressDialog(msg: 'Signing in');
    final result = await _qualityProductFacade.getQualityQuestions(id: id);
    Navigator.of(navigatorKey.currentContext!).pop();
    result.fold((NetworkExceptions exp) {
      return showSingleButtonAlertDialog(
        Get.context!,
        'Warning',
        getMessageFromException(exp),
        () {
          Navigator.of(Get.context!).pop();
        },
      );
    }, (QualityProductQuestionModel resp) async {
      qualityQuestionList.clear();
      qualityQuestionList.addAll(resp.data!);
      customLog(qualityProductList);
      update([qualityQuestionID]);
    });
  }

  Future<void> deleteQualityQuestions({required int id}) async {
    showCircularProgressDialog(msg: 'Signing in');
    final result = await _qualityProductFacade.deleteQualityQuestions(id: id);
    Navigator.of(navigatorKey.currentContext!).pop();
    result.fold((NetworkExceptions exp) {
      return showSingleButtonAlertDialog(
        Get.context!,
        'Warning',
        getMessageFromException(exp),
        () {
          Navigator.of(Get.context!).pop();
        },
      );
    }, (String resp) async {
      // qualityQuestionList.clear();
      // qualityQuestionList.addAll(resp.data!);
      customLog(resp);
      update([qualityQuestionID]);
    });
  }

  Future<void> postQualityQuestions(
      {required Map<String, Object?> dataToSend}) async {
    showCircularProgressDialog(msg: 'Signing in');
    final result = await _qualityProductFacade.postQualityQuestions(
        dataToSend: dataToSend);
    Navigator.of(navigatorKey.currentContext!).pop();
    result.fold((NetworkExceptions exp) {
      return showSingleButtonAlertDialog(
        Get.context!,
        'Warning',
        getMessageFromException(exp),
        () {
          Navigator.of(Get.context!).pop();
        },
      );
    }, (String resp) async {
      // qualityQuestionList.clear();
      // qualityQuestionList.addAll(resp.data!);
      customLog(resp);
      update([qualityQuestionID]);
    });
  }
}
