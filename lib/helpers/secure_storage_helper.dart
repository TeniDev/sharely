import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  final _storage = const FlutterSecureStorage();

  Future<String> getToken() async {
    String? publicKey = await _storage.read(key: 'token');
    return publicKey ?? "";
  }

  Future<void> setToken(String value) async {
    await _storage.write(key: 'token', value: value);
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: 'token');
  }
}
