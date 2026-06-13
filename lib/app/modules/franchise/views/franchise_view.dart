import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:soonstays/core/constants/app_urls.dart';
import 'package:soonstays/core/widgets/blinkit_dot.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/textfield_validation.dart';
import '../../../../core/widgets/common_appbar.dart';
import '../../../../core/widgets/common_buttons.dart';
import '../../../../core/widgets/common_captcha.dart';
import '../../../../core/widgets/common_footer.dart';
import '../../../../core/widgets/common_text_field.dart';
import '../../../../core/widgets/drawer.dart';
import '../controllers/franchise_controller.dart';

class FranchiseView extends GetView<FranchiseController> {
  const FranchiseView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CommonAppBar(title: "${AppStrings.franchise}"),
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
                    left: 16,
                    right: 16,
                    top: 60,
                    bottom: 120,
                  ),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        AppAssets.franchiseBg,
                      ),
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
                          AppStrings.franchisePartner.toUpperCase(),
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
                              text: "${AppStrings.growYourHotelWit} ",
                              style: TextStyle(
                                color: AppColors.primary,
                              ),
                            ),

                            TextSpan(
                              text: AppStrings.soonStays,
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
                        AppStrings.scaleYourPropertyWithIndia,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.primary12Regular,
                      ),
                    ],
                  ),
                ),

                /// STATS CARD
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: -70,
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
                          icon: Icons.trending_up,
                          iconColor: AppColors.blue1,
                          title: "35% ${AppStrings.revparJump}",
                        ),

                        _TopFeature(
                          icon: Icons.electric_bolt_outlined,
                          iconColor: Colors.green,
                          title: AppStrings.techManaged,
                        ),

                        _TopFeature(
                          icon: Icons.group_outlined,
                          iconColor: Colors.deepOrange,
                          title: "50+ ${AppStrings.cities}",
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),

            100.height,

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
                      AppStrings.franchiseApplication,
                      style: AppTextStyle.primary20ExtraBold,
                    ),

                    5.height,

                    Text(
                      AppStrings.partnerWithIndiasSmartest,
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
                        FilteringTextInputFormatter.digitsOnly
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
                        controller.emailController.value.text
                      ),
                    ),

                    20.height,

                    Text(
                      AppStrings.hotelName.toUpperCase(),
                      style: AppTextStyle.greay14Medium,
                    ),

                    5.height,

                    ///Hotel Name TextField
                    CustomInputFieldBorder(
                      borderColor: AppColors.black,
                      controller: controller.hotelNameController.value,
                      hintText: AppStrings.enterHotelName,
                      validator: (value) => Validators.required(
                          value,
                          "${AppStrings.hotelName} ${AppStrings.isRequired}"
                      ),
                    ),

                    20.height,

                    Text(
                      AppStrings.hotelCity.toUpperCase(),
                      style: AppTextStyle.greay14Medium,
                    ),

                    5.height,

                    ///Hotel City TextField
                    CustomInputFieldBorder(
                      borderColor: AppColors.black,
                      controller: controller.hotelCityController.value,
                      hintText: AppStrings.enterHotelCity,
                      validator: (value) => Validators.required(
                          value,
                          "${AppStrings.hotelCity} ${AppStrings.isRequired}"
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
                        text: AppStrings.applyForPartnership,
                        textStyle: AppTextStyle.white14SemiBold,
                        onTap: () => controller.submitFranchise()
                    ),

                    10.height,

                  ],
                ),
              ),
            ),

            /// ================= BENEFITS =================
            _BenefitCard(
              icon: Icons.bar_chart_outlined,
              iconColor: Colors.blue,
              title: AppStrings.yieldMFMT,
              description: AppStrings.dynamicPricingToBeatLocalCompetition,
            ),

            _BenefitCard(
              icon: Icons.public,
              iconColor: Colors.amber,
              title: AppStrings.otaDistribution,
              description: AppStrings.rankHigherOnMMT,
            ),

            _BenefitCard(
              icon: Icons.shield_outlined,
              iconColor: Colors.green,
              title: AppStrings.auditAndSops,
              description: AppStrings.rigorousQualityCheckForGuestTrust,
            ),

            _BenefitCard(
              icon: Icons.headset_outlined,
              iconColor: Colors.purple,
              title: AppStrings.ownerSupport,
              description: AppStrings.dedicatedPartnerRelationshipDesk,
            ),

            /// ================= CONTACT =================
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 15,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// TOP ROW
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      /// LEFT SECTION
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Row(
                              children: [

                                BlinkingDot(),

                                8.width,

                                Text(
                                  AppStrings.growthDeskOnline.toUpperCase(),
                                  style: AppTextStyle.greay12SemiBold.copyWith(
                                    letterSpacing: 2,
                                  ),
                                ),
                              ],
                            ),

                            16.height,

                            Text(
                              AppStrings.speakToOurFranchiseExpert,
                              style: AppTextStyle.black20ExtraBold,
                            ),
                          ],
                        ),
                      ),

                      16.width,

                      /// ICON BOX
                      Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          color: const Color(0xffEEF2FF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.headset_outlined,
                          color: Color(0xff2563EB),
                          size: 28,
                        ),
                      ),
                    ],
                  ),

                  25.height,

                  /// DESCRIPTION
                  Text(
                    AppStrings.getAFree15MinuteConsultation,
                    style: AppTextStyle.greyDark12Medium,
                  ),

                  25.height,

                  /// BUTTON
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xff2E1192),
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary2.withOpacity(0.3),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [

                        /// CALL ICON
                        Container(
                          width: 50,
                          height: 50,
                          margin: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.call,
                            color: AppColors.primary2,
                            size: 24,
                          ),
                        ),

                        const Spacer(),

                        Text(
                          AppUrls.phoneNumber,
                          style: AppTextStyle.white14Bold,
                        ),

                        const Spacer(),

                        Icon(
                          Icons.arrow_outward,
                          color: Colors.white38,
                          size: 20,
                        ),

                        20.width,

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
          style: AppTextStyle.greyDark11SemiBold,
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

          10.height,

          Text(
            title,
            style: AppTextStyle.black16Bold,
          ),

          5.height,

          Text(
            description,
            style: AppTextStyle.greyDark12Light,
          ),
        ],
      ),
    );
  }
}