import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laser_tech_app/presentation/theme/color.dart';

import '../../../application/home_screen_controller/controller.dart';
import '../../../domain/responsive/dimensions.dart';
import '../../widgets/custom_appbar.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
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
                    child: SizedBox(
                        width: double.infinity,
                        child: Image.asset(
                          'assets/images/dashTest.png',
                          fit: BoxFit.cover,
                        ))),
              )
            ],
          );
        });
  }
}
