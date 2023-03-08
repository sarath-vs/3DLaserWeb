import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../main.dart';

Future<void> showSnackBar({String message = 'loading'}) async {
  ScaffoldMessenger.of(navigatorKey.currentContext!).clearSnackBars();
  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
    SnackBar(
      content: Text(message.tr),
      margin: const EdgeInsets.all(8),
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: 'close'.tr,
        onPressed: () {
          ScaffoldMessenger.of(navigatorKey.currentContext!)
              .removeCurrentSnackBar();
        },
      ),
    ),
  );
}

Future<void> showSnackBar1({required String message}) async {
  ScaffoldMessenger.of(navigatorKey.currentContext!).clearSnackBars();
  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
    SnackBar(
      content: Text(message.tr),
      margin: const EdgeInsets.all(8),
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: 'close'.tr,
        onPressed: () {
          ScaffoldMessenger.of(navigatorKey.currentContext!)
              .removeCurrentSnackBar();
        },
      ),
    ),
  );
}
