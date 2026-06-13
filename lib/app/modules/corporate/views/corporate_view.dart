import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:soonstays/core/constants/app_colors.dart';
import 'package:soonstays/core/constants/app_size.dart';
import 'package:soonstays/core/constants/app_strings.dart';
import 'package:soonstays/core/constants/app_text_styles.dart';
import 'package:soonstays/core/constants/app_urls.dart';
import 'package:soonstays/core/widgets/common_appbar.dart';
import 'package:soonstays/core/widgets/common_captcha.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/utils/textfield_validation.dart';
import '../../../../core/widgets/common_buttons.dart';
import '../../../../core/widgets/common_text_field.dart';
import '../../../../core/widgets/drawer.dart';
import '../controllers/corporate_controller.dart';

///Corporate View
class CorporateView extends GetView<CorporateController> {
  const CorporateView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CommonAppBar(
          title: "${AppStrings.corporatePartner}"
      ),
      drawer: CommonDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// ================= HERO =================
            Stack(
              clipBehavior: Clip.none,
              children: [

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 60,
                    bottom: 120,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppAssets.corporateBg),
                      fit: BoxFit.fill
                    )
                  ),
                  child: Column(
                    children: [

                      /// BADGE
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          AppStrings.corporatePartner.toUpperCase(),
                          style: AppTextStyle.white12SemiBold.copyWith(letterSpacing: 2),
                        ),
                      ),

                      20.height,

                      /// TITLE
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: AppTextStyle.white24Bold,
                          children: [

                            TextSpan(
                              text: "${AppStrings.smartStaysFor} ",
                              style: TextStyle(
                                color: AppColors.primary,
                              ),
                            ),

                            TextSpan(
                              text: AppStrings.smartBusinesses,
                              style: TextStyle(
                                color: AppColors.secondary,
                              ),
                            ),

                          ],
                        ),
                      ),

                      15.height,

                      /// SUBTITLE
                      Text(
                        AppStrings.simplifyYourCompanyTravelWith,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.primary12Regular,
                      ),
                    ],
                  ),
                ),

                /// STATS CARD
                Positioned(
                  left: 10,
                  right: 10,
                  bottom: -80,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 26,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.08),
                          blurRadius: 14,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),

                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [

                        _TopFeature(
                          icon: Icons.business,
                          iconColor: AppColors.blue1,
                          title: "500+ ${AppStrings.hotels}",
                        ),

                        _TopFeature(
                          icon: Icons.verified,
                          iconColor: Colors.green,
                          title: AppStrings.gstAssured,
                        ),

                        _TopFeature(
                          icon: Icons.support_agent,
                          iconColor: Colors.deepOrange,
                          title: AppStrings.travelDesk,
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),

            80.height,

            /// ================= FORM =================
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(
                    color: AppColors.greyLight,
                    width: 1
                ),
                boxShadow: [
                  BoxShadow(
                    color:
                    Colors.black.withOpacity(.2),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Form(
                key: controller.globalKey.value,
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [

                    10.height,

                    Text(
                      AppStrings.partnerWithSoonstays,
                      style: AppTextStyle.primary20ExtraBold,
                    ),

                    5.height,

                    Text(
                      AppStrings.fillTheFormAndWell,
                      style: AppTextStyle.greyDark12Light,
                    ),
                    // 0xff64748B

                    20.height,

                    Text(
                      AppStrings.name.toUpperCase(),
                      style: AppTextStyle.greay14Medium,
                    ),

                    5.height,

                    ///Username TextField
                    CustomInputFieldBorder(
                      borderColor: AppColors.black,
                      controller: controller.nameController.value,
                      hintText: AppStrings.enterName,
                      validator: (value) => Validators.required(
                          value,
                          AppStrings.userNameIsRequired.tr
                      ),
                    ),

                    25.height,

                    Text(
                      AppStrings.mobileNumber.toUpperCase(),
                      style: AppTextStyle.greay14Medium,
                    ),

                    5.height,

                    ///mobile TextField
                    CustomInputFieldBorder(
                      borderColor: AppColors.black,
                      controller: controller.mobileController.value,
                      hintText: AppStrings.digitNumber,
                      inputType: TextInputType.phone,
                      inputFormattes: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      validator: (value) => Validators.phone(
                          value,
                          10
                      ),
                    ),

                    20.height,

                    Text(
                      AppStrings.email.toUpperCase(),
                      style: AppTextStyle.greay14Medium,
                    ),

                    5.height,

                    ///Email TextField
                    CustomInputFieldBorder(
                      borderColor: AppColors.black,
                      controller: controller.emailController.value,
                      hintText: AppStrings.abcCompanyCom,
                      validator: (value) => Validators.email(
                          controller.emailController.value.text.toString()
                      ),
                    ),

                    20.height,

                    Text(
                      AppStrings.companyName.toUpperCase(),
                      style: AppTextStyle.greay14Medium,
                    ),

                    5.height,

                    ///Company Name TextField
                    CustomInputFieldBorder(
                      borderColor: AppColors.black,
                      controller: controller.companyNameController.value,
                      hintText: AppStrings.enterCompanyName,
                      validator: (value) => Validators.required(
                          value,
                          "${AppStrings.companyName} ${AppStrings.isRequired}"
                      ),
                    ),

                    20.height,

                    CommonCaptcha(
                      key: controller.captchaKey.value,
                      controller: controller.captchaController.value,
                      onCaptchaChanged:(captcha) {

                        controller.captchaValue.value = captcha.toString().trim();

                        },
                    ),

                    28.height,

                    CommonButton(
                        height: 55,
                        text: AppStrings.registerAsCorporatePartner,
                        textStyle: AppTextStyle.white14SemiBold,
                        onTap: () => controller.submitCorporate()
                    ),

                    10.height,

                  ],
                ),
              ),
            ),

            /// ================= BENEFITS =================
             _BenefitCard(
              icon: Icons.shield_outlined,
              iconColor: Colors.blue,
              title: AppStrings.gstBenefit,
              description: AppStrings.claim100InputCreditOnEveryBooking,
            ),

            _BenefitCard(
              icon: Icons.bolt_outlined,
              iconColor: Colors.amber,
              title: AppStrings.fastBooking,
              description: AppStrings.reserveRoomsInUnder30Seconds,
            ),

            _BenefitCard(
              icon: Icons.public,
              iconColor: Colors.green,
              title: AppStrings.panIndia,
              description: AppStrings.availableIn50MajorBusinessCities,
            ),

            _BenefitCard(
              icon: Icons.support_agent,
              iconColor: Colors.purple,
              title: AppStrings.support,
              description: AppStrings.dedicatedCorporateRelationshipTeam,
            ),

            /// ================= CONTACT =================
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.lightBg,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: const Color(
                    0xffD7E3FF,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [

                  Text(
                    AppStrings.preferToTalk,
                    style: AppTextStyle.primary18SemiBold,
                  ),

                  10.height,

                  Text(
                    AppStrings.ourCorporateSalesExpertsCanHelp,
                    style: AppTextStyle.primary12Regular.copyWith(color: AppColors.blue),
                  ),

                  26.height,

                  /// CALL CARD
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(
                      16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        16,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.2),
                          blurRadius: 10,
                          offset: const Offset(0, 4,),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: const Color(0xff24108D,),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.call_outlined,
                            color: Colors.white,
                          ),
                        ),

                        16.width,

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text(
                                AppStrings.callUsDirectly.toUpperCase(),
                                style: AppTextStyle.primary12Medium.copyWith(
                                  color: AppColors.blue1
                                ),
                              ),

                             4.height,

                              Text(
                                "${AppUrls.phoneNumber}",
                                style: AppTextStyle.black16Bold,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            20.height,


          ],
        ),
      ),
    );
  }
}

/// ================= TOP FEATURE =================

class _TopFeature extends StatelessWidget {

  final IconData icon;
  final Color iconColor;
  final String title;

  const _TopFeature({
    required this.icon,
    required this.iconColor,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: iconColor.withOpacity(.1),
            shape: BoxShape.circle,
          ),

          child: Icon(
            icon,
            color: iconColor,
          ),

        ),

        14.height,

        Text(
          title.toUpperCase(),
          textAlign: TextAlign.center,
          style: AppTextStyle.greyDark12Medium,
        ),

      ],
    );
  }
}

/// ================= BENEFIT CARD =================

class _BenefitCard extends StatelessWidget {

  final IconData icon;
  final Color iconColor;

  final String title;
  final String description;

  const _BenefitCard({
    required this.icon,
    required this.iconColor,

    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.2,),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          Icon(
            icon,
            size: 35,
            color: iconColor,
          ),

          24.height,

          Text(
            title,
            style: AppTextStyle.black16Bold,
          ),

          5.height,

          Text(
            description,
            style: AppTextStyle.greyDark11SemiBold,
          ),

        ],
      ),
    );
  }
}