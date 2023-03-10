import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                                    'Product Name ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '(${index + 5} Questions)',
                                    style: TextStyle(color: Colors.grey[600]),
                                  )
                                ],
                              ),
                              trailing: Icon(Icons.more_vert),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return customVerticalGap(10);
                          },
                          itemCount: 40),
                    ),
                  ),
                ),
              )
            ],
          );
        });
  }
}
