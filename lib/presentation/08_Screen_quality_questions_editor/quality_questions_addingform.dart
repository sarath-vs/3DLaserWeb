import 'dart:convert';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laser_tech_app/application/home_screen_controller/controller.dart';
import 'package:laser_tech_app/presentation/widgets/snackbar.dart';
import '../../application/quality_question_edit_controller/quality_question_edit_controller.dart';
import '../../application/tools_controller/tools_controller.dart';
import '../../domain/responsive/dimensions.dart';
import '../theme/color.dart';
import '../theme/theme.dart';

class QualityquestionEdit extends StatefulWidget {
  static const routeName = 'QualityquestionEdit';
  const QualityquestionEdit({super.key});

  @override
  State<QualityquestionEdit> createState() => _QualityquestionEditState();
}

class _QualityquestionEditState extends State<QualityquestionEdit> {
  // bool yesno = false;
  // bool yesnoManditory = false;
  // bool yesnoNone = false;
  // bool yesnoNoneManditory = false;
  // bool dropdown = false;
  // bool dropDownManditory = false;
  // bool inputText = false;
  // bool inputTextManditory = false;
  // bool image = false;
  // bool imageManditory = false;
  // bool range = false;
  // bool rangeManditory = false;
  // bool number = false;
  // bool numberManditory = false;
  // bool vdo = false;
  // bool vdoManditory = false;
  // String rangeFrom = '';
  // String rangeTo = '';
  // String dropDownData = '';
  List<int> selectedID = [];
  // String? questionEnglish;
  // String? questionCzech;
  // String? questionGerman;
  // String? discriptionEnglish;
  // String? discriptionCzech;
  // String? discriptionGerman;
  List<bool> _checkedItems = [];
  List<int> indexList = [];

  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();

  PlatformFile? objFile;

  String selctFile = '';

  List<Uint8List> selectedvideoInBytes = [];
  List<Uint8List> pickedImagesInBytes = [];
  List<String> selectedimages = [];
  List<String> selectedimagesin64bytes = [];
  List<String> selectedvideo = [];
  var filePath = '';
  String? selectfilepath;
  List<String> base64StringVDO = [];

