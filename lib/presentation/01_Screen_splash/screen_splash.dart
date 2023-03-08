import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laser_tech_app/presentation/theme/color.dart';
import '../../application/auth_controller/auth_controller.dart';
import '../../domain/responsive/dimensions.dart';
import '../02_Screen_login/screen_login.dart';
import '../03_Screen_home/screen_home.dart';

class ScreenSplash extends StatefulWidget {
  static const routeName = 'ScreenSplash';
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () async {
      final isUserAuthenficated =
          await Get.find<AuthController>().authCheckRequested();
      if (isUserAuthenficated) {
        Get.find<AuthController>()
            .authCheckRequested()
            .then((value) => Navigator.of(context).pushNamedAndRemoveUntil(
                  ScreenHome.routeName,
                  (route) => false,
                ));
      } else {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushNamedAndRemoveUntil(
          ScreenLogin.routeName,
          (route) => false,
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColor.whitebackground,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  height: customHeight(115),
                  width: customWidth(115),
                  image: const AssetImage('assets/images/3DLlogo.png')),
              const CircularProgressIndicator(
                color: LightColor.colorBackground,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
