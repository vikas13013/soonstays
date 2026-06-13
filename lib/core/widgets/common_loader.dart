import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:soonstays/core/constants/app_colors.dart';
import 'package:soonstays/core/constants/app_strings.dart';
import 'package:soonstays/core/constants/app_text_styles.dart';
import '../constants/app_assets.dart';

class Loading {
  void configEasyLoading() {
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorWidget = Image.asset(
        AppAssets.logoGif,
        height: 70,
        width: 70,
      )
      ..indicatorSize = 40
      ..radius = 50
      ..backgroundColor = Colors.white
      ..indicatorColor = AppColors.primary
      ..textColor = Colors.black87
      ..textStyle = AppTextStyle.primary10Medium
    // 👇 full-screen light shadow effect
      ..maskColor = Colors.black.withOpacity(0.25) // soft shadow
      ..maskType = EasyLoadingMaskType.custom
      ..userInteractions = false
      ..dismissOnTap = false
      ..animationDuration = const Duration(milliseconds: 250)
      ..contentPadding = const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 15,
      );
  }

  onLoading({String? title}) async {
    await EasyLoading.show(
      dismissOnTap: false,
      // status: title ?? AppStrings.findingThePerfectStay,

    );
  }

  onDone() async {
    await EasyLoading.dismiss();
  }

  onDispose() async {
    await EasyLoading.dismiss();
  }

  onSuccess({msg}) async {
    await EasyLoading.showSuccess('$msg');
  }

  onError({msg}) async {
    await EasyLoading.showInfo('$msg');
  }

  snackBar(String? message, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
