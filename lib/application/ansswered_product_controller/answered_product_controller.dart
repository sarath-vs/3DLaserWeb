import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:laser_tech_app/domain/models/answered_product_list/answer_model.dart';
import 'package:laser_tech_app/domain/models/answered_product_list/answered_product_list_model.dart';

import '../../domain/models/answered_product_list/answered_product_facade.dart';
import '../../domain/remote/exceptions/network_exceptions.dart';
import '../../main.dart';
import '../../presentation/widgets/circular_progress_dialog.dart';
import '../../presentation/widgets/single_button_alert_dialog.dart';

@injectable
class AnsweredProductController extends GetxController {
  final AnsweredProductFacade _answeredProductFacade;

  AnsweredProductController(
    this._answeredProductFacade,
  );

  RxList<AnsweredListResult> productList = RxList.empty(growable: true);
  RxList<AnswerList> answerList = RxList.empty(growable: true);

  AnsweredListResult? currentSelectedAnswer;
  RxString question = RxString('Question not available');
  RxnString answerDropDown = RxnString();
  RxnString answerRange = RxnString();
  RxnString answerYesOrNo = RxnString();
  RxnString answerYesOrNoOrNoOne = RxnString();
  RxnString answerImage = RxnString();
  RxInt timeTakenToComplete = RxInt(0);

 String get answerWidgetID => 'answerWidgetID';
  Future<void> getAnswerProductLists({required int id}) async {
    productList.clear();
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
      productList.refresh();
    });
  }

  Future<void> getAnswerLists({required int id}) async {
    answerList.clear();
    showCircularProgressDialog(msg: 'Loading');
    final result = await _answeredProductFacade.getAnswerList(id: id);
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
    }, (AnswerModel resp) {
      answerList.clear();
      answerList.addAll(resp.data!);
      answerList.refresh();
           update([answerWidgetID]);
    });
  }

  Future<void> onTapItem({
    required int index,
    required void Function() onSuccess,
    required void Function(String message) onError,
  }) async {
    currentSelectedAnswer = productList[index];
    await getAnswerLists(id: currentSelectedAnswer!.id!);
    if (answerList.isEmpty) {
      onError('Unable to get answers or answers not found');
    } else {
      onSuccess();
    }
  }

  void updateData() {
    print('$runtimeType updateData()');
    answerDropDown.trigger(null);
    answerRange.trigger(null);
    answerYesOrNo.trigger(null);
    answerYesOrNoOrNoOne.trigger(null);
    answerImage.trigger(null);
    timeTakenToComplete.trigger(0);
    question.trigger('Question not available');
    for (final ans in answerList) {
      if (ans.minutesTakenToComplete != null) {
        timeTakenToComplete.trigger(ans.minutesTakenToComplete!.toInt());
      }
      if (ans.questionEnglish != null) {
        question.trigger(ans.questionEnglish!);
      }
      if (ans.answer?.dropdown != null) {
        answerDropDown.trigger(ans.answer?.dropdown);
      }
      if (ans.answer?.range != null) {
        answerRange.trigger(ans.answer?.range);
      }
      if (ans.answer?.yesOrNo != null) {
        answerYesOrNo.trigger(ans.answer?.yesOrNo);
      }
      if (ans.answer?.yesOrNoOrNoOne != null) {
        answerYesOrNoOrNoOne.trigger(ans.answer?.yesOrNoOrNoOne);
      }
      if (ans.answer?.image != null) {
        answerImage.trigger(ans.answer?.image);
      }
    }
    update(['AnsweredProductController']);
  }
}
