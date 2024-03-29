import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:laser_tech_app/presentation/widgets/snackbar.dart';
import '../../application/assembly_controller/assembly_controller.dart';
import '../../application/quality_products_controller/quality_product_controller.dart';
import '../../domain/responsive/dimensions.dart';
import '../04_Screen_quality_control_properties/widget/image_uploading_widget.dart';
import '../theme/color.dart';
import '../theme/theme.dart';

class AssemblyPlanAddScreen extends StatefulWidget {
  static const routeName = 'AssemblyPlanAddScreen';
  const AssemblyPlanAddScreen({super.key});

  @override
  State<AssemblyPlanAddScreen> createState() => _AssemblyPlanAddScreenState();
}

String name = '';
String disc = '';
String ipAddress = '';
String portNumber = '';
String printerData = '';
bool finalAssembly = false;
bool generateQr = false;
int min = 0;
int sec = 0;

class _AssemblyPlanAddScreenState extends State<AssemblyPlanAddScreen> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((duration) {});
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Assembly Plan",
          textAlign: TextAlign.center,
          style: AppTheme.appBarText,
        ),
      ),
      // drawer: SideMenu(),
      body: SafeArea(
          child: ListView(
        shrinkWrap: true,
        children: [
          // CustomAppBar(context, false, controller.screen),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 45),
            child: Container(
              height: customHeight(830),
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
                    Row(
                      children: [
                        Text('Final Assembly :'),
                        Checkbox(
                          value: finalAssembly,
                          checkColor: Colors.white, // color of tick Mark
                          activeColor: LightColor.primaryColor,
                          onChanged: (bool? value) {
                            setState(() {
                              finalAssembly = !finalAssembly;
                            });
                          },
                        ),
                      ],
                    ),

                    finalAssembly
                        ? Text(
                            "IP Address",
                            style: AppTheme.h6Style,
                          )
                        : SizedBox(),
                    finalAssembly
                        ? SizedBox(
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
                          )
                        : SizedBox(),
                    finalAssembly
                        ? Text(
                            "PORT Number",
                            style: AppTheme.h6Style,
                          )
                        : SizedBox(),
                    finalAssembly
                        ? SizedBox(
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
                          )
                        : SizedBox(),

                    finalAssembly
                        ? Text(
                            "Zebra Printer Data",
                            style: AppTheme.h6Style,
                          )
                        : SizedBox(),
                    finalAssembly
                        ? SizedBox(
                            height: customHeight(200),
                            child: TextFormField(
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
                              },
                              decoration: InputDecoration(
                                hintText: "Enter Zebra Data Here",
                                fillColor: Colors.grey.shade200,
                                filled: true,
                                floatingLabelStyle: AppTheme.h2Style,
                              ),
                            ),
                          )
                        //     :SizedBox(),
                        // finalAssembly?    Center(
                        //       child: SizedBox(
                        //           width: customWidth(150),
                        //           child: const ImageUploadEidget()),
                        //     )
                        : SizedBox(),
                    /////
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            // color: LightColor.primaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            border: Border.all(
                                width: 1, color: LightColor.primaryColor),
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
                                  "Cancel",
                                  style: AppTheme.h3Style,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: LightColor.primaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            border: Border.all(
                                width: 1, color: LightColor.primaryColor),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                if (name == '' || disc == '') {
                                  showSnackBar(message: 'Fill input fields');
                                } else {
                                  if (finalAssembly == true) {
                                    Get.find<AssemblyProductController>()
                                        .saveAssemblyProduct(
                                            name: name,
                                            discription: disc,
                                            time: '${min * 60 + sec}',
                                            ip: ipAddress,
                                            port: portNumber,
                                            printerData: printerData,
                                            genQr: generateQr,
                                            finalAssembly: true)
                                        .then((value) {
                                      Get.find<AssemblyProductController>()
                                          .getAssemblyProducts();
                                      Get.back();

                                      showSnackBar(message: 'Item saved');
                                    });
                                  } else {
                                    Get.find<AssemblyProductController>()
                                        .saveAssemblyProduct(
                                            name: name,
                                            discription: disc,
                                            time: '${min * 60 + sec}',
                                            ip: ipAddress,
                                            port: portNumber,
                                            printerData: printerData,
                                            genQr: generateQr,
                                            finalAssembly: false)
                                        .then((value) {
                                      Get.find<AssemblyProductController>()
                                          .getAssemblyProducts();
                                      Get.back();

                                      showSnackBar(message: 'Item saved');
                                    });
                                  }
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: customWidth(50),
                                height: customHeight(40),
                                child: Text(
                                  "Confirm",
                                  style: TextStyle(
                                      fontSize: customFontSize(5),
                                      color: Colors.white),
                                ),
                              ),
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
      )),
    );
  }
}
