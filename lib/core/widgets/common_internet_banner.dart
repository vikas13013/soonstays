import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/connectivity_service.dart';

class InternetBanner extends StatelessWidget {
  const InternetBanner({super.key});

  @override
  Widget build(BuildContext context) {

    return Obx(() {


      final status = Get.find<ConnectivityService>().isConnected.value;

      /// Initial Loading State
      if (status == null) {
        return const SizedBox();
      }

      /// Internet Available
      if (status) {
        return const SizedBox();
      }

      return Positioned(
        top: MediaQuery.of(context).padding.top,
        left: 0,
        right: 0,
        child: Material(
          child: Container(
            height: 40,
            color: Colors.orange,
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.wifi_off,
                  color: Colors.white,
                  size: 18,
                ),
                SizedBox(width: 8),
                Text(
                  "No Internet Connection",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}