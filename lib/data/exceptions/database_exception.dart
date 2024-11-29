class DatabaseException implements Exception {
  DatabaseException(this.code, this.message, {this.additionalInfo});
  String code;
  String message;
  String? additionalInfo;

  @override
  String toString() {
    return 'DatabaseException(code: $code, message: $message, additionalInfo: $additionalInfo)';
  }
}
