import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonstays/core/constants/app_colors.dart';
import 'package:soonstays/core/constants/app_size.dart';
import 'package:soonstays/core/constants/app_strings.dart';
import 'package:soonstays/core/constants/app_text_styles.dart';
import 'package:pinput/pinput.dart';
import 'package:soonstays/core/get_storage/session_manager.dart';
import 'package:soonstays/core/widgets/common_buttons.dart';

import '../../app/routes/app_pages.dart';
import '../constants/app_strings.dart';

class CommonDialogs {

  static Future<void> showLogoutDialog({
    VoidCallback?onLogout,
    String?title,
    String?message,
  }) async {

    Get.dialog(

      Dialog(
        insetPadding: EdgeInsets.symmetric(
          horizontal: 15
        ),
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Container(
                height: 70,
                width: 70,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      AppColors.red.withOpacity(0.8),
                      AppColors.red,
                    ],
                  ),
                ),

                child: const Icon(
                  Icons.logout_rounded,
                  color: Colors.white,
                  size: 35,
                ),
              ),

              const SizedBox(height: 20),

              Text(
                AppStrings.logOutAccount,
                style: AppTextStyle.black20SemiBold,
              ),

              const SizedBox(height: 10),

              Text(
                AppStrings.areYouSureYouWantToLogOut,
                textAlign: TextAlign.center,
                style: AppTextStyle.greay14Regular,
              ),

              const SizedBox(height: 25),

              Row(
                children: [

                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Get.back(),
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: Text(AppStrings.cancel,style: AppTextStyle.primary14Medium,),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => SessionManager.instance.logout(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        minimumSize: const Size(double.infinity, 40),

                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(14),
                        ),
                      ),

                      child: Text(
                        AppStrings.logOut,
                        style: AppTextStyle.white14Medium,
                      ),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),

      barrierDismissible: false,
    );
  }


  static Future<void> CommonStatusDialog({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String message,
    required String buttonText,
    required VoidCallback onTap,
  }) async {

    Get.dialog(

      Dialog(
        insetPadding: EdgeInsets.symmetric(
          horizontal: 10
        ),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),

        child: Padding(

          padding: const EdgeInsets.all(24),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: iconColor.withOpacity(.08),
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 50,
                ),
              ),

              const SizedBox(height: 20),

              Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyle.black24SemiBold,
              ),

              const SizedBox(height: 12),

              Text(
                message,
                textAlign: TextAlign.center,
                style: AppTextStyle.greay12Regular.copyWith(
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 24),

              CommonButton(
                onTap: onTap,
                text: buttonText,
                height: 40,
                textStyle: AppTextStyle.white14SemiBold,
              ),

            ],
          ),
        ),
      ),

      barrierDismissible: false,
    );
  }

  static Future<void> DeleteDialog({
    required VoidCallback onTap,
  }) async {

    Get.dialog(

      Dialog(
        insetPadding: EdgeInsets.symmetric(
          horizontal: 15
        ),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),

        child: Padding(

          padding: const EdgeInsets.all(24),

          child: Column(

            mainAxisSize: MainAxisSize.min,

            children: [

              Container(

                height: 80,
                width: 80,

                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  shape: BoxShape.circle,
                ),

                child: Icon(
                  Icons.delete_forever_rounded,
                  size: 42,
                  color: Colors.red.shade600,
                ),
              ),

              const SizedBox(height: 20),

              Text(
                AppStrings.deleteAccount,
                style: AppTextStyle.primary22Bold,
              ),

              const SizedBox(height: 12),

              Text(
                AppStrings.areYouSureYouWantToPermanentlyDelete,
                textAlign: TextAlign.center,
                style: AppTextStyle.primary14Regular,
              ),

              const SizedBox(height: 10),

              Text(
                AppStrings.thisActionAccountBeUndone,
                textAlign: TextAlign.center,
                style: AppTextStyle.primary12Regular.copyWith(
                  color: Colors.grey.shade600,
                ),
              ),

              const SizedBox(height: 24),

              SizedBox(

                width: double.infinity,

                child: OutlinedButton(

                  onPressed: () {
                    Get.back();
                  },

                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(
                      double.infinity,
                      50,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(14),
                    ),
                  ),

                  child: Text(
                    AppStrings.keepAccount,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(

                width: double.infinity,

                child: ElevatedButton(

                  onPressed: onTap,

                  style: ElevatedButton.styleFrom(

                    backgroundColor: Colors.red,

                    minimumSize: const Size(
                      double.infinity,
                      52,
                    ),

                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(14),
                    ),
                  ),

                  child: Text(
                    AppStrings.deletePermanently,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      barrierDismissible: false,
    );
  }


  void showSessionExpiredDialog() {
    Get.dialog(
      PopScope(
        canPop: false,
        child: Dialog(
          insetPadding: EdgeInsets.symmetric(
              horizontal: 15
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.all(Radius.circular(25))
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: AppColors.white,
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF1F2),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Icon(
                    Icons.lock,
                    color: Color(0xFFFF4D5A),
                    size: 25,
                  ),
                ),

                20.height,

                Text(
                  AppStrings.checkoutSessionExpired,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.black20SemiBold,
                ),

                12.height,

                Text(
                  AppStrings.forYourSecurityTheBookingWindowHasTimedOut,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.greay12Light,
                ).marginSymmetric(
                    horizontal: 10
                ),

                25.height,


                CommonButton(
                  onTap: () {

                    /// Close Dialog
                    Get.back();

                    /// Go Home/Search Screen
                    Get.offAllNamed(
                      Routes.HOME,
                    );

                  },
                  text: AppStrings.startOver,
                  textStyle: AppTextStyle.white14SemiBold,
                )

              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

}

