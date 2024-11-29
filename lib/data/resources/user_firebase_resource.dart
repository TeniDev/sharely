import 'package:either_dart/either.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../exceptions/exceptions.dart';
import '../models/models.dart';
import '../repositories/repositories.dart';

class UserFirebaseResource implements UserRepository {
  UserFirebaseResource({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;

  final FirebaseFirestore _firebaseFirestore;

  @override
  Future<Either<DatabaseException, UserModel>> getUserProfile({
    required String id,
  }) async {
    try {
      final response = await _firebaseFirestore.collection('users').doc(id).get();

      if (!response.exists) {
        return Left(DatabaseException('1001', 'Error: User not found'));
      }

      return Right(
        UserModel(
          email: response.get('email'),
          fullName: response.get('name'),
          language: response.get('language'),
          nickname: response.get('nickname'),
        ),
      );
    } on FirebaseException catch (e) {
      return Left(DatabaseException(e.code, e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(DatabaseException('1000', 'Unknown error: $e'));
    }
  }
}
