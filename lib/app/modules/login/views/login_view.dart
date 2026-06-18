import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soonstays/core/constants/app_colors.dart';
import 'package:soonstays/core/constants/app_size.dart';
import 'package:soonstays/core/constants/app_strings.dart';
import 'package:soonstays/core/constants/app_text_styles.dart';
import 'package:soonstays/core/constants/app_urls.dart';
import 'package:soonstays/core/widgets/common_appbar.dart';
import 'package:soonstays/core/widgets/common_buttons.dart';
import 'package:soonstays/core/widgets/common_footer.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/widgets/drawer.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

import 'package:flutter/material.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: CommonAppBar(
          title: AppStrings.login,
          isActionTrue: true
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [

              AppColors.lightBg,

              AppColors.white,

              AppColors.lightBg,

              AppColors.lightBg,

            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [

                /// Login Card
                Stack(
                  children: [

                    Image.asset(
                      AppAssets.loginBg,
                      width: Get.width,
                    ),

                    Positioned(
                      top: 20,
                      left: 15,
                      right: Get.width*0.3,
                      child: Column(
                        children: [

                          Text.rich(
                            TextSpan(
                                text: "${AppStrings.yourJourneyBegins} ",
                                style: AppTextStyle.primary24ExtraBold,
                                children: [

                                  TextSpan(
                                      text: AppStrings.soonstays,
                                      style: AppTextStyle.secondary24ExtraBold
                                  )

                                ]
                            ),
                          ),

                          10.height,

                          Text(
                            AppStrings.seamLessHotelBookingsWithExlusive,
                            style: AppTextStyle.primary12Medium.copyWith(
                                height: 1.6
                            ),
                            textAlign: TextAlign.start,
                          ).paddingOnly(
                              right: Get.width*0.2
                          ),

                        ],
                      ),
                    )

                  ],
                ),

                20.height,

                /// LOGIN CARD
                Container(
                  padding: const EdgeInsets.all(15),
                  margin: EdgeInsets.symmetric(
                    horizontal: 15
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: AppColors.primary.withOpacity(.12),
                      width: 0.5
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff2563EB).withOpacity(0.08),
                        blurRadius: 25,
                        spreadRadius: 2,
                        offset: const Offset(0, 10),
                      ),

                      /// LIGHT WHITE GLOW
                      BoxShadow(
                        color: Colors.white.withOpacity(0.9),
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: const Offset(-2, -2),
                      ),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text(
                                  AppStrings.welcomeToSoonstays,
                                  style: AppTextStyle.secondary12Medium,
                                ),

                                10.height,

                                Text(
                                  AppStrings.loginOrSignUp,
                                  style: AppTextStyle.primary20Bold,
                                ),

                                5.height,

                                Text(
                                  AppStrings.enterYourMobileNumberToContinue,
                                  style: AppTextStyle.primary10Light,
                                ),


                              ],
                            ),
                          ),

                          Align(
                            alignment: Alignment.centerRight,
                            child: Image.asset(
                              AppAssets.loginIcon,
                              height: 70,
                            ),
                          ),

                        ],
                      ),

                      15.height,

                      /// MOBILE FIELD
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.black.withOpacity(.15),
                          ),
                        ),
                        child: Row(
                          children: [

                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Row(
                                children: [

                                  Text(
                                    AppStrings.IN,
                                    style: const TextStyle(fontSize: 20,
                                    ),
                                  ),

                                  const SizedBox(width: 5),

                                  const Text(
                                    AppUrls.phoneCode,
                                    style: AppTextStyle.primary14SemiBold,
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              width: 1,
                              height: 30,
                              color: Colors.black.withOpacity(.15),
                            ),

                            Expanded(
                              child: TextField(
                                controller: controller.mobileNumberController.value,
                                style: TextStyle(
                                  color: AppColors.primary,
                                ),
                                onChanged: (value) {

                                  if(value.length==10){

                                    controller.isDisable.value = true;

                                  }else{

                                    controller.isDisable.value = false;

                                  }

                                },
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  hintText: AppStrings.enter10DigitNumber,
                                  hintStyle: AppTextStyle.primary14Light.copyWith(
                                      color: Colors.black54
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      15.height,

                      /// BUTTON
                      Obx(() => CommonButton(
                        onTap: () => controller.isDisable.value==false?null:controller.sendOtp(),
                        height: 40,
                        text: AppStrings.getOTP,
                        textStyle: AppTextStyle.white14SemiBold,
                        color1: controller.isDisable.value==false?AppColors.primary.withOpacity(0.4):AppColors.primary,
                        color2: controller.isDisable.value==false?AppColors.blue.withOpacity(0.4):AppColors.blue,
                      ),),

                      10.height,

                      /// SECURITY
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,

                        children: [

                          Icon(
                            Icons.verified_user_outlined,
                            color: Colors.grey,
                            size: 12,
                          ),

                          5.width,

                          Text(
                            AppStrings.yourDataIsSafeAndSecureWithUs,
                            style: AppTextStyle.primary12Light,
                          )
                        ],
                      ),

                      15.height,

                      /// TERMS
                      Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: AppTextStyle.primary12Regular,
                            children: [

                              TextSpan(
                                text: AppStrings.byContinuingYouAgreeToOur,
                              ),

                              TextSpan(
                                text: AppStrings.termsAndPrivacyPolicy,
                                style: AppTextStyle.black12Regular.copyWith(
                                    color: AppColors.blue1
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                20.height,

                /// FEATURE CARD
                featureCard(
                  icon: Icons.shield_outlined,
                  title: AppStrings.bestPriceGuarantee,
                  subtitle: AppStrings.weEnsureYouGetTheMost,
                ),

                10.height,

                featureCard(
                  icon: Icons.support_agent,
                  title: AppStrings.dedicatedSupport,
                  subtitle: AppStrings.ourCustomerServiceTeamIs,
                ),

                10.height,

                featureCard(
                  icon: Icons.location_on_outlined,
                  title: AppStrings.panIndiaNetwork,
                  subtitle: AppStrings.handpickedHotelsAcross,
                ),

                30.height,

              ],
            ),
          ),
        ),
      ),
    );
  }

  /// TOP BUTTON
  Widget topButton({
    required IconData icon,
    required String title,
  }) {

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withOpacity(.15),
        ),
        color: Colors.white.withOpacity(.03),
      ),
      child: ShaderMask(

        shaderCallback: (bounds) {

          return LinearGradient(

            colors: [

              Colors.white.withOpacity(0.5),

              Color(0xffFF9B2F),

              Color(0xffFF5E62),
            ],

          ).createShader(bounds);
        },

        child: Icon(
          icon,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }

  /// FEATURE CARD
  Widget featureCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.white.withOpacity(.12),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xff2563EB).withOpacity(0.08),
            blurRadius: 25,
            spreadRadius: 2,
            offset: const Offset(0, 10),
          ),

          /// LIGHT WHITE GLOW
          BoxShadow(
            color: Colors.white.withOpacity(0.9),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(-2, -2),
          ),
        ],
      ),

      child: Row(
        children: [

          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.lightBg,
            ),
            child: ShaderMask(

              shaderCallback: (bounds) {

                return LinearGradient(

                  colors: [

                    Colors.white.withOpacity(0.5),

                    Color(0xffFFB347),

                    Color(0xffFF7A59),

                    Color(0xffFF6B00),

                  ],

                ).createShader(bounds);
              },
              child: Icon(
                icon,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),

          const SizedBox(width: 18),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Text(
                  title,
                  style: AppTextStyle.primary14SemiBold,
                ),

                const SizedBox(height: 3),

                Text(
                  subtitle,
                  style: AppTextStyle.primary11Regular
                )

              ],
            ),
          ),

          const Icon(
            Icons.arrow_forward_ios,
            color: AppColors.primary,
            size: 20,
          )

        ],
      ),
    );
  }
}
