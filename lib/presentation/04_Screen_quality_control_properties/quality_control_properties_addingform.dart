import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:laser_tech_app/presentation/widgets/snackbar.dart';

import '../../application/quality_products_controller/quality_product_controller.dart';
import '../../domain/responsive/dimensions.dart';
import '../theme/color.dart';
import '../theme/theme.dart';

import 'widget/image_uploading_widget.dart';

class Qualitycontrolproperties extends StatefulWidget {
  static const routeName = 'Qualitycontrolproperties';
  const Qualitycontrolproperties({super.key});

  @override
  State<Qualitycontrolproperties> createState() =>
      _QualitycontrolpropertiesState();
}

String name = '';
String disc = '';
String ipAddress = '';
String portNumber = '';
String printerData = '';
int min = 0;
int sec = 0;

class _QualitycontrolpropertiesState extends State<Qualitycontrolproperties> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((duration) {});
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Add Product",
            textAlign: TextAlign.center,
            style: AppTheme.appBarText,
          ),
        ),
        // drawer: SideMenu(),
        body: GetBuilder<QualityProductController>(builder: (controller) {
          return SafeArea(
              child: ListView(
            shrinkWrap: true,
            children: [
              // CustomAppBar(context, false, controller.screen),

              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 45),
                child: Container(
                  height: customHeight(730),
                  width: customWidth(250),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Product Details",
                          style: AppTheme.h8Style,
                        ),
                        // customVerticalGap(20),
                        Text(
                          "Property Name*",
                          style: AppTheme.h6Style,
                        ),
                        SizedBox(
                          width: customWidth(400),
                          child: TextFormField(
                            validator: (val) {
                              return null;
                            },
                            onChanged: (value) {
                              name = value;
                              // controller.answerField.first.dd = true;
                              // controller.priintAnswerField();
                            },
                            decoration: InputDecoration(
                              hintText: "Property Name*",

                              // border: OutlineInputBorder(
                              //     borderRadius: BorderRadius.circular(20)),
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              floatingLabelStyle: AppTheme.h2Style,
                            ),
                          ),
                        ),
                        Text(
                          "Maximum Time To Complete",
                          style: AppTheme.h6Style,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: customWidth(30),
                              child: TextFormField(
                                validator: (val) {
                                  return null;
                                },
                                onChanged: (value) {
                                  min = int.parse(value);
                                },
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: "Minutes",
                                  // border: OutlineInputBorder(
                                  //     borderRadius: BorderRadius.circular(20)),
                                  fillColor: Colors.grey.shade200,
                                  filled: true,
                                  floatingLabelStyle: AppTheme.h2Style,
                                ),
                              ),
                            ),
                            customHorizontalGap(10),
                            SizedBox(
                              width: customWidth(30),
                              child: TextFormField(
                                validator: (val) {
                                  return null;
                                },
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  sec = int.parse(value);
                                },
                                decoration: InputDecoration(
                                  hintText: "Seconds",
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

                        Text(
                          "Descripiton",
                          style: AppTheme.h6Style,
                        ),
                        SizedBox(
                          // width: customWidth(150),
                          child: TextFormField(
                            keyboardType: TextInputType.multiline,
                            minLines: 1,
                            maxLines: 7,
                            validator: (val) {
                              return null;
                            },
                            onChanged: (value) {
                              disc = value;
                            },
                            decoration: InputDecoration(
                              hintText: "Descripiton",
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              floatingLabelStyle: AppTheme.h2Style,
                            ),
                          ),
                        ),
                        Text(
                          "IP Address",
                          style: AppTheme.h6Style,
                        ),
                        SizedBox(
                          width: customWidth(80),
                          child: TextFormField(
                            keyboardType: TextInputType.multiline,
                            minLines: 1,
                            maxLines: 7,
                            validator: (val) {
                              return null;
                            },
                            onChanged: (value) {
                              ipAddress = value;
                            },
                            decoration: InputDecoration(
                              hintText: "Enter IP Address Here",
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              floatingLabelStyle: AppTheme.h2Style,
                            ),
                          ),
                        ),
                        Text(
                          "PORT Number",
                          style: AppTheme.h6Style,
                        ),
                        SizedBox(
                          width: customWidth(80),
                          child: TextFormField(
                            keyboardType: TextInputType.multiline,
                            minLines: 1,
                            maxLines: 7,
                            validator: (val) {
                              return null;
                            },
                            onChanged: (value) {
                              portNumber = value;
                            },
                            decoration: InputDecoration(
                              hintText: "Enter PORT Number Here",
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              floatingLabelStyle: AppTheme.h2Style,
                            ),
                          ),
                        ),

                        Text(
                          "Zebra Printer Data",
                          style: AppTheme.h6Style,
                        ),
                        SizedBox(
                          height: customHeight(200),
                          child: TextFormField(
                            // controller: controller.zplprinterdataController,
                            initialValue: '''^XA
^LH0,0
^FO20,20^BQR,2,5
^FD
Product:[productname],ID:[ID],SerialNumber:[*Don't change here*],Timestamp:[**Don't change here**]
^FS
^XZ''',
                            keyboardType: TextInputType.multiline,
                            maxLines: 30,
                            onChanged: (value) {
                              printerData = value;
                              // return null;
                            },
                            decoration: InputDecoration(
                              hintText: "Enter Zebra Data Here",
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              floatingLabelStyle: AppTheme.h2Style,
                            ),
                          ),
                        ),
                        // Center(
                        //   child: SizedBox(
                        //       width: customWidth(150),
                        //       child: const ImageUploadEidget()),
                        // ),
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
                                      width: 1, color: LightColor.primaryColor),
                                ),
                                child: Text(
                                  "Cancel",
                                  style: AppTheme.h3Style,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (name == '' || disc == '') {
                                  showSnackBar(message: 'Fill input fields');
                                } else {
                                  if (printerData == '') {
                                    printerData =
                                        QualityProductController.zplprinterdata;
                                  }
                                  Get.find<QualityProductController>()
                                      .saveQualityQuestions(
                                          name: name,
                                          discription: disc,
                                          time: '${min * 60 + sec}',
                                          ip: ipAddress,
                                          port: portNumber,
                                          printerData: printerData)
                                      .then((value) {
                                    Get.find<QualityProductController>()
                                        .getQualityProducts();
                                    Get.back();

                                    showSnackBar(message: 'Item saved');
                                  });
                                }
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
                                      width: 1, color: LightColor.primaryColor),
                                ),
                                child: Text(
                                  "Confirm",
                                  style: TextStyle(
                                      fontSize: customFontSize(5),
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        )
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
