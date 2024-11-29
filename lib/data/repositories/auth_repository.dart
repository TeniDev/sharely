import 'package:either_dart/either.dart';

import '../exceptions/exceptions.dart';
import '../models/models.dart';

abstract class AuthRepository {
  Future<Either<AuthException, LoginResponseModel>> login({
    required LoginRequestModel loginRequest,
  });
  Future<Either<AuthException, void>> register({
    required String register,
  });
  Future<Either<AuthException, void>> logout({
    required String uid,
  });
}
