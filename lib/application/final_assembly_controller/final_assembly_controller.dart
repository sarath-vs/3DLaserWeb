import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:laser_tech_app/domain/log/custom_log.dart';
import 'package:laser_tech_app/domain/models/products/questionModel.dart';
import '../../domain/employee_data/employee_data_manager.dart';
import '../../domain/models/assembly_product/assembly_facade.dart';
import '../../domain/models/final_assembly_product/final_facade.dart';
import '../../domain/models/products/get_question_details_model.dart';
import '../../domain/models/products/quality_products_model.dart';
import '../../domain/remote/exceptions/network_exceptions.dart';
import '../../main.dart';
import '../../presentation/widgets/circular_progress_dialog.dart';
import '../../presentation/widgets/single_button_alert_dialog.dart';

@injectable
class FinalAssemblyController extends GetxController {
  final FinalAssemblyProductFacade _FinalAssemblyProductFacade;
  final EmployeeDataManager _employeeDataManager;

  FinalAssemblyController(
      this._FinalAssemblyProductFacade, this._employeeDataManager);

  String get finalAssemblyProductID => 'finalAssemblyProductID';


  List<QualityProductResult> assemblyProductList = [];
  final List<QualityProductResult> _assemblyProductListFilter =
      [];
  List<QuestionResult> assemblyQuestionList = [];

    

  String name = '';
  int productId = 0;

  Future<void> searchDirectory(String query) async {
    if (query.isEmpty ||
        query == '' ) {
      assemblyProductList.clear();
      assemblyProductList.addAll(_assemblyProductListFilter);
    } else {
      final searchResult = _assemblyProductListFilter.where((data) =>
          data.name!.toLowerCase().contains(query.toLowerCase()) ||
          data.id.toString().contains(query) );

      assemblyProductList.clear();
      assemblyProductList = searchResult.toList();
    }
    update([finalAssemblyProductID]);
  }

  
  


  Future<void> getAssemblyProducts() async {
    showCircularProgressDialog(msg: 'Loading');
    final result = await _FinalAssemblyProductFacade.getFianlAssemblyProduct();
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
      _assemblyProductListFilter.clear();
      _assemblyProductListFilter.addAll(resp.results!);
      assemblyProductList.clear();
      assemblyProductList.addAll(resp.results!);
      customLog(assemblyProductList);
      update([finalAssemblyProductID]);
    });
  }
Future<void> saveAssemblyProduct(
      {required String name, required String discription,required String time,required String ip,required String port, required String printerData,required bool genQr,required bool finalAssembly}) async {
    showCircularProgressDialog(msg: 'Saving');
    final result = await _FinalAssemblyProductFacade.saveAssemblyProduct(
        name: name, description: discription,time: time, ip: ip, port: port, printerData: printerData,genQr: genQr,finalAssembly: finalAssembly);
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
      update([finalAssemblyProductID]);
    });
  }
   Future<void> deleteAssemblyProduct({
    required int id,
  }) async {
    showCircularProgressDialog(msg: 'Deleting');
    final result = await _FinalAssemblyProductFacade.deleteAssemblyProduct(id: id);
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
      update([finalAssemblyProductID]);
    });
  }


    Future<void> putAssemblyProducts({required int id, required String name, required String description,required String time,required String ip,required String port, required String printerData}
      ) async {
    showCircularProgressDialog(msg: 'Loading');
    final result = await _FinalAssemblyProductFacade.putAssemblyProduct(id: id, name: name, description: description, time: time, ip: ip, port: port, printerData: printerData);
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
      getAssemblyProducts();
      Get.back();
      // qualityQuestionList.clear();
      // qualityQuestionList.addAll(resp.data!);
      customLog(resp);
      update([finalAssemblyProductID]);
    });

   
  }

    Future<void> getAssemblyQuestions({required int id}) async {
    showCircularProgressDialog(msg: 'Loading');
    final result = await _FinalAssemblyProductFacade.getAssemblyQuestions(id: id);
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
      assemblyQuestionList.clear();
      assemblyQuestionList.addAll(resp.data!);
      customLog(assemblyQuestionList);
      update([finalAssemblyProductID]);
    });
  }

   Future<void> postQualityQuestions(
      {required Map<String, Object?> dataToSend}) async {
    showCircularProgressDialog(msg: 'Loading');
    final result = await _FinalAssemblyProductFacade.postAssemblyQuestions(
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
      update([finalAssemblyProductID]);
    });
  }
 Future<void> deleteQualityQuestions({required int id}) async {
    showCircularProgressDialog(msg: 'Loading');
    final result = await _FinalAssemblyProductFacade.deleteAssemblyQuestions(id: id);
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
      update([finalAssemblyProductID]);
    });
  }





  

   
}
