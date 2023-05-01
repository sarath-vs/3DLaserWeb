import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laser_tech_app/presentation/widgets/snackbar.dart';
import '../../application/assembly_controller/assembly_controller.dart';
import '../../application/quality_products_controller/quality_product_controller.dart';
import '../../application/tools_controller/tools_controller.dart';
import '../../domain/responsive/dimensions.dart';
import '../theme/color.dart';
import '../theme/theme.dart';

class AssemblyQuestionAddScreen extends StatefulWidget {
  static const routeName = 'AssemblyQuestionAddScreen';
  const AssemblyQuestionAddScreen({super.key});

  @override
  State<AssemblyQuestionAddScreen> createState() => _AssemblyQuestionAddScreenState();
}

class _AssemblyQuestionAddScreenState extends State<AssemblyQuestionAddScreen> {
  bool yesno = false;
  bool yesnoManditory = false;
  bool yesnoNone = false;
  bool yesnoNoneManditory = false;
  bool dropdown = false;
  bool dropDownManditory = false;
  bool inputText = false;
  bool inputTextManditory = false;
  bool image = false;
  bool imageManditory = false;
  bool range = false;
  bool rangeManditory = false;
  bool number = false;
  bool numberManditory = false;
  bool vdo = false;
  bool vdoManditory = false;
  String rangeFrom = '';
  String rangeTo = '';
  String dropDownDataEnglish = '';
  String dropDownDataCzech = '';
  String dropDownDataViatnam = '';
  List<int> selectedID = [];
  String? questionEnglish;
  String? questionCzech;
  String? questionGerman;
  String? discriptionEnglish;
  String? discriptionCzech;
  String? discriptionGerman;
  List<bool> _checkedItems = [];
  List<int> indexList = [];

  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();

  PlatformFile? objFile;

  String selctFile = '';

  Uint8List? selectedvideoInBytes;
  List<Uint8List> pickedImagesInBytes = [];
  List<String> selectedimages = [];
  List<String> selectedimagesin64bytes = [];
  String selectedvideo = "";
  var filePath = '';
  String? selectfilepath;
  List<String> base64StringVDO = [];

  int imageCounts = 0;
  _selectvideoFile(bool imageFrom) async {
    FilePickerResult? fileResult =
        await FilePicker.platform.pickFiles(allowMultiple: true,type: FileType.video);

    if (fileResult != null) {
      if (fileResult.files.first.size <=
          5851340) //size checking file this is for 5 mb
      {
       // selctFile = fileResult.files.first.name;
       // selectfilepath = fileResult.files.first.identifier;

        fileResult.files.forEach((element) {
        setState(() {
          base64StringVDO.add( base64.encode(element.bytes!));
          //base64StringVDO.add(element.name);
         // selectedimagesin64bytes.add(base64.encode(element.bytes!));
          //selectedImageInBytes = fileResult.files.first.bytes;
          //imageCounts += 1;
        });
      });

        // setState(() {
        //   selectedvideo = selctFile;

        //   selectedvideoInBytes = fileResult.files.first.bytes;
        //   base64StringVDO.add( base64.encode(selectedvideoInBytes!));
        //   // imageCounts += 1;
        // });
        print("*********" +
            base64StringVDO.first +
            "**********"); //this is video byte string
      } else {
        print("5mb less video provide");
      }
    }
  }

