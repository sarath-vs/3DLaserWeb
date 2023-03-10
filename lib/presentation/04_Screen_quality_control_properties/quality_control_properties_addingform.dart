import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/responsive/dimensions.dart';
import '../theme/color.dart';
import '../theme/theme.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/side_menu.dart';
import 'widget/image_uploading_widget.dart';

class Qualitycontrolproperties extends StatefulWidget {
  static const routeName = 'Qualitycontrolproperties';
  const Qualitycontrolproperties({super.key});

  @override
  State<Qualitycontrolproperties> createState() =>
      _QualitycontrolpropertiesState();
}

class _QualitycontrolpropertiesState extends State<Qualitycontrolproperties> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add/Edit Product",
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
                          // password = value;
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
                      "Sort",
                      style: AppTheme.h6Style,
                    ),
                    SizedBox(
                      width: customWidth(150),
                      child: TextFormField(
                        validator: (val) {
                          return null;
                        },
                        onChanged: (value) {
                          // password = value;
                        },
                        decoration: InputDecoration(
                          hintText: "Sort",
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
                          // password = value;
                        },
                        decoration: InputDecoration(
                          hintText: "Discripiton",
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
                              "Confirm",
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
                              "Cancel",
                              style: AppTheme.h3Style,
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
