import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Endpoints {
  static const storage = FlutterSecureStorage();

  static const String baseURLLive = "http:// 192.168.1.16:8000";
  static const String nim = "1315051069";
  static const String storageImage = "$baseURLLive/storage/";

  static const String datas = "$baseURLLive/api/datas";
  static const String product = "$baseURLLive/api/products";
  static const String payment = "$baseURLLive/api/payments";
  static const String order = "$baseURLLive/api/orders";

  static const String login = "$baseURLLive/api/auth/login";
  static const String logout = "$baseURLLive/api/auth/logout";
}
