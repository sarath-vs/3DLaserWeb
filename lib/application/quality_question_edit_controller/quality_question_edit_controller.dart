import 'dart:convert';
import 'dart:html';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:laser_tech_app/domain/log/custom_log.dart';
import 'package:laser_tech_app/domain/models/products/get_question_details_model.dart';
import 'package:path_provider/path_provider.dart';
import '../../domain/employee_data/employee_data_manager.dart';
import '../../domain/models/products/quality_product_facade.dart';
import '../../domain/remote/exceptions/network_exceptions.dart';
import '../../main.dart';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;
import '../../presentation/widgets/circular_progress_dialog.dart';
import '../../presentation/widgets/single_button_alert_dialog.dart';

@injectable
class QualityQuestionEditController extends GetxController {
  final QualityProductFacade _qualityProductFacade;
  final EmployeeDataManager _employeeDataManager;

  QualityQuestionEditController(
      this._qualityProductFacade, this._employeeDataManager);

  String get qualityQuestionDetailID => 'qualityQuestionDetailID';
  static bool yesno = false;
  static bool yesnoManditory = false;
  static bool qrScanner = false;
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
  static String dropDownDataEnglish = '';
  static String dropDownDataCzech = '';
  static String dropDownDataVietnam = '';
  static List<int> selectedID = [];
  static String? questionEnglish;
  static String? questionCzech;
  static String? questionGerman;
  static String? discriptionEnglish;
  static String? discriptionCzech;
  static String? discriptionGerman;

  static List<int> tools = [];

  static String questionID = '';
  static int? productId;

  final TextEditingController questionEnglishController =
      TextEditingController();
  final TextEditingController questionCzechController = TextEditingController();
  final TextEditingController questionGermanController =
      TextEditingController();
  final TextEditingController discriptionEnglishController =
      TextEditingController();
  final TextEditingController discriptionCzechController =
      TextEditingController();
  final TextEditingController discriptionGermanController =
      TextEditingController();
  final TextEditingController dropDownValueEnglishController =
      TextEditingController();
  final TextEditingController dropDownValueCzechController =
      TextEditingController();
  final TextEditingController dropDownValueVietnamController =
      TextEditingController();

  static List<String> selectedimagesin64bytes = [];
  static List<Uint8List> selectedimagesin64bytesfromurl = [];

  static List<String> selectedimagesinbase64listfromurl = [];

  static List<String> base64StringVDO = [];
  static List<String> covert64video = [];
  static List<Uint8List> selectedunillist64video = [];
  // static List<String> selectedvideosurl = [];
  // static List<Uint8List> thumbnailvideoselectednw = [];
  // Uint8List? singlethumbnailvideo;

  Future<void> networkImageToBase64() async {
    selectedimagesin64bytesfromurl.clear();
    selectedimagesinbase64listfromurl.clear();
    for (int i = 0; i < selectedimagesin64bytes.length; i++) {
      // print('=====$i');
      //  http.Response response = await http.get(Uri.parse('http://65.1.86.132'+selectedimagesin64bytes[i]) );

      final response = await http
          .get(Uri.parse('http://65.1.86.132' + selectedimagesin64bytes[i]));
      if (response.statusCode == 200) {
        selectedimagesin64bytesfromurl.add(response.bodyBytes);
        selectedimagesinbase64listfromurl
            .add(base64.encode(response.bodyBytes));
        // print('000---------1111${selectedimagesin64bytesfromurl}');
        // print('000---------1111${selectedimagesinbase64listfromurl}');
      } else {
        throw Exception('Failed to load image');
      }
    }
  }

  Future<void> networkVideoToBase64() async {
    selectedunillist64video.clear();
    covert64video.clear();
    // selectedvideosurl.clear();
    for (int i = 0; i < base64StringVDO.length; i++) {
      // print('=====$i');
      //  http.Response response = await http.get(Uri.parse('http://65.1.86.132'+selectedimagesin64bytes[i]) );
      // selectedvideosurl.add('http://65.1.86.132${base64StringVDO[i]}');

      final response =
          await http.get(Uri.parse('http://65.1.86.132' + base64StringVDO[i]));

      if (response.statusCode == 200) {
        selectedunillist64video.add(response.bodyBytes);
        covert64video.add(base64.encode(response.bodyBytes));
        // print('000---------1111---video-----$covert64video');
        // print('000---------1111${selectedimagesinbase64listfromurl}');
      } else {
        throw Exception('Failed to load video');
      }
    }
  }

  static final answerField = {
    "yn": yesno,
    "ynMN": yesnoManditory,
    "qr_Scanner": qrScanner,
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
    "dropDownData": dropDownDataEnglish +
        '&&' +
        dropDownDataCzech +
        '&&' +
        dropDownDataVietnam
  };

