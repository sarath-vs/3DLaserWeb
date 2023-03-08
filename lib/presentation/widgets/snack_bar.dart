import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../../domain/responsive/dimensions.dart';
import '../../main.dart';

Future<void> showCircularProgressDialog2({String msg = 'loading'}) async {
  final alert = AlertDialog(
    content: Row(
      children: [
        const CircularProgressIndicator(
          strokeWidth: 1,
          color: Colors.black,
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
      return alert;
    },
  );
}
