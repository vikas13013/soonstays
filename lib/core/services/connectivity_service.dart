import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService extends GetxService {

  final RxBool isConnected = true.obs;

  Future<ConnectivityService> init() async {

    final result =
    await Connectivity().checkConnectivity();

    isConnected.value = !result.contains(
      ConnectivityResult.none,
    );

    Connectivity().onConnectivityChanged.listen((results) {

      isConnected.value = !results.contains(
        ConnectivityResult.none,
      );
    });

    return this;
  }
}