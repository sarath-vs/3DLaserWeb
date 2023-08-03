// ignore_for_file: non_constant_identifier_names

import 'package:injectable/injectable.dart';

@prod
@dev
@singleton
class URLPool {
// test
  //  final _baseUrl = 'http://65.1.86.132';
//local czech
  final _baseUrl = 'http://qualitynew.lasertec.eu/backend';

  ////// account apis////
  final _login = '/accounts/login/';
  final _refresh = '/accounts/refreshtoken/';
  final _getProductName = '/accounts/name-list/';
/////////////////////////////////////////////////////////////////////////////////
  String get login => _baseUrl + _login;
  String get refreshTocken => _baseUrl + _refresh;
  String get getToolsList => _baseUrl + '/admin-dashboard/tools/';
  String get saveTools => _baseUrl + '/admin-dashboard/tools/';
  String get deleteTools => _baseUrl + '/admin-dashboard/tools/';
  String get getQualityProducts => _baseUrl + '/admin-dashboard/category/';
  String get saveQualityProducts => _baseUrl + '/admin-dashboard/category/';
  String get deleteQualityProducts => _baseUrl + '/admin-dashboard/category';
  String get getQualityQuestions => _baseUrl + '/admin-dashboard/question/';
  String get deleteQualityQuestions => _baseUrl + '/admin-dashboard/question/';
  String get postQualityQuestions => _baseUrl + '/admin-dashboard/question/';
  String get editQualityQuestions => _baseUrl + '/admin-dashboard/question/';
  String get getAnsweredProduct => _baseUrl + '/admin-dashboard/answers/';
  String get assemblyDetails =>
      _baseUrl + '/admin-dashboard/assembly/category/';
  String get assemplyCompletedList =>
      _baseUrl + '/admin-dashboard/assembly/products/';
  String get assemblyQuestionDetails =>
      _baseUrl + '/admin-dashboard/assembly/question/';
  String get finalAssemblyProductList => _baseUrl + '/final-admin/category/';
  String get finalAssembly => _baseUrl + '/final-admin/category/';
  String get finalAssemblyQuestion => _baseUrl + '/final-admin/question/';
}
