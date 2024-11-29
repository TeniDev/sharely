import 'package:either_dart/either.dart';

import '../exceptions/exceptions.dart';
import '../models/models.dart';

abstract class UserRepository {
  Future<Either<DatabaseException, UserModel>> getUserProfile({
    required String id,
  });
}
