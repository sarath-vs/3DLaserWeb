import 'package:dartz/dartz.dart';
import 'package:laser_tech_app/domain/models/digital_mammual/model.dart';

import '../../remote/exceptions/network_exceptions.dart';
import 'mannual_detail_model.dart';

abstract class DigitalMannualFacade {
  Future<Either<NetworkExceptions, DigitalMannualListModel>>
      getDigitalMannualList();
  Future<Either<NetworkExceptions, MannualDetailModel>> getDigitalMannualDetail(
      {required int id});
}
