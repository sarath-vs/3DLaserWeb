import 'dart:convert';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laser_tech_app/presentation/widgets/snackbar.dart';
import '../../application/quality_products_controller/quality_product_controller.dart';
import '../../application/tools_controller/tools_controller.dart';
import '../../domain/responsive/dimensions.dart';
import '../theme/color.dart';
import '../theme/theme.dart';

class Qualityquestionform extends StatefulWidget {
  static const routeName = 'Qualityquestionform';
  const Qualityquestionform({super.key});

  @override
  State<Qualityquestionform> createState() => _QualityquestionformState();
}

class _QualityquestionformState extends State<Qualityquestionform> {
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
  String dropDownData = '';
  // String dropDownDataCzech = '';
  // String dropDownDataViatnam = '';
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
  List<Map<String, String>> valuesLists = [];

  int imageCounts = 0;
  _selectvideoFile(bool imageFrom) async {
    FilePickerResult? fileResult = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.video);

    if (fileResult != null) {
      if (fileResult.files.first.size <=
          58513400) //size checking file this is for 5 mb
      {
        // selctFile = fileResult.files.first.name;
        // selectfilepath = fileResult.files.first.identifier;

        fileResult.files.forEach((element) {
          setState(() {
            base64StringVDO.add(base64.encode(element.bytes!));
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
          //selectedImageInBytes = fileResult.files.first.bytes;x
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
        body: GetBuilder<QualityProductController>(
            id: Get.find<QualityProductController>().qualityProductID,
            builder: (controller) {
              return SafeArea(
                  child: ListView(
                children: [
                  // CustomAppBar(context, false, controller.screen),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 45),
                    child: Container(
                      height: customHeight(1300),
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
                            SizedBox(
                              width: customWidth(400),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Question in English',
                                    style: AppTheme.h9Style,
                                  ),
                                  TextFormField(
                                    validator: (val) {
                                      return null;
                                    },
                                    onChanged: (value) {
                                      var englishqp =
                                          (utf8.encode(value)).toString();
                                      questionEnglish = englishqp;
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Questions English *",

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
                                    'Question in Czech',
                                    style: AppTheme.h9Style,
                                  ),
                                  TextFormField(
                                    validator: (val) {
                                      return null;
                                    },
                                    onChanged: (value) {
                                      var czechqp =
                                          (utf8.encode(value)).toString();
                                      questionCzech = czechqp;
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Questions Czech *",

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
                                    'Question in Vietnam',
                                    style: AppTheme.h9Style,
                                  ),
                                  TextFormField(
                                    validator: (val) {
                                      return null;
                                    },
                                    onChanged: (value) {
                                      var germanqp =
                                          (utf8.encode(value)).toString();
                                      questionGerman = germanqp;
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Questions Vietnam *",

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
                                      var englishdis =
                                          (utf8.encode(value)).toString();
                                      discriptionEnglish = englishdis;

                                      // discriptionEnglish = value;
                                    },
                                    decoration: InputDecoration(
                                      hintText:
                                          "Questions Description English *",

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
                                      var czechdis =
                                          (utf8.encode(value)).toString();
                                      discriptionCzech = czechdis;
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Questions Description Czech *",

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
                                      var germandis =
                                          (utf8.encode(value)).toString();
                                      discriptionGerman = germandis;
                                    },
                                    decoration: InputDecoration(
                                      hintText:
                                          "Questions Description Vietnam *",

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
                              ],
                            ),
                            ////////
                            ///////
                            //////
                            ///Answer Yes/No/None

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
                                range == true
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
                                                  rangeFrom = value;
                                                },
                                                decoration: InputDecoration(
                                                  hintText: "From",
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
                                                    hintText: "To",
                                                    // border: OutlineInputBorder(
                                                    //     borderRadius: BorderRadius.circular(20)),
                                                    fillColor:
                                                        Colors.grey.shade200,
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
                                                    Future.delayed(
                                                        Duration(seconds: 4),
                                                        () {
                                                      if (int.parse(rangeFrom) >
                                                          int.parse(rangeTo)) {
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
                              ],
                            ), ////////
                            ///////
                            //////
                            ///Answer Number

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
                                dropdown == true
                                    ? Expanded(
                                        flex: 3,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextButton(
                                                style: TextButton.styleFrom(
                                                  side: BorderSide(
                                                      color: LightColor
                                                          .primaryColor),
                                                ),
                                                onPressed: () {
                                                  showDialog(
                                                    barrierDismissible: false,
                                                    context: context,
                                                    builder: (_) => AlertDialog(
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      20.0))),
                                                      content: Builder(
                                                        builder: (context) {
                                                          // Get available height and width of the build area of this widget. Make a choice depending on the size.
                                                          var height =
                                                              MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height;
                                                          var width =
                                                              MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width;

                                                          return SizedBox(
                                                            height:
                                                                height - 300,
                                                            width: width - 500,
                                                            child: Center(
                                                              child: GetBuilder<
                                                                      QualityProductController>(
                                                                  id: Get.find<
                                                                          QualityProductController>()
                                                                      .qualityProductID,
                                                                  builder:
                                                                      (controller) {
                                                                    return SingleChildScrollView(
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: <Widget>[
                                                                            Obx(
                                                                              () => Column(children: [
                                                                                for (int index = 0; index < controller.formFields.length; index++)
                                                                                  Column(
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text('Form' + (index + 1).toString()),
                                                                                      customVerticalGap(10),
                                                                                      controller.formFields[index],
                                                                                      customVerticalGap(10),
                                                                                      IconButton(
                                                                                          onPressed: () {
                                                                                            controller.removeFormField(index);
                                                                                          },
                                                                                          icon: Icon(Icons.playlist_remove_outlined))
                                                                                    ],
                                                                                  ),
                                                                              ]),
                                                                            ),
                                                                            SizedBox(height: 10),
                                                                            ElevatedButton(
                                                                              onPressed: () {
                                                                                controller.addFormFields();
                                                                              },
                                                                              child: Text('Add Fields'),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                      actions: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  bottom: 50),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              TextButton(
                                                                onPressed: () {
                                                                  if (controller
                                                                      .validateForm()) {
                                                                    valuesLists =
                                                                        controller
                                                                            .getFormValues();

                                                                    for (final values
                                                                        in valuesLists) {
                                                                      print(
                                                                          'Form Values: $values');
                                                                    }
                                                                    print(
                                                                        "*******************");
                                                                    dropDownData =
                                                                        valuesLists
                                                                            .toString();
                                                                    print(valuesLists
                                                                        .toString());
                                                                    print(
                                                                        "+++++++++++++++++++++++++++++++++++");

                                                                    Get.back();
                                                                  } else {
                                                                    Get.snackbar(
                                                                        'Validation Error',
                                                                        'Please fill out all fields.');
                                                                  }
                                                                },
                                                                child: Text(
                                                                  'Confirm',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .red,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
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
                                                child: Text("ADD/REMOVE"))
                                          ],
                                        ),
                                      )
                                    : Expanded(flex: 3, child: SizedBox()),
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
                              ],
                            ),

                            customVerticalGap(20),
                            Text(
                              'Image Upload',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),

                            Container(
                              height: customHeight(150),
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
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.black,
                                                size: customHeight(50),
                                              ),
                                            )),
                                      ),
                                    ),
                                  ),
                                  pickedImagesInBytes.length > 0
                                      ? Expanded(
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount:
                                                pickedImagesInBytes.length,
                                            physics:
                                                AlwaysScrollableScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: Stack(
                                                  children: [
                                                    SizedBox(
                                                        height:
                                                            customHeight(140),
                                                        child: Image.memory(
                                                            pickedImagesInBytes[
                                                                index])),
                                                    Material(
                                                      color: Colors.transparent,
                                                      child: InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            pickedImagesInBytes
                                                                .removeAt(
                                                                    index);
                                                            selectedimagesin64bytes
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
                                  base64StringVDO.length > 0
                                      ? ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: base64StringVDO.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Stack(
                                                children: [
                                                  SizedBox(
                                                      height: customHeight(140),
                                                      child: Text(
                                                          'Video ${index + 1}')),
                                                  Material(
                                                    color: Colors.transparent,
                                                    child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          base64StringVDO
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
                                          "dropDownData": dropDownData
                                        };

                                        final dataToSend = {
                                          "description_english":
                                              discriptionEnglish,
                                          "description_czech": discriptionCzech,
                                          "description_german":
                                              discriptionGerman,
                                          "image_base_64":
                                              selectedimagesin64bytes,
                                          "video_base_64": base64StringVDO,
                                          "question_english": questionEnglish,
                                          "question_czech": questionCzech,
                                          "question_german": questionGerman,
                                          "time_limit": 0,
                                          "field_info_object": answerField,
                                          "category": controller.productId,
                                          "tools_used": selectedID
                                        };
                                        if (questionEnglish != null &&
                                            questionCzech != null &&
                                            questionGerman != null &&
                                            discriptionEnglish != null &&
                                            discriptionCzech != null &&
                                            discriptionGerman != null) {
                                          if (questionEnglish != "[]" &&
                                              questionCzech != "[]" &&
                                              questionGerman != "[]" &&
                                              discriptionEnglish != "[]" &&
                                              discriptionCzech != "[]" &&
                                              discriptionGerman != "[]") {
                                            if (range == true) {
                                              if (rangeFrom == '' ||
                                                  rangeTo == '') {
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
                                                      .getQualityQuestions(
                                                          id: controller
                                                              .productId)
                                                      .then((value) {
                                                    Get.back();
                                                  });
                                                });
                                              }
                                            } else if (dropdown == true) {
                                              if (dropDownData == '') {
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
                                                      .getQualityQuestions(
                                                          id: controller
                                                              .productId)
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
                                                    .getQualityQuestions(
                                                        id: controller
                                                            .productId)
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
                                        } else {
                                          showSnackBar(
                                              message:
                                                  'Please Provid Required Fields');
                                        }
                                        print(dataToSend);
                                      },
                                      child: Container(
                                        width: customWidth(50),
                                        height: customHeight(40),
                                        alignment: Alignment.center,
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
