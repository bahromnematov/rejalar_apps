import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static storeApiKey(String apiKey) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: "apiKey", value: apiKey);
  }

  static Future<String?> loadApiKey() async {
    const storage = FlutterSecureStorage();
    return await storage.read(key: "apiKey");
  }

  static Future<void> removeApiKey() {
    const storage = FlutterSecureStorage();
    return storage.delete(key: "apiKey");
  }
}
