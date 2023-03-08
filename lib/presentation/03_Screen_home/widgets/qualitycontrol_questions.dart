import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../application/home_screen_controller/controller.dart';
import '../../../domain/responsive/dimensions.dart';
import '../../07_Screen_quality_questions_modify/quality_questions_addingform.dart';
import '../../theme/color.dart';
import '../../widgets/custom_appbar.dart';

class Qualityquestions extends StatelessWidget {
  const Qualityquestions({super.key});

  @override
  Widget build(BuildContext context) {
    // final arguments = ModalRoute.of(context)!.settings.arguments as Map;

    // final product = arguments['product'];
    return GetBuilder<HomeScreenController>(
        id: Get.find<HomeScreenController>().screenHomeWidget,
        builder: (controller) {
          // if (controller.screen == 'DashBoard')
          return Column(
            children: [
              Container(
                color: LightColor.black,
                height: customHeight(50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    customHorizontalGap(10),
                    GestureDetector(
                      onTap: () {
                        Get.find<HomeScreenController>()
                            .setHomeScreen('Products');
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.green,
                        size: 20,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          '  ${controller.appBar}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: customFontSize(4),
                              letterSpacing: 3,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                // color: Colors.yellow,
                height: customHeight(630),
                width: customWidth(300),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: ListView.separated(
                          //scrollDirection: Axis.vertical,
                          //physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Qualityquestionform.routeName);
                              },
                              tileColor: Colors.green.shade300,
                              leading: Text('${index + 1}'),
                              title: Row(
                                children: [
                                  Text(
                                    'question ${index + 1} ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              trailing: Icon(Icons.more_vert),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return customVerticalGap(10);
                          },
                          itemCount: 10),
                    ),
                  ),
                ),
              )
            ],
          );
        });
  }
}
