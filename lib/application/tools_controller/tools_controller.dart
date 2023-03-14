import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:laser_tech_app/domain/log/custom_log.dart';

import 'package:laser_tech_app/domain/models/tools_model/tools_facade.dart';
import 'package:laser_tech_app/domain/models/tools_model/tools_model.dart';

import '../../domain/employee_data/employee_data_manager.dart';

import '../../domain/remote/exceptions/network_exceptions.dart';
import '../../main.dart';

import '../../presentation/widgets/circular_progress_dialog.dart';
import '../../presentation/widgets/single_button_alert_dialog.dart';

@injectable
class ToolsController extends GetxController {
  final ToolsFacade _toolsFacade;
  final EmployeeDataManager _employeeDataManager;

  ToolsController(this._toolsFacade, this._employeeDataManager);

  String get toolListWidgetID => 'toolListWidgetID';

  List<ToolsResult> toolsList = [];
  String? filepath;

  Future<void> getTools() async {
    showCircularProgressDialog(msg: 'Signing in');
    final result = await _toolsFacade.getToolsDetail();
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
    }, (ToolsModel resp) async {
      toolsList.clear();
      toolsList.addAll(resp.results!);
      customLog(toolsList);
      update([toolListWidgetID]);
    });
  }

  Future<void> saveToolsQuality(
      {required String name,
      required String image_base_64,
      required String discription}) async {
    showCircularProgressDialog(msg: 'Signing in');
    final result = await _toolsFacade.saveToolsDetail(
        name: name, image_base_64: image_base_64, description: discription);
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
      update([toolListWidgetID]);
    });
  }

  Future<void> deleteQualityTools({
    required int id,
  }) async {
    showCircularProgressDialog(msg: 'Signing in');
    final result = await _toolsFacade.deleteTool(id: id);
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
      // name = resp;
      customLog(resp);
      update([toolListWidgetID]);
    });
  }
}
