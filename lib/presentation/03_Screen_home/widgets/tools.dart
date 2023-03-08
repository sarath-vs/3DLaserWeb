import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../application/home_screen_controller/controller.dart';
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
                    child: ListView.separated(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    width: customWidth(40),
                                    height: customHeight(100),
                                    child: Image.asset(
                                      'assets/icons/settings.jpg',
                                      fit: BoxFit.cover,
                                    )),
                                customHorizontalGap(10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    customVerticalGap(10),
                                    Text(
                                      'Tool Name',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                        'Tool Discription will be displayed here'),
                                  ],
                                )
                              ],
                            ),
                            // trailing: Icon(Icons.more_vert),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return customVerticalGap(10);
                        },
                        itemCount: 4),
                  ),
                ),
              )
            ],
          );
        });
  }
}
