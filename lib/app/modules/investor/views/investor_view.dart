import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonstays/core/constants/app_colors.dart';
import 'package:soonstays/core/constants/app_size.dart';
import 'package:soonstays/core/constants/app_strings.dart';
import 'package:soonstays/core/constants/app_text_styles.dart';
import 'package:soonstays/core/widgets/common_appbar.dart';
import 'package:soonstays/core/widgets/common_buttons.dart';
import 'package:soonstays/core/widgets/common_captcha.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/utils/textfield_validation.dart';
import '../../../../core/widgets/common_footer.dart';
import '../../../../core/widgets/common_text_field.dart';
import '../../../../core/widgets/drawer.dart';
import '../controllers/investor_controller.dart';

class InvestorView extends GetView<InvestorController> {
  const InvestorView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CommonAppBar(
          title: "${AppStrings.investor}",
          isActionTrue: true
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [


            /// ================= HERO =================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 30,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: AlignmentGeometry.centerEnd,
                  colors: [
                    AppColors.lightBg,
                    AppColors.lightBg,
                    AppColors.white
                  ]
                )
              ),
              child: Column(
                children: [

                  5.height,

                  /// TOP BADGE
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xff1F1696),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(.2),
                          blurRadius: 16,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        Container(
                          height: 8,
                          width: 8,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.green,
                          ),
                        ),

                        10.width,

