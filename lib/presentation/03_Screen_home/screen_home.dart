// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laser_tech_app/presentation/03_Screen_home/widgets/assembly_plan.dart';
import 'package:laser_tech_app/presentation/03_Screen_home/widgets/assembly_questions.dart';
import 'package:laser_tech_app/presentation/03_Screen_home/widgets/categories.dart';
import 'package:laser_tech_app/presentation/03_Screen_home/widgets/dashboard.dart';
import 'package:laser_tech_app/presentation/03_Screen_home/widgets/employees.dart';
import 'package:laser_tech_app/presentation/03_Screen_home/widgets/final_assembly.dart';
import 'package:laser_tech_app/presentation/03_Screen_home/widgets/final_assembly_questions.dart';
import 'package:laser_tech_app/presentation/03_Screen_home/widgets/qualitycontrol_questions.dart';
import 'package:laser_tech_app/presentation/04_Screen_quality_control_properties/quality_control_properties_addingform.dart';
import 'package:laser_tech_app/presentation/11_screen_assembly_add/assembly_add.dart';

import '../../application/home_screen_controller/controller.dart';
import '../05_Employee_details/employee_details_add.dart';
import '../06_tools/screen_tools.dart';
import '../07_Screen_quality_questions_modify/quality_questions_addingform.dart';
import '../12_screen_assembly_question_add/screen_assembly_question_add.dart';
import '../13_screen_final_assembly/final_assembly_add.dart';
import '../13_screen_final_assembly/final_assembly_questionAdd.dart';
import '../widgets/responsive.dart';
import '../widgets/side_menu.dart';
import 'widgets/tools.dart';

class ScreenHome extends StatefulWidget {
  static const routeName = 'ScreenHome';
  const ScreenHome({Key? key}) : super(key: key);

  @override
  _ScreenHomeState createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      // Get.find<InitQualityController>().getProductType();
    });
    return Scaffold(
      //key: context.read<MenuAppController>().scaffoldKey,
      drawer: SideMenu(),

      floatingActionButton: GetBuilder<HomeScreenController>(
          id: Get.find<HomeScreenController>().screenHomeWidget,
          builder: (controller) {
            if (controller.screen == 'Quality Plan' ||
                controller.screen == 'Employees' ||
                controller.screen == 'Tools' ||
                controller.screen == 'Qualityquestions' ||
                controller.screen == 'ASSEMBLY PLAN' ||
                controller.screen == 'ASSEMBLY QUESTION' ||
                controller.screen == 'FINAL ASSEMBLY' ||
                controller.screen == 'FINAL ASSEMBLY QUESTIONS')
              return FloatingActionButton(
                onPressed: () {
                  if (controller.screen == 'Quality Plan') {
                    Navigator.pushNamed(
                        context, Qualitycontrolproperties.routeName);
                  } else if (controller.screen == 'Employees') {
                    Navigator.pushNamed(context, EmployeeDetailsAdd.routeName);
                  } else if (controller.screen == 'Tools') {
                    Navigator.pushNamed(context, ScreenToolsADD.routeName);
                  } else if (controller.screen == 'Qualityquestions') {
                    Navigator.pushNamed(context, Qualityquestionform.routeName);
                  } else if (controller.screen == 'ASSEMBLY PLAN') {
                    Navigator.pushNamed(
                        context, AssemblyPlanAddScreen.routeName);
                  } else if (controller.screen == 'ASSEMBLY QUESTION') {
                    Navigator.pushNamed(
                        context, AssemblyQuestionAddScreen.routeName);
                  } else if (controller.screen == 'FINAL ASSEMBLY') {
                    Navigator.pushNamed(
                        context, FinalAssemblyPlanAddScreen.routeName);
                  } else if (controller.screen == 'FINAL ASSEMBLY QUESTIONS') {
                    Navigator.pushNamed(
                        context, FinalAssemblyQuestionAddScreen.routeName);
                  }
                },
                child: Icon(Icons.add),
              );
            else
              return SizedBox();
          }),

      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            //if (Responsive.isDesktop(context))
            GetBuilder<HomeScreenController>(
                id: Get.find<HomeScreenController>().screenHomeWidget,
                builder: (controller) {
                  // if (controller.screen == 'DashBoard')
                  return Expanded(
                    // It takes 5/6 part of the screen
                    flex: 5,
                    child: GetBuilder<HomeScreenController>(
                        id: Get.find<HomeScreenController>().screenHomeWidget,
                        builder: (controller) {
                          if (controller.screen == 'Quality Plan')
                            return Categories();
                          else if (controller.screen == 'DashBoard')
                            return DashBoard();
                          else if (controller.screen == 'Tools')
                            return WorkingTools();
                          else if (controller.screen == 'Employees')
                            return Employees();
                          else if (controller.screen == 'ASSEMBLY PLAN')
                            return AssemblyPlanScreen();
                          else if (controller.screen == 'Qualityquestions')
                            return QualityQuestionScreen();
                          else if (controller.screen == 'ASSEMBLY QUESTION')
                            return AssemblyQuestionListScreen();
                          else if (controller.screen == 'FINAL ASSEMBLY')
                            return FinalAssemblyPlanScreen();
                          else if (controller.screen ==
                              'FINAL ASSEMBLY QUESTIONS') {
                            return FinalAssemblyQuestionListScreen();
                          } else
                            return AssemblyPlanScreen();
                        }),
                  );
                }),
            // if (!Responsive.isDesktop(context))
            //   Center(
            //     child: Text('visible only in full screen'),
            //   )
          ],
        ),
      ),
    );
  }
}
