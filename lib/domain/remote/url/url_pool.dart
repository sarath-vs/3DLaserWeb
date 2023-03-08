// ignore_for_file: non_constant_identifier_names

import 'package:injectable/injectable.dart';

@prod
@dev
@singleton
class URLPool {
// test
  final _baseUrl = 'http://65.1.86.132/api/accounts';

  final _login = '/login/';
  final _refresh = '/refreshtoken/';
  final _getProductName = '/name-list/';

/////////////////////////////////////////////////////////////////////////////////

  String get login => _baseUrl + _login;
  String get refreshTocken => _baseUrl + _refresh;
  String get getProductname => 'http://65.1.86.132/api/products/categories/';
  String get getProductType =>
      'http://65.1.86.132/api/products/sub-categories/';
  String get getInitQstnModules => 'http://65.1.86.132/api/questions/modules/';
  String get getQuestions => 'http://65.1.86.132/api/questions/';

  String get saveAnswer => 'http://65.1.86.132/api/questions/answer/';
  String get getDigitalMannualList => 'http://65.1.86.132/api/digital-manual/';
  String get getDigitalMannualDetail =>
      'http://65.1.86.132/api/digital-manual/';
}
