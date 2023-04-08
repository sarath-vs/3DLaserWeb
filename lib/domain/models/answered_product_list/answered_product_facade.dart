

import 'package:dartz/dartz.dart';


import '../../remote/exceptions/network_exceptions.dart';
import 'answer_model.dart';
import 'answered_product_list_model.dart';

abstract class AnsweredProductFacade {
 

  Future<Either<NetworkExceptions, AnsweredProductListModel>> getAnsweredProductList({required int id,required String screenName});
  Future<Either<NetworkExceptions, AnswerModel>> getAnswerList({required int id});
}
