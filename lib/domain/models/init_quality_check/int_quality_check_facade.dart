import 'package:dartz/dartz.dart';
import 'package:laser_tech_app/domain/models/init_quality_check/product_name_model.dart';
import 'package:laser_tech_app/domain/models/init_quality_check/product_type_model.dart';
import 'package:laser_tech_app/domain/models/init_quality_check/product_entry_model.dart';
import '../../remote/exceptions/network_exceptions.dart';
import 'answer_status_model.dart';

abstract class InitialQualityCheckFacade {
  Future<Either<NetworkExceptions, ProductNameModel>> getproductName();
  Future<Either<NetworkExceptions, ProductTypeModel>> getProductType(
      {required String id});
  Future<Either<NetworkExceptions, ProductEntryModel>> getQuestions(
      {required String product_subcategory,
      required String sl_no,
      required String size,
      required String manufacture_name});
  Future<Either<NetworkExceptions, AnswerStatusModel>> saveAnswer({
    required int id,
    required bool answer,
  });
}
