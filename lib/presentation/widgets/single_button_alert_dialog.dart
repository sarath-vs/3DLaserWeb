import 'package:flutter/material.dart';

Future<void> showSingleButtonAlertDialog(
  BuildContext context,
  String title,
  String content,
  void Function() onPressed,
) async {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: onPressed,
            child: const Text('ok'),
          ),
        ],
      );
    },
  );
}
