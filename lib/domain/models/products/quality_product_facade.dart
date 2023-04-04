import 'package:dartz/dartz.dart';
import 'package:laser_tech_app/domain/models/products/quality_products_model.dart';
import 'package:laser_tech_app/domain/models/products/questionModel.dart';
import '../../remote/exceptions/network_exceptions.dart';
import 'get_question_details_model.dart';

abstract class QualityProductFacade {
  Future<Either<NetworkExceptions, QualtyProductListModel>> getQualityProduct();
  Future<Either<NetworkExceptions, String>> saveQualityProduct(
      {required String name, required String description,required String time,required String ip,required String port,required String printerData});
      
  Future<Either<NetworkExceptions, String>> deleteQualityProduct(
      {required int id});
  // Future<Either<NetworkExceptions, String>> editQualityProduct(
  //     {required int id});

  Future<Either<NetworkExceptions, QualityProductQuestionModel>>
      getQualityQuestions({required int id});
  Future<Either<NetworkExceptions, String>> deleteQualityQuestions(
      {required int id});
  Future<Either<NetworkExceptions, String>> postQualityQuestions(
      {required Map<String, Object?> dataToSend});
       Future<Either<NetworkExceptions, GetQuestionDetailsModel>> getQuestionDetails(
      {required String id,required String screenName});
       Future<Either<NetworkExceptions, String>> putQuestionEdit(
      {required String id,required Map<String, Object?> dataToSend,required String screenName});
       Future<Either<NetworkExceptions, String>> putQualityProduct(
      {required int id, required String name, required String description,required String time,required String ip,required String port,required String printerData});
}
