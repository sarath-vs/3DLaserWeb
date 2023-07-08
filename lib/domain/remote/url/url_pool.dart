// ignore_for_file: non_constant_identifier_names

import 'package:injectable/injectable.dart';

@prod
@dev
@singleton
class URLPool {
// test
//http://65.1.86.132
//local czech
  final _baseUrl = 'http://qualitynewapi.lasertec.eu/accounts';

  final _login = '/login/';
  final _refresh = '/refreshtoken/';
  final _getProductName = '/name-list/';

/////////////////////////////////////////////////////////////////////////////////

  String get login => _baseUrl + _login;
  String get refreshTocken => _baseUrl + _refresh;
  // String get getProductname => 'http://qualitynewapi.lasertec.eu/admin-dashboard/categories/';
  // String get getProductType => 'http://qualitynewapi.lasertec.eu/products/sub-categories/';
  // String get getInitQstnModules => 'http://qualitynewapi.lasertec.eu/questions/modules/';
  // String get getQuestions => 'http://qualitynewapi.lasertec.eu/questions/';
  // String get saveAnswer => 'http://qualitynewapi.lasertec.eu/questions/answer/';
  // String get getDigitalMannualList => 'http://qualitynewapi.lasertec.eu/digital-manual/';
  // String get getDigitalMannualDetail => 'http://qualitynewapi.lasertec.eu/digital-manual/';
  String get getToolsList =>
      'http://qualitynewapi.lasertec.eu/admin-dashboard/tools/';
  String get saveTools =>
      'http://qualitynewapi.lasertec.eu/admin-dashboard/tools/';
  String get deleteTools =>
      'http://qualitynewapi.lasertec.eu/admin-dashboard/tools';

  String get getQualityProducts =>
      'http://qualitynewapi.lasertec.eu/admin-dashboard/category/';
  String get saveQualityProducts =>
      'http://qualitynewapi.lasertec.eu/admin-dashboard/category/';
  String get deleteQualityProducts =>
      'http://qualitynewapi.lasertec.eu/admin-dashboard/category';
  String get getQualityQuestions =>
      'http://qualitynewapi.lasertec.eu/admin-dashboard/question/';
  String get deleteQualityQuestions =>
      'http://qualitynewapi.lasertec.eu/admin-dashboard/question/';
  // String get editQualityQuestions =>
  //     'http://qualitynewapi.lasertec.eu/admin-dashboard/question/';
  String get postQualityQuestions =>
      'http://qualitynewapi.lasertec.eu/admin-dashboard/question/';

  String get editQualityQuestions =>
      'http://qualitynewapi.lasertec.eu/admin-dashboard/question/';
  String get getAnsweredProduct =>
      'http://qualitynewapi.lasertec.eu/admin-dashboard/answers/';

  String get assemblyDetails =>
      'http://qualitynewapi.lasertec.eu/admin-dashboard/assembly/category/';
  String get assemplyCompletedList =>
      'http://qualitynewapi.lasertec.eu/admin-dashboard/assembly/products/';
  String get assemblyQuestionDetails =>
      'http://qualitynewapi.lasertec.eu/admin-dashboard/assembly/question/';
  String get finalAssemblyProductList =>
      'http://qualitynewapi.lasertec.eu/final-admin/category/';
  String get finalAssembly =>
      'http://qualitynewapi.lasertec.eu/final-admin/category/';
  String get finalAssemblyQuestion =>
      'http://qualitynewapi.lasertec.eu/final-admin/question/';
}
