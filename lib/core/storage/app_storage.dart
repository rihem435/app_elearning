import 'package:app/core/storage/storage.dart';

class AppStorage {
  static const String keyName = "name";
  static const String keyEmail = "email";

  static saveName(String name) {
    SecureStorage.writeSecureData(key: keyName, value: name);
  }

  static readName() {
    return SecureStorage.readSecureData(keyName);
  }

  static saveEmail(String email) {
    SecureStorage.writeSecureData(key: keyEmail, value: email);
  }

  static readEmail() {
    return SecureStorage.readSecureData(keyEmail);
  }
}
