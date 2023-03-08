import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/responsive/dimensions.dart';
import '../theme/color.dart';
import '../theme/theme.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/side_menu.dart';

class EmployeeDetailsAdd extends StatefulWidget {
  static const routeName = 'EmployeeDetailsAdd';
  const EmployeeDetailsAdd({super.key});

  @override
  State<EmployeeDetailsAdd> createState() => _EmployeeDetailsAddState();
}

class _EmployeeDetailsAddState extends State<EmployeeDetailsAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add/Edit Employee Details",
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
                      "Employee Details",
                      style: AppTheme.h8Style,
                    ),
                    // customVerticalGap(20),
                    Text(
                      "Employee Name*",
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
                          hintText: "Employee Name*",

                          // border: OutlineInputBorder(
                          //     borderRadius: BorderRadius.circular(20)),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          floatingLabelStyle: AppTheme.h2Style,
                        ),
                      ),
                    ),
                    // Text(
                    //   "ID",
                    //   style: AppTheme.h6Style,
                    // ),
                    // SizedBox(
                    //   width: customWidth(150),
                    //   child: TextFormField(
                    //     validator: (val) {
                    //       return null;
                    //     },
                    //     onChanged: (value) {
                    //       // password = value;
                    //     },
                    //     decoration: InputDecoration(
                    //       hintText: "ID",
                    //       // border: OutlineInputBorder(
                    //       //     borderRadius: BorderRadius.circular(20)),
                    //       fillColor: Colors.grey.shade200,
                    //       filled: true,
                    //       floatingLabelStyle: AppTheme.h2Style,
                    //     ),
                    //   ),
                    // ),
                    Text(
                      "Designation",
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
                          hintText: "Designation",
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          floatingLabelStyle: AppTheme.h2Style,
                        ),
                      ),
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
