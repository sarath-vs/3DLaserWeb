import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:laser_tech_app/presentation/widgets/snackbar.dart';

import '../../application/assembly_controller/assembly_controller.dart';
import '../../application/quality_products_controller/quality_product_controller.dart';
import '../../domain/responsive/dimensions.dart';
import '../theme/color.dart';
import '../theme/theme.dart';

class AssemblyProductEditor extends StatefulWidget {
  static const routeName = 'AssemblyProductEditor';
  const AssemblyProductEditor({super.key});

  @override
  State<AssemblyProductEditor> createState() =>
      _AssemblyProductEditorState();
}

String productName = '';
String description = '';
String timeLimit ='';
String ipAddress = '';
String portNumber = '';
String printerData = '';
int id=0;
int min =0;
int sec =0;

class _AssemblyProductEditorState extends State<AssemblyProductEditor> {
  @override
  Widget build(BuildContext context) {
     final arguments = ModalRoute.of(context)!.settings.arguments as Map;

     id = arguments['id'];
     productName=arguments['productName'];
      description=arguments['description'];
       timeLimit=arguments['time_limit'];
       ipAddress=arguments['ipAddress'];
       portNumber=arguments['portNumber'];
       printerData=arguments['printerData'];

        sec = int.parse(timeLimit) % 60;
          min = (int.parse(timeLimit) / 60).floor();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Assembly",
          textAlign: TextAlign.center,
          style: AppTheme.appBarText,
        ),
      ),
      // drawer: SideMenu(),
      body: SafeArea(
          child: ListView(
        // shrinkWrap: true,
        children: [
          // CustomAppBar(context, false, controller.screen),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 45),
            child: Container(
              height: customHeight(530),
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
                      "Assembly Details",
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
                        initialValue: productName,
                        validator: (val) {
                          return null;
                        },
                        onChanged: (value) {
                          productName = value;
                          // controller.answerField.first.dd = true;
                          // controller.priintAnswerField();
                        },
                        decoration: InputDecoration(
                          hintText:productName==''? "Property Name*":productName,

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
                             initialValue: min.toString(),
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
                         initialValue: sec.toString(),
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
                        initialValue: description,
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 7,
                        validator: (val) {
                          return null;
                        },
                        onChanged: (value) {
                          description = value;
                        },
                        decoration: InputDecoration(
                          hintText: description==""?"Descripiton":description,
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          floatingLabelStyle: AppTheme.h2Style,
                        ),
                      ),
                    ),
                    //   Text(
                    //   "IP Address",
                    //   style: AppTheme.h6Style,
                    // ),
                    // SizedBox(
                    // width: customWidth(80),
                    //   child: TextFormField(
                    //     initialValue: ipAddress,
                    //     keyboardType: TextInputType.multiline,
                    //     minLines: 1,
                    //     maxLines: 7,
                    //     validator: (val) {
                    //       return null;
                    //     },
                    //     onChanged: (value) {
                    //       ipAddress = value;
                    //     },
                    //     decoration: InputDecoration(
                    //       hintText:ipAddress==''? " Enter IP Address Here*":ipAddress,
                         
                    //       fillColor: Colors.grey.shade200,
                    //       filled: true,
                    //       floatingLabelStyle: AppTheme.h2Style,
                    //     ),
                    //   ),
                    // ),
                    //   Text(
                    //   "PORT Number",
                    //   style: AppTheme.h6Style,
                    // ),
                    // SizedBox(
                    // width: customWidth(80),
                    //   child: TextFormField(
                    //     initialValue: portNumber,
                    //     keyboardType: TextInputType.multiline,
                  
                    //     minLines: 1,
                    //     maxLines: 7,
                    //     validator: (val) {
                    //       return null;
                    //     },
                    //     onChanged: (value) {
                    //       portNumber = value;
                    //     },
                    //     decoration: InputDecoration(
                    //        hintText:portNumber==''? " Enter PORT Number Here*":portNumber,
                         
                    //       fillColor: Colors.grey.shade200,
                    //       filled: true,
                    //       floatingLabelStyle: AppTheme.h2Style,
                    //     ),
                    //   ),
                    // ),
                      
                    //    Text(
                    //   "Zebra Printer Data",
                    //   style: AppTheme.h6Style,
                    // ),
                  //   SizedBox(
                  //  height: customHeight(200),
                  //     child: TextFormField(
                  //             initialValue:printerData,
                        
                  //       keyboardType: TextInputType.multiline,
                        
                       
                  //       maxLines: 30,
                       
                  //       onChanged: (value) {
                  //         printerData = value;
                  //         print(value);
                  //       },
                  //       decoration: InputDecoration(
                  //         hintText:printerData==''? " Enter ZPL Here*":printerData,
                          
                  //         fillColor: Colors.grey.shade200,
                  //         filled: true,
                  //         floatingLabelStyle: AppTheme.h2Style,
                  //       ),
                  //     ),
                  //   ),
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
                            if (productName == '' || description == '') {
                              showSnackBar(message: 'Fill input fields');
                            } else {
                              Get.find<AssemblyProductController>()
                                  .putAssemblyProducts(id: id, name: productName, description: description,time: '${min*60+sec}',ip: '', port: '', printerData: '')
                                  .then((value) {
                             

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
      )),
    );
  }
}