  int imageCounts = 0;
  _selectvideoFile(bool imageFrom) async {
    FilePickerResult? fileResult = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.video);
    // QualityQuestionEditController.base64StringVDO.clear();
    if (fileResult != null) {
      print("*********************filesize***************");
      print(fileResult.files.first.size);
      print("*********************filesize***************");

      if (fileResult.files.first.size <=
          58513400) //size checking file this is for 5 mb
      {
        selctFile = fileResult.files.first.name;
        selectfilepath = fileResult.files.first.identifier;
        fileResult.files.forEach((element) {
          setState(() {
            selectedvideo.add(element.name);

            selectedvideoInBytes.add(element.bytes as Uint8List);
            QualityQuestionEditController.selectedunillist64video
                .add(element.bytes as Uint8List);

            // base64StringVDO.add(base64.encode(element.bytes!));

            if (QualityQuestionEditController.covert64video.isNotEmpty) {
              QualityQuestionEditController.covert64video
                  .add(base64.encode(element.bytes!));
            } else {
              base64StringVDO.add(base64.encode(element.bytes!));
            }

            if (base64StringVDO.isNotEmpty) {
              QualityQuestionEditController.base64StringVDO = base64StringVDO;
            } else {
              QualityQuestionEditController.base64StringVDO.clear();
            }
          });
        });

        print("*********" +
            base64StringVDO.first +
            "**********"); //this is video byte string
      } else {
        showSnackBar(message: 'please provide less than 5 mb video ');
        print("5mb less video provide");
      }
    }
  }

  _selectedimages(bool imageFrom) async {
    FilePickerResult? fileResult = await FilePicker.platform
        .pickFiles(allowMultiple: true, type: FileType.image);
    // QualityQuestionEditController.selectedimagesin64bytesfromurl.clear();

    if (fileResult != null) {
      selctFile = fileResult.files.first.name;
      fileResult.files.forEach((element) {
        setState(() {
          pickedImagesInBytes.add(element.bytes as Uint8List);
          QualityQuestionEditController.selectedimagesin64bytesfromurl
              .add(element.bytes as Uint8List);

          selectedimages.add(element.name);
          if (QualityQuestionEditController
              .selectedimagesinbase64listfromurl.isNotEmpty) {
            QualityQuestionEditController.selectedimagesinbase64listfromurl
                .add(base64.encode(element.bytes!));
          } else {
            selectedimagesin64bytes.add(base64.encode(element.bytes!));
          }

          //selectedImageInBytes = fileResult.files.first.bytes;
          imageCounts += 1;
          if (selectedimagesin64bytes.isNotEmpty) {
            QualityQuestionEditController.selectedimagesin64bytes =
                selectedimagesin64bytes;
            // QualityQuestionEditController.selectedimagesin64bytesfromurl=selectedimagesin64bytes;
          } else {
            QualityQuestionEditController.selectedimagesin64bytes.clear();
            // QualityQuestionEditController.selectedimagesinbase64listfromurl
            //     .clear();
          }
        });
      });
    }
    print("***********" +
        selectedimages.toString() +
        "**************"); // List of selected images names
    print("***********" +
        selectedimagesin64bytes.toString() +
        "**************"); //List of selected images 64bytes form

    // print(pickedImagesInBytes);
  }

  String screenName = '';
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      final arguments = ModalRoute.of(context)!.settings.arguments as Map;

      final id = arguments['id'];
      final productIDZ = arguments['productID'];
      screenName = arguments['screenName'];

      Get.find<ToolsController>().getTools().then((value) {
        if (_checkedItems.isEmpty) {
          if (QualityQuestionEditController.tools.isEmpty) {
            _checkedItems = List.filled(
                Get.find<ToolsController>().toolsList.length, false);
          } else {
            List totaltoolsid = [];
            var totaltools = Get.find<ToolsController>().toolsList;

            totaltools.forEach((element) {
              totaltoolsid.add(element.id);
            });
            _checkedItems = totaltoolsid
                .map((a) => QualityQuestionEditController.tools.contains(a))
                .toList();
            print(_checkedItems);
          }
        }
      });
      QualityQuestionEditController.questionID = id.toString();

      if (QualityQuestionEditController.productId == null) {}
    });
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Edit Questions",
            textAlign: TextAlign.center,
            style: AppTheme.appBarText,
          ),
        ),
        // drawer: SideMenu(),
        body: GetBuilder<QualityQuestionEditController>(
            id: Get.find<QualityQuestionEditController>()
                .qualityQuestionDetailID,
            builder: (controller) {
              // controller.networkImageToBase64();
              return SafeArea(
                  child: ListView(
                children: [
                  // CustomAppBar(context, false, controller.screen),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 45),
                    child: Container(
                      height: customHeight(1800),
                      width: customWidth(250),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade300,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Question English",
                                  style: AppTheme.h9Style,
                                ),
                                // Icon(
                                //   Icons.delete,
                                //   color: Colors.red,
                                //   size: customHeight(20),
                                // )
                              ],
                            ),

                            SizedBox(
                              width: customWidth(400),
                              child: TextFormField(
                                controller:
                                    controller.questionEnglishController,
                                validator: (val) {
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: '(English*)',
                                  fillColor: Colors.grey.shade200,
                                  filled: true,
                                  floatingLabelStyle: AppTheme.h2Style,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: customWidth(400),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Question Czech",
                                    style: AppTheme.h9Style,
                                  ),
                                  TextFormField(
                                    controller:
                                        controller.questionCzechController,
                                    validator: (val) {
                                      return null;
                                    },
                                    // onChanged: (value) {
                                    //   QualityQuestionEditController.questionCzech = value;
                                    // },
                                    decoration: InputDecoration(
                                      hintText: '(Czech*)',

                                      // border: OutlineInputBorder(
                                      //     borderRadius: BorderRadius.circular(20)),
                                      fillColor: Colors.grey.shade200,
                                      filled: true,
                                      floatingLabelStyle: AppTheme.h2Style,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: customWidth(400),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Question Vietnam",
                                    style: AppTheme.h9Style,
                                  ),
                                  TextFormField(
                                    controller:
                                        controller.questionGermanController,
                                    validator: (val) {
                                      return null;
                                    },
                                    // onChanged: (value) {
                                    //    QualityQuestionEditController.questionGerman = value;
                                    // },
                                    decoration: InputDecoration(
                                      hintText: '(Vietnam*)',

                                      // border: OutlineInputBorder(
                                      //     borderRadius: BorderRadius.circular(20)),
                                      fillColor: Colors.grey.shade200,
                                      filled: true,
                                      floatingLabelStyle: AppTheme.h2Style,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            customVerticalGap(20),

                            SizedBox(
                              width: customWidth(400),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Description English",
                                    style: AppTheme.h9Style,
                                  ),
                                  TextFormField(
                                    controller:
                                        controller.discriptionEnglishController,
                                    validator: (val) {
                                      return null;
                                    },
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    // onChanged: (value) {
                                    //   QualityQuestionEditController.discriptionEnglish = value;
                                    // },
                                    decoration: InputDecoration(
                                      hintText: '(English*)',

                                      // border: OutlineInputBorder(
                                      //     borderRadius: BorderRadius.circular(20)),
                                      fillColor: Colors.grey.shade200,
                                      filled: true,
                                      floatingLabelStyle: AppTheme.h2Style,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              width: customWidth(400),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Description Czech",
                                    style: AppTheme.h9Style,
                                  ),
                                  TextFormField(
                                    controller:
                                        controller.discriptionCzechController,
                                    validator: (val) {
                                      return null;
                                    },
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    decoration: InputDecoration(
                                      hintText: '(Czech*)',

                                      // border: OutlineInputBorder(
                                      //     borderRadius: BorderRadius.circular(20)),
                                      fillColor: Colors.grey.shade200,
                                      filled: true,
                                      floatingLabelStyle: AppTheme.h2Style,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: customWidth(400),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Description Vietnam",
                                    style: AppTheme.h9Style,
                                  ),
                                  TextFormField(
                                    controller:
                                        controller.discriptionGermanController,
                                    validator: (val) {
                                      return null;
                                    },
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    decoration: InputDecoration(
                                      hintText: '(Vietnam*)',

                                      // border: OutlineInputBorder(
                                      //     borderRadius: BorderRadius.circular(20)),
                                      fillColor: Colors.grey.shade200,
                                      filled: true,
                                      floatingLabelStyle: AppTheme.h2Style,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // customHorizontalGap(50),
                                // Column(
                                //   children: [
                                //     Container(
                                //         alignment: Alignment.center,
                                //         width: customWidth(35),
                                //         height: customHeight(20),
                                //         decoration: BoxDecoration(
                                //           color: LightColor.grey2,
                                //           borderRadius: BorderRadius.all(
                                //               Radius.circular(5)),
                                //           border: Border.all(
                                //               width: 1,
                                //               color: LightColor.black),
                                //         ),
                                //         child: (selectedvideo == "")
                                //             ?  Text(
                                //              QualityQuestionEditController.base64StringVDO.length.toString()+'Files',
                                //                 style: TextStyle(
                                //                     color: LightColor.grey),
                                //               )
                                //             : Text(
                                //                 selectedvideo,
                                //                 style: TextStyle(
                                //                     color: LightColor.grey),
                                //               )),
                                //     customVerticalGap(10),
                                //     InkWell(
                                //       onTap: () async {
                                //         _selectvideoFile(true);
                                //         // var picked =
                                //         //     await FilePicker.platform.pickFiles(
                                //         //   withReadStream: true,
                                //         // );
                                //         // if (picked != null) {
                                //         //   setState(() {
                                //         //     objFile = picked.files.single;
                                //         //   });
                                //         // }
                                //       },
                                //       child: Container(
                                //         alignment: Alignment.center,
                                //         width: customWidth(35),
                                //         height: customHeight(30),
                                //         decoration: BoxDecoration(
                                //           color: LightColor.orange,
                                //           borderRadius: BorderRadius.all(
                                //               Radius.circular(5)),
                                //           border: Border.all(
                                //               width: 1,
                                //               color: LightColor.primaryColor),
                                //         ),
                                //         child: Text(
                                //          QualityQuestionEditController.base64StringVDO.length<=0 ?  "Upload Video":"Delete and update Video",
                                //           style: TextStyle(
                                //               fontSize: customFontSize(3),
                                //               color: Colors.white),
                                //         ),
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // customHorizontalGap(20),
                                // Column(
                                //   children: [
                                //     Container(
                                //         alignment: Alignment.center,
                                //         width: customWidth(45),
                                //         height: customHeight(20),
                                //         decoration: BoxDecoration(
                                //           color: LightColor.grey2,
                                //           borderRadius: BorderRadius.all(
                                //               Radius.circular(5)),
                                //           border: Border.all(
                                //               width: 1,
                                //               color: LightColor.black),
                                //         ),
                                //         child:
                                //             (selectedimages.toString() == "[]")
                                //                 ?  Text(
                                //                     QualityQuestionEditController.selectedimagesin64bytes.length.toString() + 'Files',
                                //                     style: TextStyle(
                                //                         color: LightColor.grey),
                                //                   )
                                //                 : Text(
                                //                     selectedimages.toString(),
                                //                     style: TextStyle(
                                //                         color: LightColor.grey),
                                //                   )),
                                //     customVerticalGap(10),
                                //     InkWell(
                                //       onTap: () async {
                                //         _selectedimages(true);
                                //         // var picked =
                                //         //     await FilePicker.platform.pickFiles(
                                //         //   withReadStream: true,
                                //         // );
                                //         // if (picked != null) {
                                //         //   setState(() {
                                //         //     objFile = picked.files.single;
                                //         //   });
                                //         // }
                                //       },
                                //       child: Container(
                                //         alignment: Alignment.center,
                                //         width: customWidth(35),
                                //         height: customHeight(30),
                                //         decoration: BoxDecoration(
                                //           color: LightColor.orange,
                                //           borderRadius: BorderRadius.all(
                                //               Radius.circular(5)),
                                //           border: Border.all(
                                //               width: 1,
                                //               color: LightColor.primaryColor),
                                //         ),
                                //         child: Text(
                                //         QualityQuestionEditController.selectedimagesin64bytes.length<=0 ?  "Upload Image":"Delete and update Image",
                                //           style: TextStyle(
                                //               fontSize: customFontSize(3),
                                //               color: Colors.white),
                                //         ),
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                customHorizontalGap(20),
                                Container(
                                  decoration: BoxDecoration(
                                    color: LightColor.orange,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    border: Border.all(
                                        width: 1,
                                        color: LightColor.primaryColor),
                                  ),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (_) => AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20.0))),
                                            content: Builder(
                                              builder: (context) {
                                                // Get available height and width of the build area of this widget. Make a choice depending on the size.
                                                var height =
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height;
                                                var width =
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width;

                                                return SizedBox(
                                                  height: height - 300,
                                                  width: width - 500,
                                                  child: Center(
                                                    child: GetBuilder<
                                                            ToolsController>(
                                                        id: Get.find<
                                                                ToolsController>()
                                                            .toolListWidgetID,
                                                        builder: (controller) {
                                                          return ListView
                                                              .separated(
                                                                  //scrollDirection: Axis.vertical,
                                                                  //physics: NeverScrollableScrollPhysics(),
                                                                  shrinkWrap:
                                                                      true,
                                                                  itemBuilder:
                                                                      (context,
                                                                          index) {
                                                                    return ListTile(
                                                                      onTap:
                                                                          () {
                                                                        // Navigator.pushNamed(
                                                                        //     context, ScreenToolsADD.routeName);
                                                                      },
                                                                      tileColor: Colors
                                                                          .blue
                                                                          .withOpacity(
                                                                              .3),
                                                                      leading: Text(
                                                                          '${index + 1}'),
                                                                      title:
                                                                          Row(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Expanded(
                                                                            flex:
                                                                                3,
                                                                            child: SizedBox(
                                                                                width: customWidth(40),
                                                                                height: customHeight(100),
                                                                                child: Image.network(
                                                                                  '${controller.toolsList[index].image}',
                                                                                  fit: BoxFit.contain,
                                                                                )),
                                                                          ),
                                                                          customHorizontalGap(
                                                                              10),
                                                                          Expanded(
                                                                            flex:
                                                                                6,
                                                                            child:
                                                                                Column(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                customVerticalGap(10),
                                                                                Text(
                                                                                  '${controller.toolsList[index].name}',
                                                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                                                ),
                                                                                Text('${controller.toolsList[index].description}'),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            flex:
                                                                                1,
                                                                            child:
                                                                                Row(
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              children: [
                                                                                Checkbox(
                                                                                  value: _checkedItems[index],
                                                                                  checkColor: Colors.white, // color of tick Mark
                                                                                  activeColor: LightColor.primaryColor,
                                                                                  onChanged: (bool? value) {
                                                                                    // print(_checkedItems);
                                                                                    // print(selectedID);

                                                                                    setState(() {
                                                                                      _checkedItems[index] = !_checkedItems[index];
                                                                                      print(_checkedItems);
                                                                                    });
                                                                                  },
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      // trailing: Icon(Icons.more_vert),
                                                                    );
                                                                  },
                                                                  separatorBuilder:
                                                                      (context,
                                                                          index) {
                                                                    return customVerticalGap(
                                                                        10);
                                                                  },
                                                                  itemCount: controller
                                                                      .toolsList
                                                                      .length);
                                                        }),
                                                  ),
                                                );
                                              },
                                            ),
                                            actions: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 50),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                      child: Text(
                                                        'Cancel',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize:
                                                                customFontSize(
                                                                    6)),
                                                      ),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        // selectedID.clear();

                                                        for (int i = 0;
                                                            i <
                                                                _checkedItems
                                                                    .length;
                                                            i++) {
                                                          if (_checkedItems[
                                                              i]) {
                                                            int k = Get.find<
                                                                    ToolsController>()
                                                                .toolsList[i]
                                                                .id!;
                                                            selectedID.add(k);
                                                          }
                                                          if (selectedID
                                                              .isNotEmpty) {
                                                            QualityQuestionEditController
                                                                    .tools =
                                                                selectedID;
                                                          }
                                                        }

                                                        print(selectedID);
                                                        // selectedID.length == 0
                                                        //     ? showSnackBar(
                                                        //         message:
                                                        //             'select some items'):
                                                        Get.back();
                                                      },
                                                      child: Text(
                                                        'Confirm',
                                                        style: TextStyle(
                                                            color: Colors.red,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize:
                                                                customFontSize(
                                                                    6)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: customWidth(35),
                                        height: customHeight(30),
                                        child: Text(
                                          "Select Tools",
                                          style: TextStyle(
                                              fontSize: customFontSize(3),
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            customVerticalGap(10),
                            // Text(
                            //   'Select Answer Type ',
                            //   style: TextStyle(fontWeight: FontWeight.bold),
                            // ),
                            ////////
                            ///////
                            //////
                            ///Answer Head
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Text(
                                      'Select',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: customFontSize(
                                          4,
                                        ),
                                      ),
                                    )),
                                Expanded(
                                    flex: 3,
                                    child: Text(
                                      'Answer Type',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: customFontSize(4),
                                      ),
                                    )),
                                Expanded(
                                    flex: 3,
                                    child: Text(
                                      'Value/Range Accepted',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: customFontSize(4),
                                      ),
                                    )),
                              ],
                            ),
                            ////////
                            ///////
                            //////
                            ///Answer Yes/No
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Checkbox(
                                    value: QualityQuestionEditController.yesno,
                                    checkColor:
                                        Colors.white, // color of tick Mark
                                    activeColor: LightColor.primaryColor,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        QualityQuestionEditController.yesno =
                                            !QualityQuestionEditController
                                                .yesno;
                                        QualityQuestionEditController
                                            .yesnoManditory = false;
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text('Yes/No'),
                                ),
                                Expanded(flex: 3, child: Text('Yes or No')),
                              ],
                            ),

                            ///Answer Yes/No/None
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Checkbox(
                                    value:
                                        QualityQuestionEditController.yesnoNone,
                                    checkColor:
                                        Colors.white, // color of tick Mark
                                    activeColor: LightColor.primaryColor,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        QualityQuestionEditController
                                                .yesnoNone =
                                            !QualityQuestionEditController
                                                .yesnoNone;
                                        QualityQuestionEditController
                                            .yesnoNoneManditory = false;
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text('None'),
                                ),
                                Expanded(
                                    flex: 3,
                                    child: Text('No Answer input field')),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Checkbox(
                                    value:
                                        QualityQuestionEditController.qrScanner,
                                    checkColor:
                                        Colors.white, // color of tick Mark
                                    activeColor: LightColor.primaryColor,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        QualityQuestionEditController
                                                .qrScanner =
                                            !QualityQuestionEditController
                                                .qrScanner;
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text('QR Scanner'),
                                ),
                                Expanded(
                                    flex: 3, child: Text('Scan QR Values')),
                              ],
                            ),

                            ////////
                            ///////
                            //////
                            ///Answer Range
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Checkbox(
                                    value: QualityQuestionEditController.range,
                                    checkColor:
                                        Colors.white, // color of tick Mark
                                    activeColor: LightColor.primaryColor,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        QualityQuestionEditController.range =
                                            !QualityQuestionEditController
                                                .range;
                                        QualityQuestionEditController
                                            .rangeManditory = false;
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text('Range'),
                                ),
                                QualityQuestionEditController.range
                                    ? Expanded(
                                        flex: 3,
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: customWidth(30),
                                              height: customHeight(30),
                                              child: TextFormField(
                                                validator: (val) {
                                                  return null;
                                                },
                                                onChanged: (value) {
                                                  QualityQuestionEditController
                                                      .rangeFrom = value;
                                                },
                                                decoration: InputDecoration(
                                                  hintText:
                                                      QualityQuestionEditController
                                                                  .rangeFrom ==
                                                              ""
                                                          ? "From"
                                                          : QualityQuestionEditController
                                                              .rangeFrom,
                                                  // border: OutlineInputBorder(
                                                  //     borderRadius: BorderRadius.circular(20)),
                                                  fillColor:
                                                      Colors.grey.shade200,
                                                  filled: true,
                                                  floatingLabelStyle:
                                                      AppTheme.h2Style,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              " - ",
                                              style: AppTheme.h6Style,
                                            ),
                                            SizedBox(
                                              width: customWidth(30),
                                              height: customHeight(30),
                                              child: TextFormField(
                                                  validator: (val) {},
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        QualityQuestionEditController
                                                                    .rangeTo ==
                                                                ""
                                                            ? "To"
                                                            : QualityQuestionEditController
                                                                .rangeTo,
                                                    // border: OutlineInputBorder(
                                                    //     borderRadius: BorderRadius.circular(20)),
                                                    fillColor:
                                                        Colors.grey.shade200,
                                                    filled: true,
                                                    floatingLabelStyle:
                                                        AppTheme.h2Style,
                                                  ),
                                                  onChanged: (value) {
                                                    QualityQuestionEditController
                                                        .rangeTo = value;
                                                    double torange =
                                                        double.parse(value);
                                                    double startrange =
                                                        double.parse(
                                                            QualityQuestionEditController
                                                                .rangeFrom);

                                                    Future.delayed(
                                                        Duration(seconds: 4),
                                                        () {
                                                      if (startrange >
                                                          torange) {
                                                        showDialog(
                                                          context: context,
                                                          builder: (context) =>
                                                              AlertDialog(
                                                            title:
                                                                Text('Error'),
                                                            content: Text(
                                                                'Starting range must lower than ending range'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child:
                                                                    Text('OK'),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      }
                                                    });
                                                    decoration:
                                                    InputDecoration(
                                                      hintText: "To",
                                                      // border: OutlineInputBorder(
                                                      //     borderRadius: BorderRadius.circular(20)),
                                                      fillColor:
                                                          Colors.grey.shade200,
                                                      filled: true,
                                                      floatingLabelStyle:
                                                          AppTheme.h2Style,
                                                    );
                                                  }),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Expanded(flex: 3, child: SizedBox()),
                              ],
                            ),
                            ////////
                            ///////
                            //////
                            ///Answer TextField
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Checkbox(
                                    value:
                                        QualityQuestionEditController.inputText,
                                    checkColor:
                                        Colors.white, // color of tick Mark
                                    activeColor: LightColor.primaryColor,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        QualityQuestionEditController
                                                .inputText =
                                            !QualityQuestionEditController
                                                .inputText;
                                        QualityQuestionEditController
                                            .inputTextManditory = false;
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text('Input Field'),
                                ),
                                Expanded(
                                    flex: 3,
                                    child: Text('Accept Text or Number')),
                              ],
                            ), ////////
                            ///Answer Image
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Checkbox(
                                    value: QualityQuestionEditController.image,
                                    checkColor:
                                        Colors.white, // color of tick Mark
                                    activeColor: LightColor.primaryColor,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        QualityQuestionEditController.image =
                                            !QualityQuestionEditController
                                                .image;
                                        QualityQuestionEditController
                                            .imageManditory = false;
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text('Image'),
                                ),
                                Expanded(
                                    flex: 3,
                                    child: Text('Image file can be uploaded')),
                              ],
                            ),

                            ////////
                            ///////
                            //////
                            ///Answer DropDown
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Checkbox(
                                    value:
                                        QualityQuestionEditController.dropdown,
                                    checkColor:
                                        Colors.white, // color of tick Mark
                                    activeColor: LightColor.primaryColor,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        QualityQuestionEditController.dropdown =
                                            !QualityQuestionEditController
                                                .dropdown;
                                        QualityQuestionEditController
                                            .dropDownManditory = false;
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text('DropDown'),
                                ),
                                QualityQuestionEditController.dropdown
                                    ? Expanded(
                                        flex: 3,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'English',
                                              style: AppTheme.h9Style,
                                            ),
                                            TextFormField(
                                              controller: controller
                                                  .dropDownValueEnglishController,
                                              keyboardType:
                                                  TextInputType.multiline,
                                              minLines: 1,
                                              maxLines: 7,
                                              validator: (val) {
                                                return null;
                                              },
                                              onChanged: (value) {
                                                QualityQuestionEditController
                                                        .dropDownDataEnglish =
                                                    controller
                                                        .dropDownValueEnglishController
                                                        .text;
                                              },
                                              decoration: InputDecoration(
                                                // hintText:
                                                //     QualityQuestionEditController.dropDownData==""?"Add Drop Down Values seperate by ||.(eg:one||Two||Three)":QualityQuestionEditController.dropDownData,
                                                hintStyle: TextStyle(
                                                    fontSize:
                                                        customFontSize(4)),
                                                fillColor: Colors.grey.shade200,
                                                filled: true,
                                                floatingLabelStyle:
                                                    AppTheme.h2Style,
                                              ),
                                            ),
                                            Text(
                                              'Czech',
                                              style: AppTheme.h9Style,
                                            ),
                                            TextFormField(
                                              controller: controller
                                                  .dropDownValueCzechController,
                                              keyboardType:
                                                  TextInputType.multiline,
                                              minLines: 1,
                                              maxLines: 7,
                                              validator: (val) {
                                                return null;
                                              },
                                              onChanged: (value) {
                                                QualityQuestionEditController
                                                        .dropDownDataCzech =
                                                    controller
                                                        .dropDownValueCzechController
                                                        .text;
                                              },
                                              decoration: InputDecoration(
                                                // hintText:
                                                //     QualityQuestionEditController.dropDownData==""?"Add Drop Down Values seperate by ||.(eg:one||Two||Three)":QualityQuestionEditController.dropDownData,
                                                hintStyle: TextStyle(
                                                    fontSize:
                                                        customFontSize(4)),
                                                fillColor: Colors.grey.shade200,
                                                filled: true,
                                                floatingLabelStyle:
                                                    AppTheme.h2Style,
                                              ),
                                            ),
                                            Text(
                                              'Vietnam',
                                              style: AppTheme.h9Style,
                                            ),
                                            TextFormField(
                                              controller: controller
                                                  .dropDownValueVietnamController,
                                              keyboardType:
                                                  TextInputType.multiline,
                                              minLines: 1,
                                              maxLines: 7,
                                              validator: (val) {
                                                return null;
                                              },
                                              onChanged: (value) {
                                                QualityQuestionEditController
                                                        .dropDownDataVietnam =
                                                    controller
                                                        .dropDownValueVietnamController
                                                        .text;
                                              },
                                              decoration: InputDecoration(
                                                // hintText:
                                                //     QualityQuestionEditController.dropDownData==""?"Add Drop Down Values seperate by ||.(eg:one||Two||Three)":QualityQuestionEditController.dropDownData,
                                                hintStyle: TextStyle(
                                                    fontSize:
                                                        customFontSize(4)),
                                                fillColor: Colors.grey.shade200,
                                                filled: true,
                                                floatingLabelStyle:
                                                    AppTheme.h2Style,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Expanded(flex: 3, child: SizedBox()),
                              ],
                            ),
                            ////////
                            ///////
                            //////

                            // // Numerictype(),
                            // // predefinedtype(),
                            // yesornotype(),
                            //   ImagePickerWidget(),
                            customVerticalGap(20),
                            Text(
                              'Image Upload',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),

                            Container(
                              height: customHeight(150),
                              width: double.infinity,
                              color: Colors.white,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.grey.shade300),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                            onTap: () {
                                              _selectedimages(true);
                                            },
                                            child: Container(
                                              height: customHeight(130),
                                              width: customWidth(40),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text('Delete & Add'),
                                                  Icon(
                                                    Icons.add,
                                                    color: Colors.black,
                                                    size: customHeight(50),
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ),
                                    ),
                                  ),
                                  QualityQuestionEditController
                                              .selectedimagesin64bytesfromurl
                                              .length >
                                          0
                                      ? Expanded(
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount:
                                                QualityQuestionEditController
                                                    .selectedimagesin64bytesfromurl
                                                    .length,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Stack(
                                                  children: [
                                                    SizedBox(
                                                        height:
                                                            customHeight(140),
                                                        child: Image.memory(
                                                            QualityQuestionEditController
                                                                        .selectedimagesin64bytesfromurl[
                                                                    index]
                                                                as Uint8List)),
                                                    Material(
                                                      color: Colors.transparent,
                                                      child: InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            QualityQuestionEditController
                                                                .selectedimagesin64bytesfromurl
                                                                .removeAt(
                                                                    index);
                                                            QualityQuestionEditController
                                                                .selectedimagesinbase64listfromurl //bytes list removing
                                                                .removeAt(
                                                                    index);
                                                          });
                                                        },
                                                        child: Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        .5)),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(2.0),
                                                              child: Icon(
                                                                Icons.close,
                                                                color:
                                                                    Colors.red,
                                                              ),
                                                            )),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        )
                                      : Text('No Image Selected')
                                ],
                              ),
                            ),
                            customVerticalGap(20),
                            Text(
                              'Video Upload',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),

                            Container(
                              height: customHeight(150),
                              width: double.infinity,
                              color: Colors.white,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.grey.shade300),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                            onTap: () {
                                              _selectvideoFile(true);
                                            },
                                            child: Container(
                                              height: customHeight(130),
                                              width: customWidth(40),
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.black,
                                                size: customHeight(50),
                                              ),
                                            )),
                                      ),
                                    ),
                                  ),
                                  QualityQuestionEditController
                                              .selectedunillist64video.length >
                                          0
                                      ? ListView.builder(
                                          shrinkWrap: true,
                                          itemCount:
                                              QualityQuestionEditController
                                                  .selectedunillist64video
                                                  .length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Stack(
                                                children: [
                                                  SizedBox(
                                                      height: customHeight(140),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                              'Video ${index + 1}'),
                                                          // Image.memory(
                                                          //     QualityQuestionEditController
                                                          //                 .selectedunillist64video[
                                                          //             index]
                                                          //         as Uint8List)
                                                        ],
                                                      )),
                                                  Material(
                                                    color: Colors.transparent,
                                                    child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          // base64StringVDO
                                                          //     .removeAt(index);
                                                          QualityQuestionEditController
                                                              .selectedunillist64video
                                                              .removeAt(index);
                                                          QualityQuestionEditController
                                                              .covert64video //bytes list removing
                                                              .removeAt(index);
                                                        });
                                                      },
                                                      child: Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      .5)),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(2.0),
                                                            child: Icon(
                                                              Icons.close,
                                                              color: Colors.red,
                                                            ),
                                                          )),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        )
                                      : Text('No Video Selected')
                                ],
                              ),
                            ),
                            customVerticalGap(20),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    // color: LightColor.primaryColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    border: Border.all(
                                        width: 1,
                                        color: LightColor.primaryColor),
                                  ),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: customWidth(50),
                                        height: customHeight(40),
                                        child: Text(
                                          "Cancels",
                                          style: AppTheme.h3Style,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: LightColor.primaryColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    border: Border.all(
                                        width: 1,
                                        color: LightColor.primaryColor),
                                  ),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        if (controller.questionEnglishController.text != "" &&
                                            controller
                                                    .questionGermanController.text !=
                                                "" &&
                                            controller
                                                    .questionCzechController.text !=
                                                "" &&
                                            controller
                                                    .discriptionCzechController
                                                    .text !=
                                                "" &&
                                            controller
                                                    .discriptionEnglishController
                                                    .text !=
                                                "" &&
                                            controller
                                                    .discriptionGermanController
                                                    .text !=
                                                "") {
                                          if (base64StringVDO.isNotEmpty) {
                                            QualityQuestionEditController
                                                    .base64StringVDO =
                                                base64StringVDO;
                                          } else if (QualityQuestionEditController
                                              .covert64video.isNotEmpty) {
                                            QualityQuestionEditController
                                                    .base64StringVDO =
                                                QualityQuestionEditController
                                                    .covert64video;
                                          } else {
                                            QualityQuestionEditController
                                                .base64StringVDO
                                                .clear();
                                          }
                                          if (selectedimagesin64bytes
                                              .isNotEmpty) {
                                            QualityQuestionEditController
                                                    .selectedimagesin64bytes =
                                                selectedimagesin64bytes;
                                          } else if (QualityQuestionEditController
                                              .selectedimagesinbase64listfromurl
                                              .isNotEmpty) {
                                            QualityQuestionEditController
                                                    .selectedimagesin64bytes =
                                                QualityQuestionEditController
                                                    .selectedimagesinbase64listfromurl;
                                          } else {
                                            QualityQuestionEditController
                                                .selectedimagesin64bytes
                                                .clear();
                                          }
                                          controller
                                              .putEditQuestionDetails(
                                                  // vdo: base64StringVDO.first,

                                                  screenName: screenName)
                                              .then((value) {
                                            Get.back();
                                            Get.back();

                                            QualityQuestionEditController
                                                .productId = null;
                                          }).then((value) {
                                            setState(() {
                                              screenName == 'Quality'
                                                  ? Get.find<
                                                          HomeScreenController>()
                                                      .setHomeScreen(
                                                          'Quality Plan')
                                                  : Get.find<
                                                          HomeScreenController>()
                                                      .setHomeScreen(
                                                          'ASSEMBLY PLAN');
                                            });
                                          });

                                          // if (base64StringVDO.isNotEmpty) {
                                          //   controller
                                          //       .putEditQuestionDetails(
                                          //           // vdo: base64StringVDO.first,

                                          //           screenName: screenName)
                                          //       .then((value) {
                                          //     Get.back();
                                          //     Get.back();

                                          //     QualityQuestionEditController
                                          //         .productId = null;
                                          //   }).then((value) {
                                          //     setState(() {
                                          //       screenName == 'Quality'
                                          //           ? Get.find<HomeScreenController>()
                                          //               .setHomeScreen('Quality Plan')
                                          //           : Get.find<HomeScreenController>()
                                          //               .setHomeScreen(
                                          //                   'ASSEMBLY PLAN');
                                          //     });
                                          //   });
                                          // } else {
                                          //   controller
                                          //       .putEditQuestionDetails(
                                          //           // vdo: '',
                                          //            screenName: screenName)
                                          //       .then((value) {
                                          //     Get.back();
                                          //     Get.back();

                                          //     QualityQuestionEditController
                                          //         .productId = null;
                                          //   }).then((value) {
                                          //     setState(() {
                                          //       screenName == 'Quality'
                                          //           ? Get.find<HomeScreenController>()
                                          //               .setHomeScreen('Quality Plan')
                                          //           : Get.find<HomeScreenController>()
                                          //               .setHomeScreen(
                                          //                   'ASSEMBLY PLAN');
                                          //     });
                                          //   });
                                          // }
                                          // showSnackBar(
                                          //     message:
                                          //         'Question edited successfully');
                                        } else {
                                          showSnackBar(
                                              message:
                                                  'Please Provid Required Fields');
                                        }
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: customWidth(50),
                                        height: customHeight(40),
                                        child: Text(
                                          "Submit",
                                          style: TextStyle(
                                              fontSize: customFontSize(5),
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            customVerticalGap(20),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ));
            }));
  }
}