                        Text(
                          AppStrings.investorRelations.toUpperCase(),
                          style: AppTextStyle.white12SemiBold,
                        ),

                      ],
                    ),
                  ),

                  35.height,

                  /// TITLE
                  Text(
                      AppStrings.theFutureOf,
                      style: AppTextStyle.black40ExtraBold.copyWith(height: 0.6)
                  ),

                  GradientText(
                    text: AppStrings.hospitality,
                    style: AppTextStyle.white40ExtraBold,
                  ),

                  30.height,

                  /// DESCRIPTION
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      style: AppTextStyle.greyDark16Regular.copyWith(height: 1.8),
                      children: [

                        TextSpan(
                          text: "${AppStrings.weAreTransformingTheHospitalityLandscapeThough}   ",
                        ),

                        TextSpan(
                          text: AppStrings.innovationDriven,
                          style: AppTextStyle.primary16ExtraBold.copyWith(color: AppColors.blue),
                        ),

                        TextSpan(
                          text: "   ${AppStrings.bookingSolutionsJoinIndiaSFastest}",
                        ),

                      ],
                    ),
                  ),

                  30.height,

                  Divider(
                    color: Colors.grey.shade300,
                    thickness: 0.5,
                  ),

                  16.height,

                  /// STATS
                  Row(
                    children: [

                      Expanded(
                        child: _TopStat(
                          title: AppStrings.marketValuation.toUpperCase(),
                          value: "₹250 Cr+",
                        ),
                      ),

                      Expanded(
                        child: _TopStat(
                          title:
                          AppStrings.dailyBookings.toUpperCase(),
                          value: "5,000+",
                        ),
                      ),
                    ],
                  ),

                  28.height,

                   _TopStat(
                    title: AppStrings.growthIndex.toUpperCase(),
                    value: "4.2x",
                    valueColor: AppColors.green,
                  ),

                ],
              ),
            ),

            /// ================= INVESTOR IMAGE =================
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),

              child: Stack(
                clipBehavior: Clip.none,
                children: [

                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        26,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.15),
                          blurRadius: 12,
                          offset: const Offset(4, 6),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius:
                      BorderRadius.circular(
                        24,
                      ),
                      child: Image.asset(
                        AppAssets.investor1,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: -15,
                    left: 0,
                    right: -28,
                    child: Center(
                      child: Container(
                        width: 200,
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.08),
                              blurRadius: 16,
                              offset:
                              const Offset(0, 4,),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [

                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: AppColors.green,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.trending_up,
                                color: Colors.white,
                              ),
                            ),

                            16.width,

                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [

                                  Text(
                                    AppStrings.revenueGrowth.toUpperCase(),
                                    style: AppTextStyle.greay10SemiBold.copyWith(color: AppColors.grey1),
                                  ),

                                  Text(
                                    "+28.4%",
                                    style: AppTextStyle.primary24ExtraBold,
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            50.height,

            /// ================= BENEFITS =================
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: const Color(0xff1F1696),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    AppStrings.ourBenefits,
                    style: AppTextStyle.white24ExtraBold,
                    textAlign: TextAlign.start,
                  ),

                  20.height,

                  Text(
                    AppStrings.discoverHowOurPlatformEmpowersHotel,
                    textAlign: TextAlign.justify,
                    style: AppTextStyle.greay13Regular.copyWith(color: AppColors.white2,height: 1.6),
                  ),

                  10.height,

                  _BenefitItem(
                    icon: Icons.rocket_launch,
                    iconColor: AppColors.white,
                    titleTextStyle: AppTextStyle.white16Medium,
                    descriptionTextStyle: AppTextStyle.white12Light.copyWith(color: AppColors.white2,height: 1.8),
                    iconBg: AppColors.secondary,
                    title: AppStrings.fastGrowth,
                    description: AppStrings.rapidMarketExpansionPowereBY,
                    whiteCard: false,
                  ),

                  10.height,

                  _BenefitItem(
                    icon: Icons.thumb_up,
                    iconColor: AppColors.yellow,
                    titleTextStyle: AppTextStyle.primary16SemiBold.copyWith(color: AppColors.primary2),
                    descriptionTextStyle: AppTextStyle.greyDark12Regular.copyWith(height: 1.8),
                    iconBg: AppColors.blue,
                    title: AppStrings.trustedQuality,
                    description: AppStrings.reliableHospitalityPartnership,
                    whiteCard: true,
                  ),

                  10.height,

                   _BenefitItem(
                    icon: Icons.lightbulb,
                    titleTextStyle: AppTextStyle.white16Medium,
                    descriptionTextStyle: AppTextStyle.white12Light.copyWith(color: AppColors.white2,height: 1.8),
                    iconColor: AppColors.yellow,
                    iconBg: AppColors.secondary,
                    title: AppStrings.smartSolutions,
                    description: AppStrings.dataDrivenInsightsThatMaximize,
                    whiteCard: false,
                  ),

                ],
              ),
            ),

            20.height,

            /// ================= SCALEABLE =================
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [

                  Text(
                    "${AppStrings.scalableImpact}\n",
                    style: AppTextStyle.black30ExtraBold.copyWith(height: 0.25),
                  ),

                  GradientText(
                    text: AppStrings.ventureFocused,
                    style: AppTextStyle.black30ExtraBold,
                  ),


                  20.height,

                  const _FeatureCard(
                    bg: Color(0xffEEF4FF),
                    border: Color(0xffC7DAFF),
                    icon: Icons.bar_chart,
                    iconColor:Colors.blue,
                    title:AppStrings.revenueFirst,
                    description:AppStrings.optimizedRevParThroughProprietary,
                  ),

                  20.height,

                  const _FeatureCard(
                    bg: Color(0xffEEFDF4),
                    border: Color(0xffB8F0C7),
                    icon: Icons.trending_up,
                    iconColor: Colors.green,
                    title: AppStrings.marketEdge,
                    description: AppStrings.topTierOTARankingsEnsuring,
                  ),

                  20.height,

                  const _FeatureCard(
                    bg: Color(0xffFFF1F2),
                    border: Color(0xffFFD1D5),
                    icon: Icons.pie_chart,
                    iconColor: Colors.red,
                    title: AppStrings.smartAnalytics,
                    description: AppStrings.realTimeInvestorDashboardsWithTransport,
                  ),

                  20.height,

                  const _FeatureCard(
                    bg: Color(0xffECFEFF),
                    border: Color(0xffA5F3FC),
                    icon: Icons.shield_outlined,
                    iconColor: Colors.cyan,
                    title: AppStrings.growthSafety,
                    description: AppStrings.strongMarketPositioningWith,
                  ),

                ],
              ),
            ),

            30.height,

            /// ================= MAN IMAGE =================
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Image.asset(
                AppAssets.investor2,
              ),
            ),

            34.height,

            /// ================= STRATEGIC =================
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [

                  Text(
                    AppStrings.strategicAlignment.toUpperCase(),
                    style: AppTextStyle.primary12Bold.copyWith(
                        letterSpacing: 4,
                        color: AppColors.blue1
                    ),
                  ),

                  10.height,

                  RichText(
                    text: TextSpan(
                      style: AppTextStyle.black30Bold,
                      children: [

                        TextSpan(
                          text: "${AppStrings.scaleWith} ",
                          style: AppTextStyle.black28ExtraBold,
                        ),

                        TextSpan(
                          text: AppStrings.soonStays,
                          style: AppTextStyle.black28ExtraBold.copyWith(color: AppColors.blue),
                        ),

                      ],
                    ),
                  ),

                  20.height,

                  const _StrategicCard(
                    bg: Color(0xffFFF7ED),
                    icon: Icons.electric_bolt_outlined,
                    iconColor: AppColors.secondary,
                    title: AppStrings.assetLight,
                    description: AppStrings.zeroCapexInfrastructureBuilt,
                  ),

                  20.height,

                  const _StrategicCard(
                    bg: Color(0xffF7F0FF),
                    icon: Icons.public,
                    iconColor: Colors.purple,
                    title: AppStrings.globalSync,
                    description: AppStrings.automatedDistributionAcross,
                  ),

                  20.height,

                  const _StrategicCard(
                    bg: AppColors.lightBg,
                    icon: Icons.shield_outlined,
                    iconColor: Colors.blue,
                    title: AppStrings.complianceAndGovernance,
                    description: AppStrings.weMaintainInstitutionalGradeFinacial,
                  ),

                ],
              ),
            ),

            20.height,

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
                    Colors.black.withOpacity(.05),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [

                  Text(
                    AppStrings.investorEnquiryDesk,
                    style: AppTextStyle.primary20ExtraBold,
                  ),

                  10.height,

                  Text(
                    AppStrings.accessOurSeriesAPitchDeck,
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
                    controller: TextEditingController(),
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
                    controller: TextEditingController(),
                    hintText: AppStrings.digitNumber,
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
                    controller: TextEditingController(),
                    hintText: AppStrings.abcCompanyCom,
                    validator: (value) => Validators.required(
                        value,
                        AppStrings.emailIsRequired
                    ),
                  ),

                  20.height,

                  CommonCaptcha(
                    controller: TextEditingController(),
                    onCaptchaChanged: (captcha) {},
                  ),

                  28.height,

                  CommonButton(
                    height: 55,
                    text: AppStrings.submitInvestmentEnquiry,
                    textStyle: AppTextStyle.white15SemiBold,
                    onTap: () {}
                  )

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

/// ================= TOP STAT =================

class _TopStat extends StatelessWidget {
  final String title;
  final String value;
  final Color? valueColor;

  const _TopStat({
    required this.title,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyle.greay10ExtraBold.copyWith(color: AppColors.grey1),
        ),

        8.height,

        Text(
          value,
          style: AppTextStyle.black20ExtraBold.copyWith(color: valueColor??AppColors.black),
        ),

      ],
    );
  }
}

