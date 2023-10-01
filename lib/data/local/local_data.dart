import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalData{
  static const accessToken = "access_token";

  Future<void> setPref(String prefName,String prefValue) async {
    FlutterSecureStorage secureStorage = const FlutterSecureStorage();
    await secureStorage.write(key: prefName, value: prefValue);
  }

  Future<String> getPref(String prefName) async{
    FlutterSecureStorage secureStorage = const FlutterSecureStorage();
    final String? storedRefreshToken = await secureStorage.read(key: prefName);
    return storedRefreshToken ?? "";
  }
}