import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:laser_tech_app/domain/log/custom_log.dart';
import 'package:laser_tech_app/domain/models/products/get_question_details_model.dart';
import 'package:laser_tech_app/domain/models/products/questionModel.dart';
import 'package:laser_tech_app/domain/models/products/save_quality_product_model.dart';
import 'package:laser_tech_app/presentation/03_Screen_home/widgets/qualitycontrol_questions.dart';
import 'package:laser_tech_app/presentation/widgets/dropdownoption.dart';

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
  static String zplprinterdata = '''^XA
^LH0,0
^FO20,20^BQR,2,5
^FD
Product:[productname],ID:[ID],SerialNumber:[*Don't change here*],Timestamp:[**Don't change here**]
^FS
^XZ''';
  final TextEditingController zplprinterdataController =
      TextEditingController();
  List<QualityProductResult> qualityProductList = [];
  final List<QualityProductResult> _qualityProductListFilter = [];
  List<QuestionResult> qualityQuestionList = [];

  String name = '';

  int productId = 0;

  final RxList<Dropdownoption> formFields = <Dropdownoption>[].obs;
  void addFormFields() {
    formFields.add(Dropdownoption());
  }

  void removeFormField(int index) {
    if (index >= 0 && index < formFields.length) {
      formFields.removeAt(index);
    }
  }

  List<Map<String, String>> getFormValues() {
    final List<Map<String, String>> valuesList = [];

    for (final field in formFields) {
      var englishdropdown = (utf8.encode(field.engController.text)).toString();
      var czechdropdown = (utf8.encode(field.czechController.text)).toString();
      var viatnamdropdown =
          (utf8.encode(field.vitenmController.text)).toString();
      final Map<String, String> values = {
        'english': englishdropdown,
        'czech': czechdropdown,
        'vietnm': viatnamdropdown,
      };
      valuesList.add(values);
    }

    return valuesList;
  }

  bool validateForm() {
    bool isValid = true;
    for (final field in formFields) {
      if (!field.formKey.currentState!.validate()) {
        isValid = false;
      }
    }
    return isValid;
  }
  // var cards = <Widget>[];
  // addcards(Widget value) {
  //   cards.add(value);
  //   update([qualityProductID]);
  // }

  // removecards(int index) {
  //   cards.removeAt(index);
  //   update([qualityProductID]);
  // }

  Future<void> searchDirectory(String query) async {
    if (query.isEmpty || query == '') {
      qualityProductList.clear();
      qualityProductList.addAll(_qualityProductListFilter);
    } else {
      final searchResult = _qualityProductListFilter.where((data) =>
          data.name!.toLowerCase().contains(query.toLowerCase()) ||
          data.id.toString().contains(query));

      qualityProductList.clear();
      qualityProductList = searchResult.toList();
    }
    update([qualityProductID]);
  }

  Future<void> getQualityProducts() async {
    showCircularProgressDialog(msg: 'Loading');
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
      _qualityProductListFilter.clear();
      _qualityProductListFilter.addAll(resp.results!);
      qualityProductList.clear();
      qualityProductList.addAll(resp.results!);
      customLog(qualityProductList);
      update([qualityProductID]);
    });
  }

  Future<void> saveQualityQuestions(
      {required String name,
      required String discription,
      required String time,
      required String ip,
      required String port,
      required String printerData}) async {
    // if (zplprinterdataController.text.isEmpty) {
    //   zplprinterdataController.text = zplprinterdata;
    // }

    showCircularProgressDialog(msg: 'Saving');
    final result = await _qualityProductFacade.saveQualityProduct(
        name: name,
        description: discription,
        time: time,
        ip: ip,
        port: port,
        printerData: printerData);
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
    showCircularProgressDialog(msg: 'Deleting');
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
    showCircularProgressDialog(msg: 'Loading');
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
    showCircularProgressDialog(msg: 'Loading');
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
    showCircularProgressDialog(msg: 'Loading');
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

  Future<void> putQualityProducts(
      {required int id,
      required String name,
      required String description,
      required String time,
      required String ip,
      required String port,
      required String printerData}) async {
    showCircularProgressDialog(msg: 'Loading');
    final result = await _qualityProductFacade.putQualityProduct(
        id: id,
        name: name,
        description: description,
        time: time,
        ip: ip,
        port: port,
        printerData: printerData);
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
      getQualityProducts();
      Get.back();
      // qualityQuestionList.clear();
      // qualityQuestionList.addAll(resp.data!);
      customLog(resp);
      update([qualityQuestionID]);
    });
  }
}
