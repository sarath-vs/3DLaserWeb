import 'package:dartz/dartz.dart';
import 'package:laser_tech_app/domain/models/products/quality_products_model.dart';
import '../../remote/exceptions/network_exceptions.dart';
import '../products/get_question_details_model.dart';
import '../products/questionModel.dart';

abstract class AssemblyProductFacade {
  Future<Either<NetworkExceptions, QualtyProductListModel>> getAssemblyProduct();
    Future<Either<NetworkExceptions, String>> saveAssemblyProduct(
      {required String name, required String description,required String time,required String ip,required String port,required String printerData});
  Future<Either<NetworkExceptions, String>> deleteAssemblyProduct(
      {required int id});
             Future<Either<NetworkExceptions, String>> putAssemblyProduct(
      {required int id, required String name, required String description,required String time,required String ip,required String port,required String printerData});

Future<Either<NetworkExceptions, QualityProductQuestionModel>>
      getAssemblyQuestions({required int id});
      Future<Either<NetworkExceptions, String>> postAssemblyQuestions(
      {required Map<String, Object?> dataToSend});
      
}
