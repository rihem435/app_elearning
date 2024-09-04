import 'package:app/core/storage/storage.dart';

class AppStorage {
  static const String keyName = "name";
  static const String keyEmail = "email";
  static const String keyId = "id";

  static saveName(String name) {
    SecureStorage.writeSecureData(key: keyName, value: name);
  }

  static String? readName() {
    return SecureStorage.readSecureData(keyName);
  }

  static saveEmail(String email) {
    SecureStorage.writeSecureData(key: keyEmail, value: email);
  }

  static String? readEmail() {
    return SecureStorage.readSecureData(keyEmail);
  }

  static saveId(String id) {
    SecureStorage.writeSecureData(key: keyId, value: id);
  }

  static String? readId() {
    return SecureStorage.readSecureData(keyId);
  }
}
