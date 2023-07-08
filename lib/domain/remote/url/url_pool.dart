// ignore_for_file: non_constant_identifier_names

import 'package:injectable/injectable.dart';

@prod
@dev
@singleton
class URLPool {
// test
//http://65.1.86.132
//local czech
  final _baseUrl = 'http://qualitynew.lasertec.eu/backend/accounts';

  final _login = '/login/';
  final _refresh = '/refreshtoken/';
  final _getProductName = '/name-list/';

/////////////////////////////////////////////////////////////////////////////////

  String get login => _baseUrl + _login;
  String get refreshTocken => _baseUrl + _refresh;
  // String get getProductname => 'http://qualitynew.lasertec.eu/backend/admin-dashboard/categories/';
  // String get getProductType => 'http://qualitynew.lasertec.eu/backend/products/sub-categories/';
  // String get getInitQstnModules => 'http://qualitynew.lasertec.eu/backend/questions/modules/';
  // String get getQuestions => 'http://qualitynew.lasertec.eu/backend/questions/';
  // String get saveAnswer => 'http://qualitynew.lasertec.eu/backend/questions/answer/';
  // String get getDigitalMannualList => 'http://qualitynew.lasertec.eu/backend/digital-manual/';
  // String get getDigitalMannualDetail => 'http://qualitynew.lasertec.eu/backend/digital-manual/';
  String get getToolsList =>
      'http://qualitynew.lasertec.eu/backend/admin-dashboard/tools/';
  String get saveTools =>
      'http://qualitynew.lasertec.eu/backend/admin-dashboard/tools/';
  String get deleteTools =>
      'http://qualitynew.lasertec.eu/backend/admin-dashboard/tools';

  String get getQualityProducts =>
      'http://qualitynew.lasertec.eu/backend/admin-dashboard/category/';
  String get saveQualityProducts =>
      'http://qualitynew.lasertec.eu/backend/admin-dashboard/category/';
  String get deleteQualityProducts =>
      'http://qualitynew.lasertec.eu/backend/admin-dashboard/category';
  String get getQualityQuestions =>
      'http://qualitynew.lasertec.eu/backend/admin-dashboard/question/';
  String get deleteQualityQuestions =>
      'http://qualitynew.lasertec.eu/backend/admin-dashboard/question/';
  // String get editQualityQuestions =>
  //     'http://qualitynew.lasertec.eu/backend/admin-dashboard/question/';
  String get postQualityQuestions =>
      'http://qualitynew.lasertec.eu/backend/admin-dashboard/question/';

  String get editQualityQuestions =>
      'http://qualitynew.lasertec.eu/backend/admin-dashboard/question/';
  String get getAnsweredProduct =>
      'http://qualitynew.lasertec.eu/backend/admin-dashboard/answers/';

  String get assemblyDetails =>
      'http://qualitynew.lasertec.eu/backend/admin-dashboard/assembly/category/';
  String get assemplyCompletedList =>
      'http://qualitynew.lasertec.eu/backend/admin-dashboard/assembly/products/';
  String get assemblyQuestionDetails =>
      'http://qualitynew.lasertec.eu/backend/admin-dashboard/assembly/question/';
  String get finalAssemblyProductList =>
      'http://qualitynew.lasertec.eu/backend/final-admin/category/';
  String get finalAssembly =>
      'http://qualitynew.lasertec.eu/backend/final-admin/category/';
  String get finalAssemblyQuestion =>
      'http://qualitynew.lasertec.eu/backend/final-admin/question/';
}
