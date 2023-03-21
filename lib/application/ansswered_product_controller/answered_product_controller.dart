import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:laser_tech_app/domain/log/custom_log.dart';
import 'package:laser_tech_app/domain/models/answered_product_list/answered_product_list_model.dart';
import '../../domain/models/answered_product_list/answered_product_facade.dart';
import '../../domain/remote/exceptions/network_exceptions.dart';
import '../../main.dart';

import '../../presentation/widgets/circular_progress_dialog.dart';
import '../../presentation/widgets/single_button_alert_dialog.dart';

@injectable
class AnsweredProductController extends GetxController {
  final AnsweredProductFacade _answeredProductFacade;
 

  AnsweredProductController(this._answeredProductFacade,);

  String get answeredProductListWidgetID => 'answeredProductListWidgetID';



 List<AnsweredListResult> productList = [];

  

  Future<void> getAnswerProductLists
  ({
    required int id,
  }) async {
    showCircularProgressDialog(msg: 'Loading');
    final result = await _answeredProductFacade.getAnsweredProductList(id: id);
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
    }, (AnsweredProductListModel resp) {
      productList.clear();
      productList.addAll(resp.data!);
     
      customLog(resp);
      update([answeredProductListWidgetID]);
    });
  }
}
