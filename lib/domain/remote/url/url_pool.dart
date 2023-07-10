// ignore_for_file: non_constant_identifier_names

import 'package:injectable/injectable.dart';

@prod
@dev
@singleton
class URLPool {
// test
  final _baseUrl = 'http://65.1.86.132/accounts';
//local czech
  // final _baseUrl = 'http://qualitynew.lasertec.eu/backend/accounts';

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
  String get getToolsList => 'http://65.1.86.132/admin-dashboard/tools/';
  String get saveTools => 'http://65.1.86.132/admin-dashboard/tools/';
  String get deleteTools => 'http://65.1.86.132/admin-dashboard/tools/';

  String get getQualityProducts =>
      'http://65.1.86.132/admin-dashboard/category/';
  String get saveQualityProducts =>
      'http://qualitynew.lasertec.eu/backend/admin-dashboard/category/';
  String get deleteQualityProducts =>
      'http://65.1.86.132/admin-dashboard/category';
  String get getQualityQuestions =>
      'http://65.1.86.132/admin-dashboard/question/';
  String get deleteQualityQuestions =>
      'http://65.1.86.132/admin-dashboard/question/';
  // String get editQualityQuestions =>
  //     'http://qualitynew.lasertec.eu/backend/admin-dashboard/question/';
  String get postQualityQuestions =>
      'http://65.1.86.132/admin-dashboard/question/';

  String get editQualityQuestions =>
      'http://65.1.86.132/admin-dashboard/question/';
  String get getAnsweredProduct =>
      'http://65.1.86.132/admin-dashboard/answers/';

  String get assemblyDetails =>
      'http://65.1.86.132/admin-dashboard/assembly/category/';
  String get assemplyCompletedList =>
      'http://65.1.86.132/admin-dashboard/assembly/products/';
  String get assemblyQuestionDetails =>
      'http://65.1.86.132/admin-dashboard/assembly/question/';
  String get finalAssemblyProductList =>
      'http://65.1.86.132/final-admin/category/';
  String get finalAssembly => 'http://65.1.86.132/final-admin/category/';
  String get finalAssemblyQuestion =>
      'http://65.1.86.132/final-admin/question/';
}
