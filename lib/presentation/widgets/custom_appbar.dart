// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../application/auth_controller/auth_controller.dart';
import '../../classes/language.dart';
import '../../classes/language_constants.dart';
import '../../domain/responsive/dimensions.dart';
import '../../main.dart';
import '../03_Screen_home/screen_home.dart';
import '../theme/color.dart';

Widget CustomAppBar(BuildContext context, bool showArrow, String screenName) {
  return Container(
    color: LightColor.black,
    height: customHeight(50),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        showArrow
            ? GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.green,
                  size: 40,
                ),
              )
            : SizedBox(),
        screenName != ''
            ? Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    screenName.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: customFontSize(4),
                        letterSpacing: 3,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            : SizedBox(),
        // Expanded(
        //   flex: 4,
        //   child: Row(
        //     children: [
        //       customHorizontalGap(5),
        //       customHorizontalGap(2),
        //     ],
        //   ),
        // ),
        // TextButton(
        //     onPressed: () {
        //       Get.find<AuthController>().refreshTocken();
        //     },
        //     child: Text(
        //       'Refresh',
        //       style: TextStyle(color: Colors.white),
        //     )),

        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<Language>(
                  underline: const SizedBox(),
                  hint: Text(
                    translation(context).language,
                    style: TextStyle(
                        fontSize: customFontSize(3), color: Colors.white),
                  ),
                  icon: const Icon(
                    Icons.language,
                    color: Colors.white,
                    size: 20,
                  ),
                  onChanged: (Language? language) async {
                    // setState(() async {
                    Locale locale = await setLocale(language!.languageCode);
                    // ignore: use_build_context_synchronously
                    MyApp.setLocale(context, locale);
                    // });
                  },
                  items: Language.languageList()
                      .map<DropdownMenuItem<Language>>(
                        (e) => DropdownMenuItem<Language>(
                          value: e,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                e.flag,
                                style: TextStyle(fontSize: customFontSize(4)),
                              ),
                              Text(
                                e.name,
                                style: TextStyle(fontSize: customFontSize(3)),
                              )
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              customHorizontalGap(10),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            content: Builder(
                              builder: (context) {
                                // Get available height and width of the build area of this widget. Make a choice depending on the size.
                                var height = MediaQuery.of(context).size.height;
                                var width = MediaQuery.of(context).size.width;

                                return SizedBox(
                                  height: height - 900,
                                  width: width - 900,
                                  child: Center(
                                      child: Text(
                                    'Logout ?',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: customFontSize(6)),
                                  )),
                                );
                              },
                            ),
                            actions: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 50),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushNamedAndRemoveUntil(
                                                ScreenHome.routeName,
                                                (route) => false);
                                      },
                                      child: Text(
                                        'No',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: customFontSize(6)),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Get.find<AuthController>().logOut();
                                      },
                                      child: Text(
                                        'Yes',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: customFontSize(6)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ));
                },
                child: Icon(
                  Icons.power_settings_new,
                  size: 25,
                  color: Colors.red,
                ),
              ),
              customHorizontalGap(8)
            ],
          ),
        )
      ],
    ),
  );
}
