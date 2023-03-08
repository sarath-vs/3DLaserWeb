import 'package:flutter/foundation.dart';

Future<void> customLog(Object obj) async {
  if (kDebugMode && !kReleaseMode) {
    debugPrintSynchronously(obj.toString());
  }
}
