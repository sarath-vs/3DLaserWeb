// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../domain/employee_data/employee_data_manager.dart';
// import '../../domain/log/custom_log.dart';
// import '../../domain/models/init_quality_check/answer_status_model.dart';
// import '../../domain/models/init_quality_check/int_quality_check_facade.dart';
// import '../../domain/models/init_quality_check/product_entry_model.dart';
// import '../../domain/models/init_quality_check/product_name_model.dart';
// import '../../domain/models/init_quality_check/product_type_model.dart';
// import '../../domain/remote/exceptions/network_exceptions.dart';
// import '../../main.dart';
// import '../../presentation/widgets/circular_progress_dialog.dart';
// import '../../presentation/widgets/single_button_alert_dialog.dart';

// class InitQualityController extends GetxController {
//   final InitialQualityCheckFacade _initialQualityCheckFacade;
//   final EmployeeDataManager _employeeDataManager;

//   InitQualityController(
//       this._initialQualityCheckFacade, this._employeeDataManager);

//   String get initialQualityProductNameID => 'initialQualityProductNameID';
//   String get initialQualityProductTypeID => 'initialQualityProductTypeID';
//   String get questionWidgetId => 'questionWidgetId';

//   List<Category> category = [];
//   List<TypeData> sub_category = [];
//   List<Questions> questions = [];

//   Future<void> getProductName() async {
//     showCircularProgressDialog(msg: 'Loading');

//     final result = await _initialQualityCheckFacade.getproductName();
//     Navigator.of(navigatorKey.currentContext!).pop();
//     result.fold((NetworkExceptions exp) {
//       return showSingleButtonAlertDialog(
//         Get.context!,
//         'Warning',
//         getMessageFromException(exp),
//         () {
//           Navigator.of(Get.context!).pop();
//         },
//       );
//     }, (ProductNameModel resp) {
//       category.clear();
//       category.addAll(resp.data!);

//       customLog(resp.data!.length);
//       update([initialQualityProductNameID]);
//     });
//   }

//   Future<void> getProductType({required String id}) async {
//     showCircularProgressDialog(msg: 'Loading');

//     final result = await _initialQualityCheckFacade.getProductType(id: id);
//     Navigator.of(navigatorKey.currentContext!).pop();
//     result.fold((NetworkExceptions exp) {
//       update([initialQualityProductNameID]);
//       return showSingleButtonAlertDialog(
//         Get.context!,
//         'Warning',
//         getMessageFromException(exp),
//         () {
//           Navigator.of(Get.context!).pop();
//         },
//       );
//     }, (ProductTypeModel resp) {
//       sub_category.clear();
//       sub_category.addAll(resp.data!);
//       customLog(resp.data!.length);
//       update([initialQualityProductTypeID]);
//     });
//   }

//   // Future<void> getQuestions(
//   //     {required String product_subcategory,
//   //     required String sl_no,
//   //     required String size,
//   //     required String manufacture_name}) async {
//   //   showCircularProgressDialog(msg: 'Loading');

//   //   final result = await _initialQualityCheckFacade.getQuestions(
//   //       product_subcategory: product_subcategory,
//   //       sl_no: sl_no,
//   //       size: size,
//   //       manufacture_name: manufacture_name);
//   //   Navigator.of(navigatorKey.currentContext!).pop();
//   //   result.fold((NetworkExceptions exp) {
//   //     update([initialQualityProductNameID]);
//   //     return showSingleButtonAlertDialog(
//   //       Get.context!,
//   //       'Warning',
//   //       getMessageFromException(exp),
//   //       () {
//   //         Navigator.of(Get.context!).pop();
//   //       },
//   //     );
//   //   }, (ProductEntryModel resp) {
//   //     customLog('--000${jsonEncode(resp)}');
//   //     questions.clear();
//   //     questions.addAll(resp.data!);

//   //     update([initialQualityProductNameID]);
//   //   });
//   // }

//   // Future<void> saveAnswer({required bool answer, required int id}) async {
//   //   final result =
//   //       await _initialQualityCheckFacade.saveAnswer(id: id, answer: answer);

//   //   result.fold((NetworkExceptions exp) {
//   //     update([initialQualityProductNameID]);
//   //     return showSingleButtonAlertDialog(
//   //       Get.context!,
//   //       'Warning',
//   //       getMessageFromException(exp),
//   //       () {
//   //         Navigator.of(Get.context!).pop();
//   //       },
//   //     );
//   //   }, (AnswerStatusModel resp) {
//   //     showBottomSheet(
//   //         context: Get.context!, builder: ((context) => Text('Saved')));
//   //     update([initialQualityProductTypeID]);
//   //   });
//   // }
// }
