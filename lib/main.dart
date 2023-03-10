// ignore_for_file: avoid_print, prefer_const_constructors

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:laser_tech_app/domain/injection/injection.dart';
import 'package:laser_tech_app/presentation/03_Screen_home/screen_home.dart';
import 'package:laser_tech_app/presentation/04_Screen_quality_control_properties/quality_control_properties_addingform.dart';
import 'package:laser_tech_app/presentation/05_Employee_details/employee_details_add.dart';
import 'package:laser_tech_app/presentation/05_Employee_details/employee_work_details.dart';
import 'package:laser_tech_app/presentation/06_tools/screen_tools.dart';
import 'package:laser_tech_app/presentation/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'application/auth_controller/auth_controller.dart';

import 'application/home_screen_controller/controller.dart';
import 'classes/language_constants.dart';
import 'presentation/01_Screen_splash/screen_splash.dart';
import 'presentation/02_Screen_login/screen_login.dart';

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await configureDependencies();

    // await Hive.initFlutter();
    // await Hive.deleteFromDisk();

    runApp(MyApp());

    // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  }, (error, stackTrace) {
    // FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) => {setLocale(locale)});
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        //designSize: Size(1080, 1920),
        builder: (BuildContext context, c) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        title: 'laser_tech_app',
        theme: AppTheme.lightTheme.copyWith(),
        home: ScreenSplash(),
        routes: {
          ScreenSplash.routeName: (context) => const ScreenSplash(),
          ScreenLogin.routeName: (context) => const ScreenLogin(),
          ScreenHome.routeName: (context) => const ScreenHome(),
          EmployeeWorkDetails.routeName: (context) =>
              const EmployeeWorkDetails(),
          EmployeeDetailsAdd.routeName: (context) => const EmployeeDetailsAdd(),
          Qualitycontrolproperties.routeName: (context) =>
              const Qualitycontrolproperties(),
          ScreenToolsADD.routeName: (context) => const ScreenToolsADD(),
        },
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: _locale,
        initialBinding: GetxBindings(),
      );
    });
  }
}

class GetxBindings extends Bindings {
  @override
  void dependencies() {
    initializeGetxController();
  }
}

initializeGetxController() {
  Get.put<AuthController>(getIt<AuthController>(), permanent: false);
  Get.put<HomeScreenController>(getIt<HomeScreenController>(),
      permanent: false);
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
