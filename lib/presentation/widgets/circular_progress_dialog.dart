import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:laser_tech_app/domain/log/custom_log.dart';
import 'package:laser_tech_app/presentation/theme/color.dart';

import '../../domain/responsive/dimensions.dart';
import '../../main.dart';

void hideCircularProgressDialog() {
  // if (isDialogOpen) {
  Navigator.pop(navigatorKey.currentContext!);
  // }
}

void hideProgressDialog() {
  if (isDialogOpen) {
    Navigator.pop(navigatorKey.currentContext!);
  }
}

bool isDialogOpen = false;
Future<void> showCircularProgressDialog(
    {String msg = 'loading', bool disablebackButton = false}) async {
  isDialogOpen = true;
  customLog('Dialog Opened $isDialogOpen');

  final alert = AlertDialog(
    content: Row(
      children: [
        const CircularProgressIndicator(
          strokeWidth: 1,
          color: LightColor.primaryColor,
        ),
        customHorizontalGap(10),
        Container(
          margin: const EdgeInsets.only(left: 7),
          child: Text(msg.tr),
        ),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: navigatorKey.currentContext!,
    builder: (BuildContext context) {
      return WillPopScope(
          onWillPop: () async {
            if (disablebackButton) {
              return false;
            } else {
              return true;
            }
          },
          child: alert);
    },
  ).then((_) {
    isDialogOpen = false;
    customLog('DialogClosed $isDialogOpen');
  });
}
