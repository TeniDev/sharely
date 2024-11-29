import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../exceptions/exceptions.dart';
import '../models/models.dart';
import '../repositories/repositories.dart';

class AuthFirebaseResource implements AuthRepository {
  AuthFirebaseResource({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  final FirebaseAuth _firebaseAuth;

  @override
  Future<Either<AuthException, LoginResponseModel>> login({
    required LoginRequestModel loginRequest,
  }) async {
    try {
      final response = await _firebaseAuth.signInWithEmailAndPassword(
        email: loginRequest.email,
        password: loginRequest.password,
      );

      if (response.user == null) {
        return Left(AuthException('1001', 'Error: User not found'));
      }

      return Right(
        LoginResponseModel(id: response.user!.uid),
      );
    } on FirebaseAuthException catch (e) {
      return Left(AuthException(e.code, e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(AuthException('1000', 'Unknown error: $e'));
    }
  }

  @override
  Future<Either<AuthException, void>> logout({required String uid}) {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either<AuthException, void>> register({required String register}) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
