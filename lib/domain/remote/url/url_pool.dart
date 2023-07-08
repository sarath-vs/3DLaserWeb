// ignore_for_file: non_constant_identifier_names

import 'package:injectable/injectable.dart';

@prod
@dev
@singleton
class URLPool {
// test
//http://65.1.86.132
//local czech
  final _baseUrl = 'qualitynewapi.lasertec.eu/accounts';

  final _login = '/login/';
  final _refresh = '/refreshtoken/';
  final _getProductName = '/name-list/';

/////////////////////////////////////////////////////////////////////////////////

  String get login => _baseUrl + _login;
  String get refreshTocken => _baseUrl + _refresh;
  // String get getProductname => 'qualitynewapi.lasertec.eu/admin-dashboard/categories/';
  // String get getProductType => 'qualitynewapi.lasertec.eu/products/sub-categories/';
  // String get getInitQstnModules => 'qualitynewapi.lasertec.eu/questions/modules/';
  // String get getQuestions => 'qualitynewapi.lasertec.eu/questions/';
  // String get saveAnswer => 'qualitynewapi.lasertec.eu/questions/answer/';
  // String get getDigitalMannualList => 'qualitynewapi.lasertec.eu/digital-manual/';
  // String get getDigitalMannualDetail => 'qualitynewapi.lasertec.eu/digital-manual/';
  String get getToolsList => 'qualitynewapi.lasertec.eu/admin-dashboard/tools/';
  String get saveTools => 'qualitynewapi.lasertec.eu/admin-dashboard/tools/';
  String get deleteTools => 'qualitynewapi.lasertec.eu/admin-dashboard/tools';

  String get getQualityProducts =>
      'qualitynewapi.lasertec.eu/admin-dashboard/category/';
  String get saveQualityProducts =>
      'qualitynewapi.lasertec.eu/admin-dashboard/category/';
  String get deleteQualityProducts =>
      'qualitynewapi.lasertec.eu/admin-dashboard/category';
  String get getQualityQuestions =>
      'qualitynewapi.lasertec.eu/admin-dashboard/question/';
  String get deleteQualityQuestions =>
      'qualitynewapi.lasertec.eu/admin-dashboard/question/';
  // String get editQualityQuestions =>
  //     'qualitynewapi.lasertec.eu/admin-dashboard/question/';
  String get postQualityQuestions =>
      'qualitynewapi.lasertec.eu/admin-dashboard/question/';

  String get editQualityQuestions =>
      'qualitynewapi.lasertec.eu/admin-dashboard/question/';
  String get getAnsweredProduct =>
      'qualitynewapi.lasertec.eu/admin-dashboard/answers/';

  String get assemblyDetails =>
      'qualitynewapi.lasertec.eu/admin-dashboard/assembly/category/';
  String get assemplyCompletedList =>
      'qualitynewapi.lasertec.eu/admin-dashboard/assembly/products/';
  String get assemblyQuestionDetails =>
      'qualitynewapi.lasertec.eu/admin-dashboard/assembly/question/';
  String get finalAssemblyProductList =>
      'qualitynewapi.lasertec.eu/final-admin/category/';
  String get finalAssembly => 'qualitynewapi.lasertec.eu/final-admin/category/';
  String get finalAssemblyQuestion =>
      'qualitynewapi.lasertec.eu/final-admin/question/';
}