  _selectedimages(bool imageFrom) async {
    FilePickerResult? fileResult = await FilePicker.platform
        .pickFiles(allowMultiple: true, type: FileType.image);

    if (fileResult != null) {
      selctFile = fileResult.files.first.name;
      fileResult.files.forEach((element) {
        setState(() {
          pickedImagesInBytes.add(element.bytes as Uint8List);
          selectedimages.add(element.name);
          selectedimagesin64bytes.add(base64.encode(element.bytes!));
          //selectedImageInBytes = fileResult.files.first.bytes;
          imageCounts += 1;
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

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      Get.find<ToolsController>().getTools().then((value) {
        if (_checkedItems.isEmpty) {
          _checkedItems =
              List.filled(Get.find<ToolsController>().toolsList.length, false);
        }
      });
    });
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Add Questions",
            textAlign: TextAlign.center,
            style: AppTheme.appBarText,
          ),
        ),
        // drawer: SideMenu(),
        body: GetBuilder<AssemblyProductController>(
            id: Get.find<AssemblyProductController>().assemblyProductID,
            builder: (controller) {
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
                                  "Question Title",
                                  style: AppTheme.h8Style,
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Question in English', style: AppTheme.h9Style,),
                                  TextFormField(
                                    validator: (val) {
                                      return null;
                                    },
                                    onChanged: (value) {
                                      questionEnglish = value;
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Questions English (optional)",

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
                                   Text('Question in Czech', style: AppTheme.h9Style,),
                                  TextFormField(
                                    validator: (val) {
                                      return null;
                                    },
                                    onChanged: (value) {
                                      questionCzech = value;
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Questions Czech (optional)",

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
                                    Text('Question in Vietnam', style: AppTheme.h9Style,),
                                  TextFormField(
                                    validator: (val) {
                                      return null;
                                    },
                                    onChanged: (value) {
                                      questionGerman = value;
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Questions Vietnam (optional)",

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
                              "Description  in English",
                              style: AppTheme.h9Style,
                            ),
                                  TextFormField(
                                    validator: (val) {
                                      return null;
                                    },
                                    keyboardType: TextInputType.multiline,
  maxLines: null,
                                    onChanged: (value) {
                                      discriptionEnglish = value;
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Questions Description English (optional)",

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
                              "Description  in Czech",
                              style: AppTheme.h9Style,
                            ),
                                  TextFormField(
                                    validator: (val) {
                                      return null;
                                    },
                                    keyboardType: TextInputType.multiline,
  maxLines: null,
                                    onChanged: (value) {
                                      discriptionCzech = value;
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Questions Description Czech (optional)",

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
                              "Description in Vietnam",
                              style: AppTheme.h9Style,
                            ),
                                  TextFormField(
                                    validator: (val) {
                                      return null;
                                    },
                                    keyboardType: TextInputType.multiline,
  maxLines: null,
                                    onChanged: (value) {
                                      discriptionGerman = value;
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Questions Description Vietnam (optional)",

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
                               
                          
                                InkWell(
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
                                            var height = MediaQuery.of(context)
                                                .size
                                                .height;
                                            var width = MediaQuery.of(context)
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
                                                      return ListView.separated(
                                                          //scrollDirection: Axis.vertical,
                                                          //physics: NeverScrollableScrollPhysics(),
                                                          shrinkWrap: true,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return ListTile(
                                                              onTap: () {
                                                                // Navigator.pushNamed(
                                                                //     context, ScreenToolsADD.routeName);
                                                              },
                                                              tileColor: Colors
                                                                  .blue
                                                                  .withOpacity(
                                                                      .3),
                                                              leading: Text(
                                                                  '${index + 1}'),
                                                              title: Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    flex: 3,
                                                                    child: SizedBox(
                                                                        width: customWidth(40),
                                                                        height: customHeight(100),
                                                                        child: Image.network(
                                                                          '${controller.toolsList[index].image}',
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        )),
                                                                  ),
                                                                  customHorizontalGap(
                                                                      10),
                                                                  Expanded(
                                                                    flex: 6,
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        customVerticalGap(
                                                                            10),
                                                                        Text(
                                                                          '${controller.toolsList[index].name}',
                                                                          style:
                                                                              TextStyle(fontWeight: FontWeight.bold),
                                                                        ),
                                                                        Text(
                                                                            '${controller.toolsList[index].description}'),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Checkbox(
                                                                          value:
                                                                              _checkedItems[index],
                                                                          checkColor:
                                                                              Colors.white, // color of tick Mark
                                                                          activeColor:
                                                                              LightColor.primaryColor,
                                                                          onChanged:
                                                                              (bool? value) {
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
                                                              (context, index) {
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
                                                  MainAxisAlignment.spaceAround,
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
                                                            customFontSize(6)),
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
                                                      if (_checkedItems[i]) {
                                                        int k = Get.find<
                                                                ToolsController>()
                                                            .toolsList[i]
                                                            .id!;
                                                        selectedID.add(k);
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
                                                            customFontSize(6)),
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
                                    decoration: BoxDecoration(
                                      color: LightColor.orange,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      border: Border.all(
                                          width: 1,
                                          color: LightColor.primaryColor),
                                    ),
                                    child: Text(
                                      "Select Tools",
                                      style: TextStyle(
                                          fontSize: customFontSize(3),
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'Select Answer Type ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
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
                                // Expanded(
                                //     flex: 1,
                                //     child: Text(
                                //       'Manditory',
                                //       textAlign: TextAlign.center,
                                //       style: TextStyle(
                                //         fontWeight: FontWeight.bold,
                                //         fontSize: customFontSize(
                                //           4,
                                //         ),
                                //       ),
                                //     )),
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
                                    value: yesno,
                                    checkColor:
                                        Colors.white, // color of tick Mark
                                    activeColor: LightColor.primaryColor,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        yesno = !yesno;
                                        yesnoManditory = false;
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text('Yes/No'),
                                ),
                                Expanded(flex: 3, child: Text('Yes or No')),
                                // Expanded(
                                //   flex: 1,
                                //   child: Checkbox(
                                //     value: yesnoManditory,
                                //     checkColor:
                                //         Colors.white, // color of tick Mark
                                //     activeColor: LightColor.primaryColor,
                                //     onChanged: (bool? value) {
                                //       setState(() {
                                //         if (yesno) {
                                //           yesnoManditory = !yesnoManditory;
                                //         }
                                //       });
                                //     },
                                //   ),
                                // ),
                              ],
                            ),
                            ////////
                            ///////
                            //////
                            ///Answer Yes/No/None
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //   children: [
                            //     Expanded(
                            //       flex: 1,
                            //       child: Checkbox(
                            //         value: yesnoNone,
                            //         checkColor:
                            //             Colors.white, // color of tick Mark
                            //         activeColor: LightColor.primaryColor,
                            //         onChanged: (bool? value) {
                            //           setState(() {
                            //             yesnoNone = !yesnoNone;
                            //             yesnoNoneManditory = false;
                            //           });
                            //         },
                            //       ),
                            //     ),
                            //     Expanded(
                            //       flex: 3,
                            //       child: Text('None'),
                            //     ),
                            //     Expanded(
                            //         flex: 3,
                            //         child: Text('Yes, No or None can be used')),
                            //     // Expanded(
                            //     //   flex: 1,
                            //     //   child: Checkbox(
                            //     //     value: yesnoNoneManditory,
                            //     //     checkColor:
                            //     //         Colors.white, // color of tick Mark
                            //     //     activeColor: LightColor.primaryColor,
                            //     //     onChanged: (bool? value) {
                            //     //       setState(() {
                            //     //         if (yesnoNone) {
                            //     //           yesnoNoneManditory =
                            //     //               !yesnoNoneManditory;
                            //     //         }
                            //     //       });
                            //     //     },
                            //     //   ),
                            //     // ),
                            //   ],
                            // ),
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
                                    value: range,
                                    checkColor:
                                        Colors.white, // color of tick Mark
                                    activeColor: LightColor.primaryColor,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        range = !range;
                                        rangeManditory = false;
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text('Range'),
                                ),
                            range==true?    Expanded(
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
                                            rangeFrom = value;
                                          },
                                          decoration: InputDecoration(
                                            hintText: "From",
                                            // border: OutlineInputBorder(
                                            //     borderRadius: BorderRadius.circular(20)),
                                            fillColor: Colors.grey.shade200,
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
                                            hintText: "To",
                                            // border: OutlineInputBorder(
                                            //     borderRadius: BorderRadius.circular(20)),
                                            fillColor: Colors.grey.shade200,
                                            filled: true,
                                            floatingLabelStyle:
                                                AppTheme.h2Style,
                                          ),
                                            
                                            onChanged: (value) {
                                              rangeTo = value;
                                              // double torange =
                                              //     double.parse(value);
                                              // double startrange =
                                              //     double.parse(rangeFrom);
                                                  Future.delayed(Duration(seconds: 4), (){
      if (int.parse(rangeFrom) > int.parse(rangeTo)) {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      AlertDialog(
                                                    title: Text('Error'),
                                                    content: Text(
                                                        'Starting range must lower than ending range'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text('OK'),
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
                                                fillColor: Colors.grey.shade200,
                                                filled: true,
                                                floatingLabelStyle:
                                                    AppTheme.h2Style,
                                              );
                                            }),
                                      ),
                                    ],
                                  ),
                                ):Expanded(flex: 3,child: SizedBox()),
                                // Expanded(
                                //   flex: 1,
                                //   child: Checkbox(
                                //     value: rangeManditory,
                                //     checkColor:
                                //         Colors.white, // color of tick Mark
                                //     activeColor: LightColor.primaryColor,
                                //     onChanged: (bool? value) {
                                //       setState(() {
                                //         if (range) {
                                //           rangeManditory = !rangeManditory;
                                //         }
                                //       });
                                //     },
                                //   ),
                                // ),
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
                                    value: inputText,
                                    checkColor:
                                        Colors.white, // color of tick Mark
                                    activeColor: LightColor.primaryColor,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        inputText = !inputText;
                                        inputTextManditory = false;
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
                                // Expanded(
                                //   flex: 1,
                                //   child: Checkbox(
                                //     value: inputTextManditory,
                                //     checkColor:
                                //         Colors.white, // color of tick Mark
                                //     activeColor: LightColor.primaryColor,
                                //     onChanged: (bool? value) {
                                //       setState(() {
                                //         if (inputText) {
                                //           inputTextManditory =
                                //               !inputTextManditory;
                                //         }
                                //       });
                                //     },
                                //   ),
                                // ),
                              ],
                            ), ////////
                            ///////
                            //////
                            ///Answer Number
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //   children: [
                            //     Expanded(
                            //       flex: 1,
                            //       child: Checkbox(
                            //         value: number,
                            //         checkColor: Colors.white, // color of tick Mark
                            //         activeColor: LightColor.primaryColor,
                            //         onChanged: (bool? value) {
                            //           setState(() {
                            //             number = !number;
                            //             numberManditory = false;
                            //           });
                            //         },
                            //       ),
                            //     ),
                            //     Expanded(
                            //       flex: 3,
                            //       child: Text('Number Field'),
                            //     ),
                            //     Row(
                            //       // crossAxisAlignment: CrossAxisAlignment.start,
                            //       // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //       children: [
                            //         SizedBox(
                            //           width: customWidth(10),
                            //           height: customHeight(30),
                            //           child: TextFormField(
                            //             validator: (val) {
                            //               return null;
                            //             },
                            //             onChanged: (value) {
                            //               // password = value;
                            //             },
                            //             decoration: InputDecoration(
                            //               hintText: "answer",
                            //               // border: OutlineInputBorder(
                            //               //     borderRadius: BorderRadius.circular(20)),
                            //               fillColor: Colors.grey.shade200,
                            //               filled: true,
                            //               floatingLabelStyle: AppTheme.h2Style,
                            //             ),
                            //           ),
                            //         ),
                            //         Text('OR'),
                            //         Text('Any'),
                            //         Padding(
                            //           padding: const EdgeInsets.only(right: 50),
                            //           child: Checkbox(
                            //             value: numberManditory,
                            //             checkColor: Colors.white, // color of tick Mark
                            //             activeColor: LightColor.primaryColor,
                            //             onChanged: (bool? value) {
                            //               setState(() {
                            //                 if (number) {
                            //                   numberManditory = !numberManditory;
                            //                 }
                            //               });
                            //             },
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //     Expanded(flex: 3, child: Text('Accept Only Numbers')),
                            //     Expanded(
                            //       flex: 1,
                            //       child: Checkbox(
                            //         value: numberManditory,
                            //         checkColor: Colors.white, // color of tick Mark
                            //         activeColor: LightColor.primaryColor,
                            //         onChanged: (bool? value) {
                            //           setState(() {
                            //             if (number) {
                            //               numberManditory = !numberManditory;
                            //             }
                            //           });
                            //         },
                            //       ),
                            //     ),
                            //   ],
                            // ),
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
                                    value: dropdown,
                                    checkColor:
                                        Colors.white, // color of tick Mark
                                    activeColor: LightColor.primaryColor,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        dropdown = !dropdown;
                                        dropDownManditory = false;
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text('DropDown'),
                                ),
                           dropdown==true?     Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Text('English', style: AppTheme.h9Style,),
                                      TextFormField(
                                        keyboardType: TextInputType.multiline,
                                        minLines: 1,
                                        maxLines: 7,
                                        validator: (val) {
                                          return null;
                                        },
                                        onChanged: (value) {
                                          dropDownDataEnglish = value;
                                        },
                                        decoration: InputDecoration(
                                          hintText:
                                              "Add Drop Down Values in English.(eg:one||Two||Three)",
                                          hintStyle: TextStyle(
                                              fontSize: customFontSize(4)),
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          floatingLabelStyle: AppTheme.h2Style,
                                        ),
                                      ),
                                        Text('Czech', style: AppTheme.h9Style,),
                                      TextFormField(
                                        keyboardType: TextInputType.multiline,
                                        minLines: 1,
                                        maxLines: 7,
                                        validator: (val) {
                                          return null;
                                        },
                                        onChanged: (value) {
                                          dropDownDataCzech = value;
                                        },
                                        decoration: InputDecoration(
                                          hintText:
                                              "Add Drop Down Values in Czech.(eg:one||Two||Three)",
                                          hintStyle: TextStyle(
                                              fontSize: customFontSize(4)),
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          floatingLabelStyle: AppTheme.h2Style,
                                        ),
                                      ),
                                        Text('Vietnam', style: AppTheme.h9Style,),
                                      TextFormField(
                                        keyboardType: TextInputType.multiline,
                                        minLines: 1,
                                        maxLines: 7,
                                        validator: (val) {
                                          return null;
                                        },
                                        onChanged: (value) {
                                          dropDownDataViatnam = value;
                                        },
                                        decoration: InputDecoration(
                                          hintText:
                                              "Add Drop Down Values in Vietnam.(eg:one||Two||Three)",
                                          hintStyle: TextStyle(
                                              fontSize: customFontSize(4)),
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          floatingLabelStyle: AppTheme.h2Style,
                                        ),
                                      ),
                                    ],
                                  ),
                                ):Expanded(flex:3,child: SizedBox()),
                               
                               
                              ],
                            ),
                            ////////
                            ///////
                            //////
                            ///Answer Image
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Checkbox(
                                    value: image,
                                    checkColor:
                                        Colors.white, // color of tick Mark
                                    activeColor: LightColor.primaryColor,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        image = !image;
                                        imageManditory = false;
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
                                // Expanded(
                                //   flex: 1,
                                //   child: Checkbox(
                                //     value: imageManditory,
                                //     checkColor:
                                //         Colors.white, // color of tick Mark
                                //     activeColor: LightColor.primaryColor,
                                //     onChanged: (bool? value) {
                                //       setState(() {
                                //         if (image) {
                                //           imageManditory = !imageManditory;
                                //         }
                                //       });
                                //     },
                                //   ),
                                // ),
                              ],
                            ),

                            // // Numerictype(),
                            // // predefinedtype(),
                            // yesornotype(),
                            //   ImagePickerWidget(),
                                    customVerticalGap(20),Text('Image Upload',style: TextStyle(fontWeight: FontWeight.bold),),

                            Container(height: customHeight(150),width: double.infinity,color: Colors.white,child: Row(
                              children: [
                               Padding(
                                 padding: const EdgeInsets.only(left:8.0,right: 8),
                                 child: GestureDetector(onTap: (){
                                    _selectedimages(true);

                                 },child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.grey.shade300),height: customHeight(130),width: customWidth(40),child: Icon(Icons.add,color: Colors.black,size: customHeight(50),),)),
                               ),
                            pickedImagesInBytes.length>0?    ListView.builder(
                                  shrinkWrap: true,
              itemCount: pickedImagesInBytes.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      
                     
                      SizedBox(height: customHeight(140),child: Image.memory(pickedImagesInBytes[index])),
                       GestureDetector(
                        onTap: (){
                          setState(() {
                                   pickedImagesInBytes.removeAt(index);
                            
                          });
                       
                        },
                         child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey.withOpacity(.5)),child: Padding(
                           padding: const EdgeInsets.all(2.0),
                           child: Icon(Icons.close,color: Colors.red,),
                         )),
                       ),
                    ],
                  ),
                );
              },
            ):Text('No Image Selected')
                              ],
                            ),),
                              customVerticalGap(20),Text('Video Upload',style: TextStyle(fontWeight: FontWeight.bold),),

                            Container(height: customHeight(150),width: double.infinity,color: Colors.white,child: Row(
                              children: [
                               Padding(
                                 padding: const EdgeInsets.only(left:8.0,right: 8),
                                 child: GestureDetector(onTap: (){
                                     _selectvideoFile(true);

                                 },child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.grey.shade300),height: customHeight(130),width: customWidth(40),child: Icon(Icons.add,color: Colors.black,size: customHeight(50),),)),
                               ),
                            base64StringVDO.length>0?    ListView.builder(
                                  shrinkWrap: true,
              itemCount: base64StringVDO.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      
                     
                      SizedBox(height: customHeight(140),child: Text('Video ${index+1}')),
                       GestureDetector(
                        onTap: (){
                          setState(() {
                                   base64StringVDO.removeAt(index);
                            
                          });
                       
                        },
                         child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey.withOpacity(.5)),child: Padding(
                           padding: const EdgeInsets.all(2.0),
                           child: Icon(Icons.close,color: Colors.red,),
                         )),
                       ),
                    ],
                  ),
                );
              },
            ):Text('No Video Selected')
                              ],
                            ),),
                            customVerticalGap(20),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: customWidth(50),
                                    height: customHeight(40),
                                    decoration: BoxDecoration(
                                      // color: LightColor.primaryColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                      border: Border.all(
                                          width: 1,
                                          color: LightColor.primaryColor),
                                    ),
                                    child: Text(
                                      "Cancels",
                                      style: AppTheme.h3Style,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    final answerField = {
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
                                      "dropDownData": dropDownDataEnglish+'&&'+dropDownDataCzech+'&&'+dropDownDataViatnam
                                    };
                                    final dataToSend = {
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
                                       "category": controller.productId,
                                      "tools_used": selectedID
                                     
                        
                                    };
                                    if (questionEnglish != '' 
                                       ) {
                                      if (range == true) {
                                        if (rangeFrom == '' || rangeTo == '') {
                                          showSnackBar(
                                              message:
                                                  'Please Provide Range Data');
                                        } else {
                                          ////
                                          controller
                                              .postQualityQuestions(
                                                  dataToSend: dataToSend)
                                              .then((value) {
                                            controller
                                                .getAssemblyQuestions(
                                                    id: controller.productId)
                                                .then((value) {
                                              Get.back();
                                            });
                                          });
                                        }
                                      } else if (dropdown == true) {
                                        if (dropDownDataEnglish == ''||dropDownDataCzech==''||dropDownDataViatnam=='') {
                                          showSnackBar(
                                              message:
                                                  'Please Provide DropDown Data');
                                        } else {
                                          ///
                                          controller
                                              .postQualityQuestions(
                                                  dataToSend: dataToSend)
                                              .then((value) {
                                            controller
                                                .getAssemblyQuestions(
                                                    id: controller.productId)
                                                .then((value) {
                                              Get.back();
                                            });
                                          });

////
                                        }
                                      } else {
                                        controller
                                            .postQualityQuestions(
                                                dataToSend: dataToSend)
                                            .then((value) {
                                          controller
                                              .getAssemblyQuestions(
                                                  id: controller.productId)
                                              .then((value) {
                                            Get.back();
                                          });
                                        });
                                      }
                                    } else {
                                      showSnackBar(
                                          message:
                                              'Please Provid Required Fields');
                                    }
                                    print(dataToSend);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: customWidth(50),
                                    height: customHeight(40),
                                    decoration: BoxDecoration(
                                      color: LightColor.primaryColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                      border: Border.all(
                                          width: 1,
                                          color: LightColor.primaryColor),
                                    ),
                                    child: Text(
                                      "Submit",
                                      style: TextStyle(
                                          fontSize: customFontSize(5),
                                          color: Colors.white),
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
