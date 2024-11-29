class AuthException implements Exception {
  AuthException(this.code, this.message);
  String code;
  String message;

  @override
  String toString() {
    return 'AuthException(code: $code, message: $message)';
  }
}
