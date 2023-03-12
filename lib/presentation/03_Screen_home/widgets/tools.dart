import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../application/home_screen_controller/controller.dart';
import '../../../application/tools_controller/tools_controller.dart';
import '../../../domain/responsive/dimensions.dart';
import '../../05_Employee_details/employee_work_details.dart';
import '../../06_tools/screen_tools.dart';
import '../../widgets/custom_appbar.dart';

class WorkingTools extends StatelessWidget {
  const WorkingTools({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
        id: Get.find<HomeScreenController>().screenHomeWidget,
        builder: (controller) {
          WidgetsBinding.instance.addPostFrameCallback((duration) {
            Get.find<ToolsController>().getTools();
          });
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
                    child: GetBuilder<ToolsController>(
                        id: Get.find<ToolsController>().toolListWidgetID,
                        builder: (controller) {
                          return ListView.separated(
                              //scrollDirection: Axis.vertical,
                              //physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, ScreenToolsADD.routeName);
                                  },
                                  tileColor: Colors.blue.withOpacity(.3),
                                  leading: Text('${index + 1}'),
                                  title: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          width: customWidth(40),
                                          height: customHeight(100),
                                          child: Image.network(
                                            '${controller.toolsList[index].image}',
                                            fit: BoxFit.cover,
                                          )),
                                      customHorizontalGap(10),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          customVerticalGap(10),
                                          Text(
                                            '${controller.toolsList[index].name}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                              '${controller.toolsList[index].description}'),
                                        ],
                                      )
                                    ],
                                  ),
                                  trailing: GestureDetector(
                                    onTap: () {
                                      int id = controller.toolsList[index].id!;
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
                                                      .deleteQualityTools(
                                                          id: id)
                                                      .then((value) =>
                                                          controller
                                                              .getTools());
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
                              itemCount: controller.toolsList.length);
                        }),
                  ),
                ),
              )
            ],
          );
        });
  }
}
