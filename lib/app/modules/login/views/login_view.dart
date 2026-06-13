import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soonstays/core/constants/app_colors.dart';
import 'package:soonstays/core/constants/app_size.dart';
import 'package:soonstays/core/constants/app_strings.dart';
import 'package:soonstays/core/constants/app_text_styles.dart';
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
      appBar: CommonAppBar(title: '${AppStrings.login}'),
      drawer: CommonDrawer(),
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
                                      text: "${AppStrings.soonstays}",
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

                const SizedBox(height: 20),

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
                                  "Welcome to SoonStays! 👋",
                                  style: AppTextStyle.secondary12Medium,
                                ),

                                const SizedBox(height: 10),

                                const Text(
                                  "Login or Sign Up",
                                  style: AppTextStyle.primary20Bold,
                                ),

                                const SizedBox(height: 5),

                                Text(
                                  "Enter your mobile number to continue",
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

                      const SizedBox(height: 15),

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

                                  const Text(
                                    "🇮🇳",
                                    style: TextStyle(fontSize: 20,
                                    ),
                                  ),

                                  const SizedBox(width: 5),

                                  const Text(
                                    "+91",
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
                                  hintText: "Enter 10-digit mobile number",
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

                      const SizedBox(height: 15),

                      /// BUTTON
                      Obx(() => CommonButton(
                        onTap: () => controller.isDisable.value==false?null:controller.sendOtp(),
                        height: 40,
                        text: "${AppStrings.getOTP}",
                        textStyle: AppTextStyle.white14SemiBold,
                        color1: controller.isDisable.value==false?AppColors.primary.withOpacity(0.4):AppColors.primary,
                        color2: controller.isDisable.value==false?AppColors.blue.withOpacity(0.4):AppColors.blue,
                      ),),

                      const SizedBox(height: 10),

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

                          const SizedBox(width: 5),

                          Text(
                            "Your data is safe and secure with us.",
                            style: AppTextStyle.primary12Light,
                          )
                        ],
                      ),

                      const SizedBox(height: 15),

                      /// TERMS
                      Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: AppTextStyle.primary12Regular,
                            children: [

                              TextSpan(
                                text: "By continuing, you agree to our ",
                              ),

                              TextSpan(
                                text: "Terms & Privacy Policy",
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
                  title: "Best Price Guarantee",
                  subtitle:
                  "We ensure you get the most\ncompetitive rates for your stay.",
                ),

                const SizedBox(height: 10),

                featureCard(
                  icon: Icons.support_agent,
                  title: "24/7 Dedicated Support",
                  subtitle:
                  "Our customer service team is\nalways available to help you.",
                ),

                const SizedBox(height: 10),

                featureCard(
                  icon: Icons.location_on_outlined,
                  title: "Pan-India Network",
                  subtitle:
                  "500+ handpicked hotels across\ntier-1 and tier-2 cities.",
                ),

                const SizedBox(height: 30),
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
