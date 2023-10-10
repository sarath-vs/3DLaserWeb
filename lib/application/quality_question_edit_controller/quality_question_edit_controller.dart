import 'dart:convert';
import 'dart:html';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:laser_tech_app/domain/log/custom_log.dart';
import 'package:laser_tech_app/domain/models/products/get_question_details_model.dart';
import 'package:laser_tech_app/domain/remote/url/url_pool.dart';
import 'package:laser_tech_app/presentation/widgets/dropdownoption.dart';
import 'package:path_provider/path_provider.dart';
import '../../domain/employee_data/employee_data_manager.dart';
import '../../domain/models/products/quality_product_facade.dart';
import '../../domain/remote/exceptions/network_exceptions.dart';
import '../../main.dart';

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
// /////////////////////////////////////////////////////////////////////////////////////////
  List<Map<String, String>> dropdownvaluesList = [];
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
    // final List<Map<String, String>> valuesList = [];

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
      dropdownvaluesList.add(values);
    }

    return dropdownvaluesList;
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

////////////////////////////////////////////////////////////////////////////
  Future<void> networkImageToBase64() async {
    selectedimagesin64bytesfromurl.clear();
    selectedimagesinbase64listfromurl.clear();
    for (int i = 0; i < selectedimagesin64bytes.length; i++) {
      // print('=====$i');
      //  http.Response response = await http.get(Uri.parse('http://65.1.86.132'+selectedimagesin64bytes[i]) );

      final response =
          await http.get(Uri.parse(baseUrl + selectedimagesin64bytes[i]));
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
    update([qualityQuestionDetailID]);
  }

  imageadding(PlatformFile element) {
    selectedimagesin64bytesfromurl.add(element.bytes as Uint8List);
    selectedimagesinbase64listfromurl.add(base64.encode(element.bytes!));
    update([qualityQuestionDetailID]);
  }

  Future<void> networkVideoToBase64() async {
    selectedunillist64video.clear();
    covert64video.clear();
    // selectedvideosurl.clear();
    for (int i = 0; i < base64StringVDO.length; i++) {
      // print('=====$i');
      //  http.Response response = await http.get(Uri.parse('http://65.1.86.132'+selectedimagesin64bytes[i]) );
      // selectedvideosurl.add('http://65.1.86.132${base64StringVDO[i]}');

      final response = await http.get(Uri.parse(baseUrl + base64StringVDO[i]));

      if (response.statusCode == 200) {
        selectedunillist64video.add(response.bodyBytes);
        covert64video.add(base64.encode(response.bodyBytes));
        // print('000---------1111---video-----$covert64video');
        // print('000---------1111${selectedimagesinbase64listfromurl}');
      } else {
        throw Exception('Failed to load video');
      }
    }
    update([qualityQuestionDetailID]);
  }

  videoadding(PlatformFile element) {
    selectedunillist64video.add(element.bytes as Uint8List);
    covert64video.add(base64.encode(element.bytes!));
    update([qualityQuestionDetailID]);
  }

  // static final answerField = {
  //   "yn": yesno,
  //   "ynMN": yesnoManditory,
  //   "qr_Scanner": qrScanner,
  //   "ynn": yesnoNone,
  //   "ynnMN": yesnoNoneManditory,
  //   "rg": range,
  //   "rgMN": rangeManditory,
  //   "tf": inputText,
  //   "tfMN": inputTextManditory,
  //   "dd": dropdown,
  //   "ddMN": dropDownManditory,
  //   "img": image,
  //   "imgMN": imageManditory,
  //   "vdo": vdo,
  //   "vdoMN": vdoManditory,
  //   "rangeFrom": rangeFrom,
  //   "rangeTo": rangeTo,
  //   "dropDownData": dropDownDataEnglish +
  //       '&&' +
  //       czechdropdownvalue +
  //       '&&' +
  //       vietnamdropdownvalue
  // };

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

      productId = resp.data!.category;
      questionID = resp.data!.id.toString();

      questionEnglish = resp.data!.questionEnglish.toString();
      // questionEnglish = decoenglishqp;
      questionCzech = resp.data!.questionCzech.toString();
      questionGerman = resp.data!.questionGerman.toString();
      discriptionEnglish = resp.data!.descriptionEnglish.toString();
      discriptionCzech = resp.data!.descriptionCzech.toString();
      discriptionGerman = resp.data!.descriptionGerman.toString();
      //  discriptionGerman = utf8.decode(resp.data!.descriptionGerman).toString();
      selectedimagesin64bytes = resp.data!.images!;

      base64StringVDO = resp.data!.videos!;
      tools.clear();
      // questionEnglishController.text = resp.data!.questionEnglish ?? "N/A";
      // questionCzechController.text = resp.data!.questionCzech ?? "N/A";
// /////////////////////////////////////////////
      await fun(resp);
      // /////////////////////////////////////////////

      // discriptionEnglishController.text =
      //     resp.data!.descriptionEnglish ?? "N/A";

      if (resp.data!.questionEnglish != null) {
        List<int> list = json.decode(resp.data!.questionEnglish!).cast<int>();
        var decoenglishqp = utf8.decode(list);
        questionEnglishController.text = decoenglishqp;
      } else {
        questionEnglishController.text = "N/A";
      }

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

      if (resp.data!.descriptionEnglish != null) {
        List<int> list =
            json.decode(resp.data!.descriptionEnglish!).cast<int>();
        var decoenglishdiscr = utf8.decode(list);
        discriptionEnglishController.text = decoenglishdiscr;
      } else {
        discriptionEnglishController.text = "N/A";
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

  fun(GetQuestionDetailsModel resp) async {
    if (resp.data!.fieldInfoObject!.dropDownData != null) {
      String? tempdropDownData = resp.data!.fieldInfoObject!.dropDownData;
      // Remove the enclosing square brackets and split the string by '}, ' to separate the map representations
      List<String> mapStrings = tempdropDownData!
          .substring(1, tempdropDownData.length - 1)
          .split('}, ');

      // Initialize an empty list to store the parsed maps

      // Iterate through the map representations and parse them into actual maps
      for (String mapString in mapStrings) {
        Map<String, String> map = {};
        // Split each map representation by ', ' to separate key-value pairs
        List<String> keyValuePairs = mapString.split(', ');
        for (String keyValuePair in keyValuePairs) {
          // Split each key-value pair by ': ' to separate keys from values
          List<String> keyValue = keyValuePair.split(': ');
          // Trim any extra spaces and remove curly braces
          String key = keyValue[0].trim().replaceAll('{', '');
          String value = keyValue[1].trim().replaceAll('}', '');
          map[key] = value;
        }
        dropdownvaluesList.add(map);
      }
    }

    print("***************************************");
    print(dropdownvaluesList);
    print("***************************************");

    // String tempdropDownDataCzech =
    //     resp.data!.fieldInfoObject!.dropDownData?.split("&&")[1] ?? "";
    // String tempdropDownDataVietnam =
    //     resp.data!.fieldInfoObject!.dropDownData?.split("&&")[2] ?? "";

    // if (tempdropDownDataEnglish != "") {
    //   List<int> list = json.decode(tempdropDownDataEnglish).cast<int>();
    //   var decoenglishdropdown = utf8.decode(list);
    //   dropDownDataEnglish = decoenglishdropdown;
    // } else {
    //   dropDownDataEnglish = "";
    // }

    // if (tempdropDownDataCzech != "") {
    //   List<int> list = json.decode(tempdropDownDataCzech).cast<int>();
    //   var decoczechdropdown = utf8.decode(list);
    //   dropDownDataCzech = decoczechdropdown;
    // } else {
    //   dropDownDataCzech = "";
    // }
    // if (tempdropDownDataVietnam != "") {
    //   List<int> list = json.decode(tempdropDownDataVietnam).cast<int>();
    //   var decoczechdropdown = utf8.decode(list);
    //   dropDownDataVietnam = decoczechdropdown;
    // } else {
    //   dropDownDataVietnam = "";
    // }

    // if (tempdropDownDataEnglish != "") {
    //   List<int> list = json.decode(tempdropDownDataEnglish).cast<int>();
    //   var decoenglishdropdown = utf8.decode(list);
    //   dropDownValueEnglishController.text = decoenglishdropdown;
    // } else {
    //   dropDownValueEnglishController.text = "";
    // }

    // if (tempdropDownDataCzech != "") {
    //   List<int> list = json.decode(tempdropDownDataCzech).cast<int>();
    //   var decoczechdropdown = utf8.decode(list);
    //   dropDownValueCzechController.text = decoczechdropdown;
    // } else {
    //   dropDownValueCzechController.text = "";
    // }

    // if (tempdropDownDataVietnam != "") {
    //   List<int> list = json.decode(tempdropDownDataVietnam).cast<int>();
    //   var decovitenmdropdown = utf8.decode(list);
    //   dropDownValueVietnamController.text = decovitenmdropdown;
    // } else {
    //   dropDownValueVietnamController.text = "";
    // }
  }

  Future<void> putEditQuestionDetails(
      {
      // required String vdo,
      required String screenName}) async {
    var englishqp = (utf8.encode(questionEnglishController.text)).toString();
    var germanqp = (utf8.encode(questionGermanController.text)).toString();
    var czechqp = (utf8.encode(questionCzechController.text)).toString();

    var englishdiscription =
        (utf8.encode(discriptionEnglishController.text)).toString();
    var germandiscription =
        (utf8.encode(discriptionGermanController.text)).toString();
    var czechdiscription =
        (utf8.encode(discriptionCzechController.text)).toString();

    String englishdropdownvalue = (utf8.encode(dropDownDataEnglish)).toString();
    String czechdropdownvalue = (utf8.encode(dropDownDataCzech)).toString();
    String vietnamdropdownvalue = (utf8.encode(dropDownDataVietnam)).toString();

    final answerField = {
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
      "dropDownData": englishdropdownvalue +
          '&&' +
          // dropDownDataCzech
          //  +

          czechdropdownvalue +
          '&&'
          // dropDownDataVietnam
          +
          vietnamdropdownvalue
    };

    final dataToSend = {
      "description_english": englishdiscription,
      "description_czech": czechdiscription,
      "description_german": germandiscription,
      // utf8.encode(discriptionGermanController.text),
      "image_base_64": selectedimagesin64bytes,
      "video_base_64": base64StringVDO,
      // [vdo],
      "question_english": englishqp,
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

  imageremove(int index) {
    selectedimagesin64bytesfromurl.removeAt(index);
    selectedimagesinbase64listfromurl //bytes list removing
        .removeAt(index);
    print("pressed");
    update([qualityQuestionDetailID]);
    print("update screen");
    print(index);
  }

  videoremover(int index) {
    selectedunillist64video.removeAt(index);
    covert64video.removeAt(index); //bytes list removing
    update([qualityQuestionDetailID]);
  }
}