  Future<void> getEditQuestionDetails(
      {required String id, required String screenName}) async {
    showCircularProgressDialog(msg: 'Loading');
    final result = await _qualityProductFacade.getQuestionDetails(
        id: id, screenName: screenName);
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
      // String vitenmqp = questionGerman ?? "";

      yesno = resp.data!.fieldInfoObject!.yn ?? false;
      qrScanner = resp.data!.fieldInfoObject!.qr_Scanner ?? false;
      yesnoManditory = resp.data!.fieldInfoObject!.ynMN ?? false;
      yesnoNone = resp.data!.fieldInfoObject!.ynn ?? false;
      yesnoNoneManditory = resp.data!.fieldInfoObject!.ynnMN ?? false;
      dropdown = resp.data!.fieldInfoObject!.dd ?? false;
      dropDownManditory = resp.data!.fieldInfoObject!.ddMN ?? false;
      inputText = resp.data!.fieldInfoObject!.tf ?? false;
      inputTextManditory = resp.data!.fieldInfoObject!.tfMN ?? false;
      image = resp.data!.fieldInfoObject!.img ?? false;
      imageManditory = resp.data!.fieldInfoObject!.imgMN ?? false;
      range = resp.data!.fieldInfoObject!.rg ?? false;
      rangeManditory = resp.data!.fieldInfoObject!.rgMN ?? false;
      number = false;
      rangeFrom = resp.data!.fieldInfoObject!.rangeFrom ?? "";
      rangeTo = resp.data!.fieldInfoObject!.rangeTo ?? "";
      dropDownDataEnglish =
          resp.data!.fieldInfoObject!.dropDownData!.split("&&")[0] ?? "";
      dropDownDataCzech =
          resp.data!.fieldInfoObject!.dropDownData!.split("&&")[1] ?? "";
      dropDownDataVietnam =
          resp.data!.fieldInfoObject!.dropDownData!.split("&&")[2] ?? "";
      dropDownValueEnglishController.text =
          resp.data!.fieldInfoObject!.dropDownData!.split("&&")[0] ?? "";
      dropDownValueCzechController.text =
          resp.data!.fieldInfoObject!.dropDownData!.split("&&")[1] ?? "";
      dropDownValueVietnamController.text =
          resp.data!.fieldInfoObject!.dropDownData!.split("&&")[2] ?? "";
      productId = resp.data!.category;
      questionID = resp.data!.id.toString();
      questionEnglish = resp.data!.questionEnglish.toString();
      questionCzech = resp.data!.questionCzech.toString();
      questionGerman = resp.data!.questionGerman.toString();
      discriptionEnglish = resp.data!.descriptionEnglish.toString();
      discriptionCzech = resp.data!.descriptionCzech.toString();
      discriptionGerman = resp.data!.descriptionGerman.toString();
      //  discriptionGerman = utf8.decode(resp.data!.descriptionGerman).toString();
      selectedimagesin64bytes = resp.data!.images!;

      base64StringVDO = resp.data!.videos!;
      tools.clear();
      questionEnglishController.text = resp.data!.questionEnglish ?? "N/A";
      // questionCzechController.text = resp.data!.questionCzech ?? "N/A";

      if (resp.data!.questionGerman != null) {
        List<int> list = json.decode(resp.data!.questionGerman!).cast<int>();
        var decogermanqp = utf8.decode(list);
        questionGermanController.text = decogermanqp;
      } else {
        questionGermanController.text = "N/A";
      }
      if (resp.data!.questionCzech != null) {
        List<int> list = json.decode(resp.data!.questionCzech!).cast<int>();
        var decoczechqp = utf8.decode(list);
        questionCzechController.text = decoczechqp;
      } else {
        questionCzechController.text = "N/A";
      }
      if (resp.data!.descriptionGerman != null) {
        List<int> list = json.decode(resp.data!.descriptionGerman!).cast<int>();
        var decogermandiscr = utf8.decode(list);
        discriptionGermanController.text = decogermandiscr;
      } else {
        discriptionGermanController.text = "N/A";
      }
      if (resp.data!.descriptionCzech != null) {
        List<int> list = json.decode(resp.data!.descriptionCzech!).cast<int>();
        var decoczechdiscr = utf8.decode(list);
        discriptionCzechController.text = decoczechdiscr;
      } else {
        discriptionCzechController.text = "N/A";
      }

      discriptionEnglishController.text =
          resp.data!.descriptionEnglish ?? "N/A";
      // discriptionCzechController.text = resp.data!.descriptionCzech ?? "N/A";
      // discriptionGermanController.text = resp.data!.descriptionGerman ?? "N/A";
      resp.data!.toolsUsed!.forEach((element) {
        tools.add(element.toolId!);
      });
      // selectedimagesin64bytes = selectedimagesinbase64listfromurl;
      customLog(resp);

      // print(decovi.toString());

      await networkVideoToBase64();
      await networkImageToBase64();
      // await networkvideothumbnail();

      // print('-------${selectedimagesin64bytesfromurl.first}');
      print(
          "----video--------------${base64StringVDO.first}-------------------------*********");
      update([qualityQuestionDetailID]);
    });
  }

  Future<void> putEditQuestionDetails(
      {
      // required String vdo,
      required String screenName}) async {
    var germanqp = (utf8.encode(questionGermanController.text)).toString();
    var czechqp = (utf8.encode(questionCzechController.text)).toString();
    var germandiscription =
        (utf8.encode(discriptionGermanController.text)).toString();
    var czechdiscription =
        (utf8.encode(discriptionCzechController.text)).toString();

    final dataToSend = {
      "description_english": discriptionEnglishController.text,
      "description_czech": czechdiscription,
      "description_german": germandiscription,
      // utf8.encode(discriptionGermanController.text),
      "image_base_64": selectedimagesin64bytes,
      "video_base_64": base64StringVDO,
      // [vdo],
      "question_english": questionEnglishController.text,
      "question_czech": czechqp,
      "question_german": germanqp,
      "time_limit": 0,
      "field_info_object": answerField,
      "category": productId,
      "tools_used": tools
    };

    // String decodedgerqp=utf8.decode()

    showCircularProgressDialog(msg: 'Loading');
    final result = await _qualityProductFacade.putQuestionEdit(
        id: questionID, dataToSend: dataToSend, screenName: screenName);
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
    });
  }
}
