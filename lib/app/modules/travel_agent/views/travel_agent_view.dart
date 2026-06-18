import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/constants/app_urls.dart';
import '../../../../core/utils/textfield_validation.dart';
import '../../../../core/widgets/blinkit_dot.dart';
import '../../../../core/widgets/common_appbar.dart';
import '../../../../core/widgets/common_buttons.dart';
import '../../../../core/widgets/common_captcha.dart';
import '../../../../core/widgets/common_footer.dart';
import '../../../../core/widgets/common_text_field.dart';
import '../../../../core/widgets/drawer.dart';
import '../controllers/travel_agent_controller.dart';

///Travel Agent View
class TravelAgentView extends GetView<TravelAgentController> {
  const TravelAgentView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CommonAppBar(
          title: AppStrings.travelAgent,
          isActionTrue: true
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                        AppAssets.travelAgentBg,
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
                          AppStrings.partnerProgram2026.toUpperCase(),
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
                      horizontal: 10,
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
                          icon: Icons.public,
                          iconColor: Colors.green,
                          title: "50+${AppStrings.cities}",
                        ),

                        _TopFeature(
                          icon: Icons.group_outlined,
                          iconColor: Colors.deepOrange,
                          title: "4.2★${AppStrings.guestRating}",
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
              margin: const EdgeInsets.all(16),
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
                      AppStrings.travelAgentRegistration,
                      style: AppTextStyle.primary20ExtraBold,
                    ),

                    5.height,

                    Text(
                      AppStrings.lockWholesaleRatesAndInstantCommissions,
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
                          controller.emailController.value.text.toString()
                      ),
                    ),

                    20.height,

                    Text(
                      AppStrings.travelAgentName.toUpperCase(),
                      style: AppTextStyle.greay14Medium,
                    ),

                    5.height,

                    ///Travel Agent Name TextField
                    CustomInputFieldBorder(
                      borderColor: AppColors.black,
                      controller: controller.travelAgentNameController.value,
                      hintText: AppStrings.enterTravelAgentName,
                      validator: (value) => Validators.required(
                          value,
                          "${AppStrings.travelAgentName} ${AppStrings.isRequired}"
                      ),
                    ),

                    20.height,

                    Text(
                      AppStrings.travelAgentCity.toUpperCase(),
                      style: AppTextStyle.greay14Medium,
                    ),

                    5.height,

                    ///Travel Agent TextField
                    CustomInputFieldBorder(
                      borderColor: AppColors.black,
                      controller: controller.travelAgentCityController.value,
                      hintText: AppStrings.enterTravelAgentCity,
                      validator: (value) => Validators.required(
                          value,
                          "${AppStrings.travelAgentCity} ${AppStrings.isRequired}"
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
                        onTap: () => controller.submitTravelAgent()
                    ),

                    10.height,

                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 16
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    AppStrings.theAdvantage,
                    style: AppTextStyle.black26ExtraBold,
                    textAlign: TextAlign.start,
                  ),

                  5.height,

                  Text(
                    AppStrings.why200OwnersTrustOurEcosystem,
                    style: AppTextStyle.greay14Medium,
                  )
                  
                ],
              ),
            ),



            /// ================= BENEFITS =================
            _BenefitCard(
              icon: Icons.percent_outlined,
              iconColor: Colors.blue,
              title: AppStrings.wholeSaleMargins,
              description: AppStrings.accessExclusiveB2B,
            ),

            _BenefitCard(
              icon: Icons.bolt_outlined,
              iconColor: AppColors.green,
              title: AppStrings.realTimeInventory,
              description: AppStrings.zeroCheckInDenialsWith,
            ),

            _BenefitCard(
              icon: Icons.shield_outlined,
              iconColor: AppColors.secondary,
              title: AppStrings.gstReadyBilling,
              description: AppStrings.claim100InputCreditOnEveryBooking,
            ),

            _BenefitCard(
              icon: Icons.headset_outlined,
              iconColor: Colors.purple,
              title: AppStrings.priorityAgentDesk,
              description: AppStrings.dedicatedSupportForBulk,
            ),

            /// ================= CONTACT =================
            Container(
              margin: const EdgeInsets.all(16),
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
                              AppStrings.speakToAnExpert,
                              style: AppTextStyle.black20ExtraBold,
                            ),
                          ],
                        ),
                      ),
                    ],
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

                        10.width,

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
        horizontal: 16,
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