import 'package:dartz/dartz.dart';
import 'package:laser_tech_app/domain/models/login/refresh_model.dart';
import '../../remote/exceptions/network_exceptions.dart';
import 'login_model.dart';

abstract class AuthFacade {
  Future<Either<NetworkExceptions, LoginModel>> loginWithUsernameAndPassword({
    required String username,
    required String password,
  });
  Future<bool> logOut();
  Future<Either<NetworkExceptions, RefreshTockenModel>> refreshTocken(
      {required String refresh});
  Future<bool> isUserAuthenticated();
}
