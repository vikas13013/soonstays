import 'package:get_storage/get_storage.dart';
import 'package:soonstays/core/get_storage/storage_keys.dart';
import 'package:get/get.dart';
import '../../app/routes/app_pages.dart';

class SessionManager {

  SessionManager._();

  static final SessionManager instance = SessionManager._();

  final GetStorage box = GetStorage();

  Future<void> saveSession({
    required String accessToken,
    required String refreshToken,
    required String tempId,
    required Map<String, dynamic> user,
  }) async {

    await box.write(
      StorageKeys.accessToken,
      accessToken,
    );

    await box.write(
      StorageKeys.refreshToken,
      refreshToken,
    );

    await box.write(
      StorageKeys.tempId,
      tempId,
    );

    await box.write(
      StorageKeys.user,
      user,
    );

  }

  String? get accessToken => box.read(StorageKeys.accessToken);

  String? get refreshToken => box.read(StorageKeys.refreshToken);

  Map<dynamic, dynamic> get user => box.read(StorageKeys.user);

  bool get isLoggedIn {

    final token = box.read('access_token');

    final user = box.read('user');

    return token != null && token.toString().isNotEmpty && user != null;

  }

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {

    await box.write(
      StorageKeys.accessToken,
      accessToken,
    );

    await box.write(
      StorageKeys.refreshToken,
      refreshToken,
    );

  }

  Future<void> logout() async {

    await box.erase();


    Get.offAllNamed(
      Routes.HOME,
    );

  }

}