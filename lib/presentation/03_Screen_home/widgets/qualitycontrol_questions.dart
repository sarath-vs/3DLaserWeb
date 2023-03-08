import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../application/home_screen_controller/controller.dart';
import '../../../domain/responsive/dimensions.dart';
import '../../widgets/custom_appbar.dart';

class Qualityquestions extends StatelessWidget {
  const Qualityquestions({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
        id: Get.find<HomeScreenController>().screenHomeWidget,
        builder: (controller) {
          // if (controller.screen == 'DashBoard')
          return Column(
            children: [
              CustomAppBar(context, true, controller.screen),
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
                              onTap: () {},
                              tileColor: Colors.green.shade100,
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
