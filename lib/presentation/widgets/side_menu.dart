import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:laser_tech_app/application/home_screen_controller/controller.dart';
import 'package:laser_tech_app/domain/responsive/dimensions.dart';
import 'package:laser_tech_app/presentation/theme/color.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: LightColor.primaryColor,
      child: ListView(
        children: [
          DrawerHeader(
            //decoration: BoxDecoration(color: Colors.white),
            child: Image.asset(
              "assets/images/3DLlogo.png",
            ),
          ),
          customVerticalGap(50),
          DrawerListTile(
            title: "DashBoard",
            icon: Icon(
              Icons.dashboard,
              color: Colors.grey,
            ),
            press: () {
              Get.find<HomeScreenController>().setHomeScreen('DashBoard');
            },
          ),
          // DrawerListTile(
          //   title: "Control Panel",
          //   icon: Icon(
          //     Icons.control_camera,
          //     color: Colors.grey,
          //   ),
          //   press: () {
          //     Get.find<HomeScreenController>().setHomeScreen('Control Panel');
          //   },
          // ),
          DrawerListTile(
            title: "Employees",
            icon: Icon(
              Icons.emoji_people,
              color: Colors.grey,
            ),
            press: () {
              Get.find<HomeScreenController>().setHomeScreen('Employees');
            },
          ),
          DrawerListTile(
            title: " Quality Plan",
            icon: Icon(
              Icons.category,
              color: Colors.grey,
            ),
            press: () {
              Get.find<HomeScreenController>().setHomeScreen('Products');
            },
          ),
          DrawerListTile(
            title: "Assembly Plan",
            icon: Icon(
              Icons.high_quality,
              color: Colors.grey,
            ),
            press: () {
              Get.find<HomeScreenController>().setHomeScreen('ASSEMBLY PLAN');
            },
          ),
          //  DrawerListTile(
          //   title: "Final Assembly",
          //   icon: Icon(
          //     Icons.production_quantity_limits,
          //     color: Colors.grey,
          //   ),
          //   press: () {
          //     Get.find<HomeScreenController>().setHomeScreen('ASSEMBLY PLAN');
          //   },
          // ),
          DrawerListTile(
            title: "Tools",
            icon: Icon(
              Icons.settings,
              color: Colors.grey,
            ),
            press: () {
              Get.find<HomeScreenController>().setHomeScreen('Tools');
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String title;
  final VoidCallback press;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: icon,
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
