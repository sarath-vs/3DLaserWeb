import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laser_tech_app/application/quality_products_controller/quality_product_controller.dart';

import '../../../application/home_screen_controller/controller.dart';
import '../../../domain/responsive/dimensions.dart';
import '../../widgets/custom_appbar.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
        id: Get.find<HomeScreenController>().screenHomeWidget,
        builder: (controller) {
          WidgetsBinding.instance.addPostFrameCallback((duration) {
            Get.find<QualityProductController>().getQualityProducts();
          });
          // if (controller.screen == 'DashBoard')
          return Column(
            children: [
              CustomAppBar(context, false, controller.screen),
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
                              .qualityProductID,
                          builder: (controller) {
                            if (controller.qualityProductList.isNotEmpty) {
                              return ListView.separated(
                                  //scrollDirection: Axis.vertical,
                                  //physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      onTap: () {
                                        Get.find<QualityProductController>()
                                            .getQualityQuestions(
                                                id: controller
                                                    .qualityProductList[index]
                                                    .id!);
                                        Get.find<QualityProductController>()
                                                .productId =
                                            controller
                                                .qualityProductList[index].id!;

                                        Get.find<HomeScreenController>().appBarName(
                                            '${controller.qualityProductList[index].name}   ');
                                        Get.find<HomeScreenController>()
                                            .setHomeScreen('Qualityquestions');
                                      },
                                      tileColor: Colors.green.shade100,
                                      leading: Text('${index + 1}'),
                                      title: Row(
                                        children: [
                                          Text(
                                            '${controller.qualityProductList[index].name}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          // Text(
                                          //   '(${index + 5} Questions)',
                                          //   style: TextStyle(
                                          //       color: Colors.grey[600]),
                                          // )
                                        ],
                                      ),
                                      trailing: GestureDetector(
                                        onTap: () {
                                          int id = controller
                                              .qualityProductList[index].id!;
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
                                                          .deleteQualityProduct(
                                                              id: id)
                                                          .then((value) =>
                                                              controller
                                                                  .getQualityProducts());
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
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                            size: customHeight(25),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return customVerticalGap(10);
                                  },
                                  itemCount:
                                      controller.qualityProductList.length);
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
