// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laser_tech_app/application/auth_controller/auth_controller.dart';
import 'package:laser_tech_app/domain/responsive/dimensions.dart';
import 'package:laser_tech_app/presentation/03_Screen_home/screen_home.dart';
import 'package:laser_tech_app/presentation/theme/color.dart';
import 'package:laser_tech_app/presentation/theme/theme.dart';
import 'package:laser_tech_app/presentation/widgets/snackbar.dart';

import '../../classes/language.dart';
import '../../classes/language_constants.dart';
import '../../main.dart';

class ScreenLogin extends StatefulWidget {
  static const routeName = 'ScreenLogin';
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ScreenLoginState createState() => _ScreenLoginState();
}

String? userName = '';
String? password = '';

class _ScreenLoginState extends State<ScreenLogin> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: LightColor.primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: customWidth(55),
                    ),
                    Text(
                      '3D Laser Tec',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: customFontSize(11)),
                    ),
                    // Image.asset(
                    //   'assets/images/3DLlogo.jpg',
                    //   height: customHeight(70),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<Language>(
                        underline: const SizedBox(),
                        hint: Text(
                          translation(context).language,
                          style: TextStyle(
                              fontSize: customFontSize(5), color: Colors.white),
                        ),
                        icon: const Icon(
                          Icons.language,
                          color: Colors.white,
                          size: 40,
                        ),
                        onChanged: (Language? language) async {
                          setState(() async {
                            Locale locale =
                                await setLocale(language!.languageCode);
                            // ignore: use_build_context_synchronously
                            MyApp.setLocale(context, locale);
                          });
                        },
                        items: Language.languageList()
                            .map<DropdownMenuItem<Language>>(
                              (e) => DropdownMenuItem<Language>(
                                value: e,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text(
                                      e.flag,
                                      style: TextStyle(
                                          fontSize: customFontSize(10)),
                                    ),
                                    Text(
                                      e.name,
                                      style: TextStyle(
                                          fontSize: customFontSize(6)),
                                    )
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Material(
                            borderRadius: BorderRadius.circular(20),
                            elevation: 6,
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 192, 168, 245),
                                    borderRadius: BorderRadius.circular(20)),
                                width: customWidth(130),
                                height: customHeight(440),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    children: [
                                      customVerticalGap(10),
                                      SizedBox(
                                        width: customWidth(110),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Login',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: customFontSize(9),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            customVerticalGap(5),
                                            Text(
                                              'Please sing in to continue',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey.shade800),
                                            ),
                                          ],
                                        ),
                                      ),
                                      customVerticalGap(20),
                                      TextFormField(
                                        validator: (val) {
                                          if (val != null && val.isEmpty) {
                                            return translation(context)
                                                .localeName;
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          userName = value;
                                        },
                                        decoration: InputDecoration(
                                            border: const OutlineInputBorder(),
                                            fillColor: Colors.grey.shade200,
                                            filled: true,
                                            labelText: translation(context).id,
                                            labelStyle: AppTheme.h2Style,
                                            hintText: translation(context).id,
                                            hintStyle: AppTheme.h2Style),
                                      ),
                                      customVerticalGap(20),
                                      TextFormField(
                                        validator: (val) {
                                          if (val != null && val.isEmpty) {
                                            return translation(context)
                                                .localeName;
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          password = value;
                                        },
                                        decoration: InputDecoration(
                                          border: const OutlineInputBorder(),
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          floatingLabelStyle: AppTheme.h2Style,
                                          labelText:
                                              translation(context).password,
                                          labelStyle: AppTheme.h2Style,
                                          hintText:
                                              translation(context).password,
                                          hintStyle: AppTheme.h2Style,
                                        ),
                                      ),
                                      customVerticalGap(30),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(
                                              255, 76, 34, 138),
                                          textStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: customFontSize(10),
                                              fontStyle: FontStyle.italic),
                                        ),
                                        onPressed: () {
                                          // Get.find<AuthController>()
                                          //     .login(userName!, password!);
                                          if (userName == 'admin@admin.com' &&
                                              password == 'admin') {
                                            Navigator.pushNamed(
                                                context, ScreenHome.routeName);
                                          } else {
                                            showSnackBar1(
                                                message:
                                                    'Unable to login(wrong user Name or password)');
                                          }
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                            'LOGIN',
                                            style: TextStyle(
                                                color: const Color.fromARGB(
                                                    255, 255, 255, 255),
                                                fontSize: customFontSize(6),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      // customVerticalGap(25),
                                      // Text(
                                      //   'OR',
                                      //   style: TextStyle(
                                      //       color: Colors.grey.shade600,
                                      //       fontWeight: FontWeight.bold),
                                      // ),
                                      // customVerticalGap(10),
                                      // SizedBox(
                                      //   width: customWidth(75),
                                      //   child: TextButton(
                                      //       onPressed: () {},
                                      //       style: TextButton.styleFrom(
                                      //         backgroundColor: Color.fromARGB(
                                      //             255, 94, 48, 163),
                                      //       ),
                                      //       child: Row(
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.center,
                                      //         children: [
                                      //           Text(
                                      //             'Scan your QR for login',
                                      //             style: TextStyle(
                                      //                 fontSize:
                                      //                     customFontSize(5),
                                      //                 color: Colors.white),
                                      //           ),
                                      //           customHorizontalGap(5),
                                      //           Icon(
                                      //             Icons.qr_code_2_outlined,
                                      //             size: customHeight(20),
                                      //             color: Colors.white,
                                      //           )
                                      //         ],
                                      //       )),
                                      // )
                                    ],
                                  ),
                                )),
                          )
                        ],
                      )),
                  Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/loginBGvector.jpg',
                          ),
                        ],
                      ))
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: customHeight(20)),
                child: Text(
                  'Powered by   3DLASER TEC PVT LTD',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: customFontSize(4)),
                ),
              )
            ],
          )),
    );
  }
}
