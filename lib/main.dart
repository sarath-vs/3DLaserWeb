// ignore_for_file: avoid_print, prefer_const_constructors

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:laser_tech_app/domain/injection/injection.dart';
import 'package:laser_tech_app/presentation/03_Screen_home/screen_home.dart';
import 'package:laser_tech_app/presentation/04_Screen_quality_control_properties/quality_control_properties_addingform.dart';
import 'package:laser_tech_app/presentation/05_Employee_details/employee_details_add.dart';
import 'package:laser_tech_app/presentation/05_Employee_details/employee_work_details.dart';
import 'package:laser_tech_app/presentation/06_tools/screen_tools.dart';
import 'package:laser_tech_app/presentation/07_Screen_quality_questions_modify/quality_questions_addingform.dart';
import 'package:laser_tech_app/presentation/09_Screen_quality_control_properties_edit/quality_control_properties_addingform.dart';
import 'package:laser_tech_app/presentation/10_completedProductList/screen_completed_product_list.dart';
import 'package:laser_tech_app/presentation/10_completedProductList/screen_questions_its_answer.dart';
import 'package:laser_tech_app/presentation/11_screen_assembly_add/assembly_add.dart';
import 'package:laser_tech_app/presentation/11_screen_assembly_add/assembly_edit.dart';
import 'package:laser_tech_app/presentation/12_screen_assembly_question_add/screen_assembly_question_add.dart';
import 'package:laser_tech_app/presentation/theme/theme.dart';

import 'application/ansswered_product_controller/answered_product_controller.dart';
import 'application/assembly_controller/assembly_controller.dart';
import 'application/auth_controller/auth_controller.dart';
import 'application/home_screen_controller/controller.dart';
import 'application/quality_products_controller/quality_product_controller.dart';
import 'application/quality_question_edit_controller/quality_question_edit_controller.dart';
import 'application/tools_controller/tools_controller.dart';
import 'classes/language_constants.dart';
import 'presentation/02_Screen_login/screen_login.dart';
import 'presentation/08_Screen_quality_questions_editor/quality_questions_addingform.dart';

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
        home: ScreenLogin(),
        routes: {
           AssemblyQuestionAddScreen.routeName: (context) => const AssemblyQuestionAddScreen(),
          ScreenLogin.routeName: (context) => const ScreenLogin(),
          ScreenHome.routeName: (context) => const ScreenHome(),
          EmployeeWorkDetails.routeName: (context) => const EmployeeWorkDetails(),
          EmployeeDetailsAdd.routeName: (context) => const EmployeeDetailsAdd(),
          Qualitycontrolproperties.routeName: (context) => const Qualitycontrolproperties(),
          Qualityquestionform.routeName: (context) => const Qualityquestionform(),
          ScreenToolsADD.routeName: (context) => const ScreenToolsADD(),
          QualityquestionEdit.routeName: (context) => const QualityquestionEdit(),
          QualitycontrolpropertiesEditor.routeName: (context) =>
              const QualitycontrolpropertiesEditor(),
          ScreenCompletedProducts.routeName: (context) => const ScreenCompletedProducts(),
          Questionsanswer.routeName: (context) => const Questionsanswer(),
          AssemblyPlanAddScreen.routeName: (context) => const AssemblyPlanAddScreen(),
          AssemblyProductEditor.routeName: (context) => const AssemblyProductEditor(),
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
  Get.put<HomeScreenController>(getIt<HomeScreenController>(), permanent: false);
  Get.put<ToolsController>(getIt<ToolsController>(), permanent: false);
  Get.put<QualityProductController>(getIt<QualityProductController>(), permanent: false);
  Get.put<QualityQuestionEditController>(getIt<QualityQuestionEditController>(), permanent: false);
  Get.put<AnsweredProductController>(getIt<AnsweredProductController>(), permanent: false);
    Get.put<AssemblyProductController>(getIt<AssemblyProductController>(), permanent: false);
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
