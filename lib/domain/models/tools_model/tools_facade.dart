import 'package:dartz/dartz.dart';
import 'package:laser_tech_app/domain/models/tools_model/tools_model.dart';

import '../../remote/exceptions/network_exceptions.dart';

abstract class ToolsFacade {
  Future<Either<NetworkExceptions, ToolsModel>> getToolsDetail();
}
