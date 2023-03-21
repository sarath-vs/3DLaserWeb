import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../application/home_screen_controller/controller.dart';
import '../../../application/quality_products_controller/quality_product_controller.dart';
import '../../../domain/responsive/dimensions.dart';
import '../../08_Screen_quality_questions_editor/quality_questions_addingform.dart';
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
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: GetBuilder<QualityProductController>(
                          id: Get.find<QualityProductController>()
                              .qualityQuestionID,
                          builder: (controller) {
                            if (controller.qualityProductList.isNotEmpty) {
                              return ListView.separated(
                                  //scrollDirection: Axis.vertical,
                                  //physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      onTap: () {
          //                               Navigator.pushNamed(context,arguments: {
          //   'id': controller.qualityQuestionList[index].id,
            
           
          // },
          //                                   QualityquestionEdit.routeName);
                                      },
                                      tileColor: Colors.green.shade300,
                                      leading: Text('${index + 1}'),
                                      title: Row(
                                        children: [
                                          Text(
                                            '${controller.qualityQuestionList[index].questionEnglish} ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      trailing: Wrap(
                                        spacing: 12,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.pushNamed(context,arguments: {
            'id': controller.qualityQuestionList[index].id,
            
           
          },
                                            QualityquestionEdit.routeName);
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: customWidth(20),
                                                height: customHeight(25),
                                                decoration: BoxDecoration(
                                                  color: LightColor.orange,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5)),
                                                  border: Border.all(
                                                      width: 1,
                                                      color: LightColor
                                                          .primaryColor),
                                                ),
                                                child: Text(
                                                  "EDIT",
                                                  style: TextStyle(
                                                      fontSize:
                                                          customFontSize(3),
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                barrierDismissible: false,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: Text('Alert'),
                                                    content: Text(
                                                        'Are you sure you want to delete'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        child: const Text('No'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          controller
                                                              .deleteQualityQuestions(
                                                                  id: controller
                                                                      .qualityQuestionList[
                                                                          index]
                                                                      .id!)
                                                              .then((value) {
                                                            controller
                                                                .getQualityQuestions(
                                                                    id: controller
                                                                        .productId);
                                                          });

                                                          Get.back();
                                                        },
                                                        child: const Text('Yes'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return customVerticalGap(10);
                                  },
                                  itemCount:
                                      controller.qualityQuestionList.length);
                            } else {
                              return Text('No Data');
                            }
                          })),
                ),
              )
            ],
          );
        });
  }
}