/// ================= BENEFIT =================

class _BenefitItem extends StatelessWidget {

  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final String title;
  final String description;
  final TextStyle titleTextStyle;
  final TextStyle descriptionTextStyle;
  final bool whiteCard;

  const _BenefitItem({
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    required this.title,
    required this.description,
    required this.titleTextStyle,
    required this.descriptionTextStyle,
    required this.whiteCard,
  });

  @override
  Widget build(BuildContext context) {

    final isWhite = whiteCard;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: isWhite ? BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ) : null,
      child: Column(
        children: [
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: iconBg,
            ),
            child: Icon(
              icon,
              color: iconColor??Colors.white,
            ),
          ),

          24.height,

          Text(
            title,
            style: titleTextStyle,
          ),

          10.height,

          Text(
            description,
            textAlign: TextAlign.center,
            style: descriptionTextStyle,
          ),
        ],
      ),
    );
  }
}

/// ================= FEATURE CARD =================

class _FeatureCard extends StatelessWidget {

  final Color bg;
  final Color border;

  final IconData icon;
  final Color iconColor;

  final String title;
  final String description;

  const _FeatureCard({
    required this.bg,
    required this.border,

    required this.icon,
    required this.iconColor,

    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: border,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.05),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(
              icon,
              color: iconColor,
            ),
          ),

          20.height,

          Text(
            title.toUpperCase(),
            style: AppTextStyle.black14Bold.copyWith(color: iconColor)
          ),

          8.height,

          Text(
            description,
            style: AppTextStyle.greay14Regular.copyWith(height: 1.8),
          ),

          10.height

        ],
      ),
    );
  }
}

/// ================= STRATEGIC =================

class _StrategicCard extends StatelessWidget {

  final Color bg;

  final IconData icon;
  final Color iconColor;

  final String title;
  final String description;

  const _StrategicCard({
    required this.bg,

    required this.icon,
    required this.iconColor,

    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.05),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),

            child: Icon(
              icon,
              color: iconColor,
            ),
          ),

          28.height,

          Text(
            title.toUpperCase(),
            style: AppTextStyle.black14ExtraBold,
          ),

          8.height,

          Text(
            description,
            style: AppTextStyle.black12Medium.copyWith(color: AppColors.grey1),
          ),

        ],
      ),
    );
  }
}

class GradientText extends StatelessWidget {

  final String text;
  final TextStyle style;

  const GradientText({
    super.key,

    required this.text,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {

    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) {
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary2,
            AppColors.primary2,
            AppColors.blue1,
            AppColors.blue1,
          ],
        ).createShader(bounds);
      },
      child: Text(
        text,
        style: style,
      ),
    );
  }
}