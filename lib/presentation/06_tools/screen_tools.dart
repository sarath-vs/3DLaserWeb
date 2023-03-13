import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laser_tech_app/application/tools_controller/tools_controller.dart';
import '../../domain/responsive/dimensions.dart';
import '../theme/color.dart';
import '../theme/theme.dart';
import '../widgets/snackbar.dart';
import 'widget/image_uploading_widget.dart';

class ScreenToolsADD extends StatefulWidget {
  static const routeName = 'ScreenToolsADD';
  const ScreenToolsADD({super.key});

  @override
  State<ScreenToolsADD> createState() => _ScreenToolsADDState();
}

String name = '';
String disc = '';
String img = '@door_9HyPlSJ_LAZx187.webp;type=image/webp';

class _ScreenToolsADDState extends State<ScreenToolsADD> {
  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((duration) {
    //   Get.find<ToolsController>().getTools();
    // });
    return Scaffold(
      appBar: AppBar(
        leading: Text(''),
        title: Text(
          "Add/Edit Tools",
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tool Details",
                          style: AppTheme.h8Style,
                        ),
                        // Icon(
                        //   Icons.delete,
                        //   color: Colors.red,
                        //   size: customHeight(30),
                        // )
                      ],
                    ),
                    // customVerticalGap(20),
                    Text(
                      "Tool Name*",
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
                        },
                        decoration: InputDecoration(
                          hintText: "Tool Name*",

                          // border: OutlineInputBorder(
                          //     borderRadius: BorderRadius.circular(20)),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          floatingLabelStyle: AppTheme.h2Style,
                        ),
                      ),
                    ),

                    Text(
                      "Discripiton",
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
                          hintText: "Usage Discripiton",
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          floatingLabelStyle: AppTheme.h2Style,
                        ),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                          width: customWidth(150),
                          child: const ImageUploadEidget()),
                    ),
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
                            if (name == '' || disc == '' || img == '') {
                              showSnackBar(message: 'Fill input fields');
                            } else {
                              Get.find<ToolsController>()
                                  .saveToolsQuality(
                                      name: name, image: img, discription: disc)
                                  .then((value) {
                                Get.find<ToolsController>().getTools();
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
                              "SAVE",
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
