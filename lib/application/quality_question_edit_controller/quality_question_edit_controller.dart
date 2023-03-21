import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:laser_tech_app/domain/log/custom_log.dart';
import 'package:laser_tech_app/domain/models/products/get_question_details_model.dart';
import '../../domain/employee_data/employee_data_manager.dart';
import '../../domain/models/products/quality_product_facade.dart';

import '../../domain/remote/exceptions/network_exceptions.dart';
import '../../main.dart';

import '../../presentation/widgets/circular_progress_dialog.dart';
import '../../presentation/widgets/single_button_alert_dialog.dart';

@injectable
class QualityQuestionEditController extends GetxController {
  final QualityProductFacade _qualityProductFacade;
  final EmployeeDataManager _employeeDataManager;

  QualityQuestionEditController(
      this._qualityProductFacade, this._employeeDataManager);

  String get qualityQuestionDetailID => 'qualityQuestionDetailID';
  static  bool yesno = false;
  static bool yesnoManditory = false;
  static bool yesnoNone = false;
  static bool yesnoNoneManditory = false;
  static bool dropdown = false;
  static bool dropDownManditory = false;
  static bool inputText = false;
  static bool inputTextManditory = false;
  static bool image = false;
  static bool imageManditory = false;
  static bool range = false;
  static bool rangeManditory = false;
  static bool number = false;
  static bool numberManditory = false;
  static bool vdo = false;
  static bool vdoManditory = false;
  static String rangeFrom = '';
  static String rangeTo = '';
  static String dropDownData = '';
  static List<int> selectedID = [];
  static String? questionEnglish;
  static String? questionCzech;
  static String? questionGerman;
  static String? discriptionEnglish;
  static String? discriptionCzech;
  static String? discriptionGerman;

  static List<int> tools = [];

static String questionID='';
static int? productId;




 static List<String> selectedimagesin64bytes = [];


static  List<String> base64StringVDO = [];
static final answerField = {
                                      "yn": yesno,
                                      "ynMN": yesnoManditory,
                                      "ynn": yesnoNone,
                                      "ynnMN": yesnoNoneManditory,
                                      "rg": range,
                                      "rgMN": rangeManditory,
                                      "tf": inputText,
                                      "tfMN": inputTextManditory,
                                      "dd": dropdown,
                                      "ddMN": dropDownManditory,
                                      "img": image,
                                      "imgMN": imageManditory,
                                      "vdo": vdo,
                                      "vdoMN": vdoManditory,
                                      "rangeFrom": rangeFrom,
                                      "rangeTo": rangeTo,
                                      "dropDownData": dropDownData
                                    };
                                  



    



    Future<void> getEditQuestionDetails(
      {required String id}) async {
    showCircularProgressDialog(msg: 'Loading');
    final result = await _qualityProductFacade.getQuestionDetails(
        id: id);
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
    }, (GetQuestionDetailsModel resp) async {
     
      yesno = resp.data!.fieldInfoObject!.yn??false;
      yesnoManditory = resp.data!.fieldInfoObject!.ynMN??false;
      yesnoNone = resp.data!.fieldInfoObject!.ynn??false;
      yesnoNoneManditory = resp.data!.fieldInfoObject!.ynnMN??false;
      dropdown = resp.data!.fieldInfoObject!.dd??false;
      dropDownManditory = resp.data!.fieldInfoObject!.ddMN??false;
      inputText = resp.data!.fieldInfoObject!.tf??false;
      inputTextManditory = resp.data!.fieldInfoObject!.tfMN??false;
      image = resp.data!.fieldInfoObject!.img??false;
        imageManditory = resp.data!.fieldInfoObject!.imgMN??false;
          range = resp.data!.fieldInfoObject!.rg??false;
            rangeManditory = resp.data!.fieldInfoObject!.rgMN??false;
              number = false;
                rangeFrom = resp.data!.fieldInfoObject!.rangeFrom??"";
                  rangeTo = resp.data!.fieldInfoObject!.rangeTo??"";
                    dropDownData = resp.data!.fieldInfoObject!.dropDownData??"";
                    productId=resp.data!.category;
                    questionID=resp.data!.id.toString();
                    questionEnglish=resp.data!.questionEnglish.toString();
                    questionCzech=resp.data!.questionCzech.toString();
                    questionGerman=resp.data!.questionGerman.toString();
                    discriptionEnglish=resp.data!.descriptionEnglish.toString();
                    discriptionCzech=resp.data!.descriptionCzech.toString();
                    discriptionGerman=resp.data!.descriptionGerman.toString();
                    selectedimagesin64bytes=resp.data!.images!;
                    base64StringVDO=resp.data!.videos!;
                    tools.clear();
                    resp.data!.toolsUsed!.forEach((element) {
                      tools.add(element.toolId!);
                     
                    })
                   
;                     

      customLog(resp);
      update([qualityQuestionDetailID]);
    });
  }

      Future<void> putEditQuestionDetails(
      ) async {  final dataToSend = {
                                       "description_english": discriptionEnglish,
                                      "description_czech": discriptionCzech,
                                      "description_german": discriptionGerman,
                                      "image_base_64": selectedimagesin64bytes,
                                      "video_base_64": base64StringVDO,
                                     
                                      "question_english": questionEnglish,
                                      "question_czech": questionCzech,
                                      "question_german": questionGerman,
                                      "time_limit": 0,
                                       "field_info_object": answerField,
                                       "category": productId,
                                      "tools_used": tools
                                     
                        
                                    };
         showCircularProgressDialog(msg: 'Loading');
    final result = await _qualityProductFacade.putQuestionEdit(id: questionID, dataToSend: dataToSend);
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
      update([qualityQuestionDetailID]);
    });}
      
}
