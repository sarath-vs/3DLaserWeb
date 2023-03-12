import 'package:dartz/dartz.dart';
import 'package:laser_tech_app/domain/models/products/quality_products_model.dart';
import 'package:laser_tech_app/domain/models/products/save_quality_product_model.dart';
import '../../remote/exceptions/network_exceptions.dart';

abstract class QualityProductFacade {
  Future<Either<NetworkExceptions, QualtyProductListModel>> getQualityProduct();
  Future<Either<NetworkExceptions, String>> saveQualityProduct(
      {required String name, required String description});
  Future<Either<NetworkExceptions, String>> deleteQualityProduct(
      {required int id});
}
