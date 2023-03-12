import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laser_tech_app/presentation/07_Screen_quality_questions_modify/widget/qualityqp_image_uploading_widget.dart';

import '../../application/home_screen_controller/controller.dart';
import '../../domain/responsive/dimensions.dart';
import '../04_Screen_quality_control_properties/widget/image_uploading_widget.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add/Edit Questions",
          textAlign: TextAlign.center,
          style: AppTheme.appBarText,
        ),
      ),
      // drawer: SideMenu(),
      body: SafeArea(
          child: ListView(
        children: [
          // CustomAppBar(context, false, controller.screen),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 45),
            child: Container(
              height: customHeight(600),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Question Details",
                          style: AppTheme.h8Style,
                        ),
                        Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: customHeight(20),
                        )
                      ],
                    ),

                    SizedBox(
                      width: customWidth(400),
                      child: TextFormField(
                        validator: (val) {
                          return null;
                        },
                        onChanged: (value) {
                          // password = value;
                        },
                        decoration: InputDecoration(
                          hintText: "Questions*",

                          // border: OutlineInputBorder(
                          //     borderRadius: BorderRadius.circular(20)),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          floatingLabelStyle: AppTheme.h2Style,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        customHorizontalGap(50),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            width: customWidth(35),
                            height: customHeight(30),
                            decoration: BoxDecoration(
                              color: LightColor.orange,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              border: Border.all(
                                  width: 1, color: LightColor.primaryColor),
                            ),
                            child: Text(
                              "Upload Images",
                              style: TextStyle(
                                  fontSize: customFontSize(3),
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        customHorizontalGap(20),
                        InkWell(
                          onTap: () {
                            Get.back();
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
                                  width: 1, color: LightColor.primaryColor),
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
                        Expanded(
                            flex: 1,
                            child: Text(
                              'Manditory',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: customFontSize(
                                  4,
                                ),
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
                            checkColor: Colors.white, // color of tick Mark
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
                        Expanded(
                          flex: 1,
                          child: Checkbox(
                            value: yesnoManditory,
                            checkColor: Colors.white, // color of tick Mark
                            activeColor: LightColor.primaryColor,
                            onChanged: (bool? value) {
                              setState(() {
                                if (yesno) {
                                  yesnoManditory = !yesnoManditory;
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    ////////
                    ///////
                    //////
                    ///Answer Yes/No/None
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Checkbox(
                            value: yesnoNone,
                            checkColor: Colors.white, // color of tick Mark
                            activeColor: LightColor.primaryColor,
                            onChanged: (bool? value) {
                              setState(() {
                                yesnoNone = !yesnoNone;
                                yesnoNoneManditory = false;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text('Yes/No/None'),
                        ),
                        Expanded(
                            flex: 3,
                            child: Text('Yes, No or None can be used')),
                        Expanded(
                          flex: 1,
                          child: Checkbox(
                            value: yesnoNoneManditory,
                            checkColor: Colors.white, // color of tick Mark
                            activeColor: LightColor.primaryColor,
                            onChanged: (bool? value) {
                              setState(() {
                                if (yesnoNone) {
                                  yesnoNoneManditory = !yesnoNoneManditory;
                                }
                              });
                            },
                          ),
                        ),
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
                            value: range,
                            checkColor: Colors.white, // color of tick Mark
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
                        Expanded(
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
                                    // password = value;
                                  },
                                  decoration: InputDecoration(
                                    hintText: "From",
                                    // border: OutlineInputBorder(
                                    //     borderRadius: BorderRadius.circular(20)),
                                    fillColor: Colors.grey.shade200,
                                    filled: true,
                                    floatingLabelStyle: AppTheme.h2Style,
                                  ),
                                ),
                              ),
                              Text(
                                "TO ",
                                style: AppTheme.h6Style,
                              ),
                              SizedBox(
                                width: customWidth(30),
                                height: customHeight(30),
                                child: TextFormField(
                                  validator: (val) {
                                    return null;
                                  },
                                  onChanged: (value) {
                                    // password = value;
                                  },
                                  decoration: InputDecoration(
                                    hintText: "To",
                                    // border: OutlineInputBorder(
                                    //     borderRadius: BorderRadius.circular(20)),
                                    fillColor: Colors.grey.shade200,
                                    filled: true,
                                    floatingLabelStyle: AppTheme.h2Style,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Checkbox(
                            value: rangeManditory,
                            checkColor: Colors.white, // color of tick Mark
                            activeColor: LightColor.primaryColor,
                            onChanged: (bool? value) {
                              setState(() {
                                if (range) {
                                  rangeManditory = !rangeManditory;
                                }
                              });
                            },
                          ),
                        ),
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
                            checkColor: Colors.white, // color of tick Mark
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
                        Expanded(flex: 3, child: Text('Accept Text or Number')),
                        Expanded(
                          flex: 1,
                          child: Checkbox(
                            value: inputTextManditory,
                            checkColor: Colors.white, // color of tick Mark
                            activeColor: LightColor.primaryColor,
                            onChanged: (bool? value) {
                              setState(() {
                                if (inputText) {
                                  inputTextManditory = !inputTextManditory;
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ), ////////
                    ///////
                    //////
                    ///Answer Number
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Checkbox(
                            value: number,
                            checkColor: Colors.white, // color of tick Mark
                            activeColor: LightColor.primaryColor,
                            onChanged: (bool? value) {
                              setState(() {
                                number = !number;
                                numberManditory = false;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text('Number Field'),
                        ),
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: customWidth(10),
                              height: customHeight(30),
                              child: TextFormField(
                                validator: (val) {
                                  return null;
                                },
                                onChanged: (value) {
                                  // password = value;
                                },
                                decoration: InputDecoration(
                                  hintText: "answer",
                                  // border: OutlineInputBorder(
                                  //     borderRadius: BorderRadius.circular(20)),
                                  fillColor: Colors.grey.shade200,
                                  filled: true,
                                  floatingLabelStyle: AppTheme.h2Style,
                                ),
                              ),
                            ),
                            Text('OR'),
                            Text('Any'),
                            Padding(
                              padding: const EdgeInsets.only(right: 50),
                              child: Checkbox(
                                value: numberManditory,
                                checkColor: Colors.white, // color of tick Mark
                                activeColor: LightColor.primaryColor,
                                onChanged: (bool? value) {
                                  setState(() {
                                    if (number) {
                                      numberManditory = !numberManditory;
                                    }
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        Expanded(flex: 3, child: Text('Accept Only Numbers')),
                        Expanded(
                          flex: 1,
                          child: Checkbox(
                            value: numberManditory,
                            checkColor: Colors.white, // color of tick Mark
                            activeColor: LightColor.primaryColor,
                            onChanged: (bool? value) {
                              setState(() {
                                if (number) {
                                  numberManditory = !numberManditory;
                                }
                              });
                            },
                          ),
                        ),
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
                            value: dropdown,
                            checkColor: Colors.white, // color of tick Mark
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
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            keyboardType: TextInputType.multiline,
                            minLines: 1,
                            maxLines: 7,
                            validator: (val) {
                              return null;
                            },
                            onChanged: (value) {
                              // password = value;
                            },
                            decoration: InputDecoration(
                              hintText:
                                  "Add Drop Down Values seperate by ||.(eg:one||Two||Three)",
                              hintStyle: TextStyle(fontSize: customFontSize(4)),
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              floatingLabelStyle: AppTheme.h2Style,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Checkbox(
                            value: dropDownManditory,
                            checkColor: Colors.white, // color of tick Mark
                            activeColor: LightColor.primaryColor,
                            onChanged: (bool? value) {
                              setState(() {
                                if (dropdown) {
                                  dropDownManditory = !dropDownManditory;
                                }
                              });
                            },
                          ),
                        ),
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
                            checkColor: Colors.white, // color of tick Mark
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
                            flex: 3, child: Text('Image file can be uploaded')),
                        Expanded(
                          flex: 1,
                          child: Checkbox(
                            value: imageManditory,
                            checkColor: Colors.white, // color of tick Mark
                            activeColor: LightColor.primaryColor,
                            onChanged: (bool? value) {
                              setState(() {
                                if (image) {
                                  imageManditory = !imageManditory;
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),

                    // // Numerictype(),
                    // // predefinedtype(),
                    // yesornotype(),
                    //   ImagePickerWidget(),
                    customVerticalGap(20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            width: customWidth(50),
                            height: customHeight(40),
                            decoration: BoxDecoration(
                              color: LightColor.primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              border: Border.all(
                                  width: 1, color: LightColor.primaryColor),
                            ),
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  fontSize: customFontSize(5),
                                  color: Colors.white),
                            ),
                          ),
                        ),
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
                                  width: 1, color: LightColor.primaryColor),
                            ),
                            child: Text(
                              "Cancels",
                              style: AppTheme.h3Style,
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
      )),
    );
  }
}
