import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laser_tech_app/domain/responsive/dimensions.dart';
import 'package:laser_tech_app/presentation/10_completedProductList/screen_questions_its_answer.dart';

import '../../application/ansswered_product_controller/answered_product_controller.dart';
import '../theme/theme.dart';

class ScreenCompletedProducts extends StatelessWidget {
  static const routeName = 'ScreenCompletedProducts';
  const ScreenCompletedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      final arguments = ModalRoute.of(context)!.settings.arguments as Map;

      final id = arguments['id'];
      final productIDZ = arguments['productName'];
      Get.find<AnsweredProductController>().getAnswerProductLists(id: id);
    });
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back_ios)),
          title: Text(
            "Completed Product List ",
            textAlign: TextAlign.center,
            style: AppTheme.appBarText,
          ),
        ),
        body: GetBuilder<AnsweredProductController>(
            id: Get.find<AnsweredProductController>()
                .answeredProductListWidgetID,
            builder: (controller) {
              if (controller.productList.isNotEmpty) {
                return SingleChildScrollView(
                    child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          controller.getAnswerLists(id: controller.productList[index].id!);
                          Navigator.pushNamed(
                            Get.context!,
                            Questionsanswer.routeName,
                          );
                        },
                        child: Container(
                          height: customHeight(100),
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade400,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      'Sl.No : ',
                                      style: TextStyle(
                                          fontSize: customFontSize(4),
                                          fontWeight: FontWeight.bold),
                                    )),
                                    Expanded(
                                        flex: 9,
                                        child: Text(
                                            ' ${controller.productList[index].slNo}')),
                                  ],
                                ),
                                     Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Text(
                                          'User : ',
                                          style: TextStyle(
                                              fontSize: customFontSize(4),
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Expanded(
                                        flex: 9,
                                        child: Text(
                                            ' ${controller.productList[index].user}')),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Date Created :',
                                          style: TextStyle(
                                              fontSize: customFontSize(4),
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Expanded(
                                        flex: 9,
                                        child: Text(
                                            ' ${controller.productList[index].dateCreated!.split(', ').first}')),
                                  ],
                                ),
                                 Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Time Created :',
                                          style: TextStyle(
                                              fontSize: customFontSize(4),
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Expanded(
                                        flex: 9,
                                        child: Text(
                                            ' ${controller.productList[index].dateCreated!.split(' ').last}')),
                                  ],
                                ),
                           
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return customVerticalGap(2);
                  },
                  itemCount: controller.productList.length,
                ));
              } else {
                return Column(
                  children: [
                    Center(
                      child: Text('No Data'),
                    ),
                  ],
                );
              }
            }));
  }
}
