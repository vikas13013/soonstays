import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soonstays/core/constants/app_assets.dart';

import '../../../../core/constants/app_colors.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.splashBg),
              fit: BoxFit.fill
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                margin: EdgeInsets.all(60),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.white
                ),
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage(controller.logo),
                ),
              )

            ],
          ),
        )
    );
  }
}
