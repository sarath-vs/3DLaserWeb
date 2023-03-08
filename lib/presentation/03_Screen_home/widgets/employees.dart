import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../application/home_screen_controller/controller.dart';
import '../../../domain/responsive/dimensions.dart';
import '../../05_Employee_details/employee_work_details.dart';
import '../../widgets/custom_appbar.dart';

class Employees extends StatelessWidget {
  const Employees({Key? key}) : super(key: key);

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
                                  context, EmployeeWorkDetails.routeName);
                            },
                            tileColor: Colors.orange.withOpacity(.3),
                            leading: Text('${index + 1}'),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Name : ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Employee Name',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('ID : '),
                                    Text('XXXXXXXXXXXX'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('Designation : '),
                                    Text('Employee Designation'),
                                  ],
                                ),
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
              )
            ],
          );
        });
  }
}
