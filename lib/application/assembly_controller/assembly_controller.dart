import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:laser_tech_app/domain/log/custom_log.dart';
import 'package:laser_tech_app/domain/models/products/questionModel.dart';
import '../../domain/employee_data/employee_data_manager.dart';
import '../../domain/models/assembly_product/assembly_facade.dart';
import '../../domain/models/products/get_question_details_model.dart';
import '../../domain/models/products/quality_products_model.dart';
import '../../domain/remote/exceptions/network_exceptions.dart';
import '../../main.dart';
import '../../presentation/widgets/circular_progress_dialog.dart';
import '../../presentation/widgets/single_button_alert_dialog.dart';

@injectable
class AssemblyProductController extends GetxController {
  final AssemblyProductFacade _assemblyProductFacade;
  final EmployeeDataManager _employeeDataManager;

  AssemblyProductController(
      this._assemblyProductFacade, this._employeeDataManager);

  String get assemblyProductID => 'assemblyProductID';


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
    update([assemblyProductID]);
  }

  
  


  Future<void> getAssemblyProducts() async {
    showCircularProgressDialog(msg: 'Loading');
    final result = await _assemblyProductFacade.getAssemblyProduct();
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
      update([assemblyProductID]);
    });
  }
Future<void> saveAssemblyProduct(
      {required String name, required String discription,required String time,required String ip,required String port, required String printerData,required bool genQr,required bool finalAssembly}) async {
    showCircularProgressDialog(msg: 'Saving');
    final result = await _assemblyProductFacade.saveAssemblyProduct(
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
      update([assemblyProductID]);
    });
  }
   Future<void> deleteAssemblyProduct({
    required int id,
  }) async {
    showCircularProgressDialog(msg: 'Deleting');
    final result = await _assemblyProductFacade.deleteAssemblyProduct(id: id);
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
      update([assemblyProductID]);
    });
  }


    Future<void> putAssemblyProducts({required int id, required String name, required String description,required String time,required String ip,required String port, required String printerData}
      ) async {
    showCircularProgressDialog(msg: 'Loading');
    final result = await _assemblyProductFacade.putAssemblyProduct(id: id, name: name, description: description, time: time, ip: ip, port: port, printerData: printerData);
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
      update([assemblyProductID]);
    });

   
  }

    Future<void> getAssemblyQuestions({required int id}) async {
    showCircularProgressDialog(msg: 'Loading');
    final result = await _assemblyProductFacade.getAssemblyQuestions(id: id);
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
      update([assemblyProductID]);
    });
  }

   Future<void> postQualityQuestions(
      {required Map<String, Object?> dataToSend}) async {
    showCircularProgressDialog(msg: 'Loading');
    final result = await _assemblyProductFacade.postAssemblyQuestions(
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
      update([assemblyProductID]);
    });
  }
 Future<void> deleteQualityQuestions({required int id}) async {
    showCircularProgressDialog(msg: 'Loading');
    final result = await _assemblyProductFacade.deleteAssemblyQuestions(id: id);
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
      update([assemblyProductID]);
    });
  }





  

   
}
