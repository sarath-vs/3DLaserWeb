import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class Modules {
  // @preResolve
  // @singleton
  // Future<PackageInfo> get packageInfo => PackageInfo.fromPlatform();

  @preResolve
  @singleton
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();

  // @singleton
  // DeviceInfoPlugin get deviceInfoPlugin => DeviceInfoPlugin();

  // @singleton
  // FirebaseMessaging get firebaseMessaging => FirebaseMessaging.instance;

  // @singleton
  // @preResolve
  // Future<Box<LocationInfo>> get hive async {
  //   const _hiveBoxName = 'location_info_box_hive';
  //   if (Hive.isBoxOpen(_hiveBoxName)) {
  //     return Hive.box(_hiveBoxName);
  //   } else {
  //     return Hive.openBox<LocationInfo>(_hiveBoxName);
  //   }
  // }

  // @singleton
  // Location get location => Location();
}
