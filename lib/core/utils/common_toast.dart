import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonstays/core/constants/app_size.dart';
import 'package:soonstays/core/constants/app_text_styles.dart';


enum AppToastType {
  success,
  error,
  warning,
  info,
}

class AppToast {
  static void show({
    String? title,
    required String message,
    AppToastType type = AppToastType.success,
    Duration duration = const Duration(seconds: 3),
  }) {

    Get.closeAllSnackbars();

    Color accentColor;

    switch (type) {
      case AppToastType.success:
        accentColor = const Color(0xFF2563EB);
        break;

      case AppToastType.error:
        accentColor = const Color(0xFFFF8A00);
        break;

      case AppToastType.warning:
        accentColor = const Color(0xFF6B8CFF);
        break;

      case AppToastType.info:
        accentColor = const Color(0xFF0D1B3D);
        break;
    }

    Get.rawSnackbar(
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      padding: EdgeInsets.zero,
      duration: duration,
      messageText: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.06),
              blurRadius: 20,
              spreadRadius: 0,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [

              /// Accent Line
              Container(
                width: 4,
                decoration: BoxDecoration(
                  color: accentColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      if (title != null) ...[
                        Text(
                          title,
                          style: AppTextStyle.primary16SemiBold,
                        ),

                        const SizedBox(height: 6),
                      ],

                      Text(
                        message,
                        style: AppTextStyle.black13Medium,
                      ),
                    ],
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}