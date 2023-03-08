import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../main.dart';

@module
abstract class ConnectivityModule {
  @singleton
  Connectivity get connectivity => Connectivity();
}

@singleton
class InternetConnectivity {
  final Connectivity connectivity;

  InternetConnectivity(this.connectivity);

  Future<bool> isNotConnectedToInternet() async {
    final connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> internetConnectivityStream() async {
    connectivity.onConnectivityChanged.listen((connectivityResult) {
      var message = 'No Internet available';
      if (connectivityResult == ConnectivityResult.mobile) {
        message = 'Connected to Mobile Data';
      } else if (connectivityResult == ConnectivityResult.wifi) {
        message = 'Connected to Wifi';
      } else if (connectivityResult == ConnectivityResult.ethernet) {
        message = 'Connected to Ethernet';
      } else {
        message = 'No Internet available';
      }
      ScaffoldMessenger.of(navigatorKey.currentContext!)
          .showSnackBar(SnackBar(content: Text(message)));
    });
  }
}
