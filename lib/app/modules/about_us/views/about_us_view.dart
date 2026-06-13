import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonstays/core/constants/app_colors.dart';
import 'package:soonstays/core/constants/app_size.dart';
import 'package:soonstays/core/constants/app_strings.dart';
import 'package:soonstays/core/constants/app_text_styles.dart';
import 'package:soonstays/core/constants/app_urls.dart';
import 'package:soonstays/core/widgets/common_footer.dart';
import 'package:soonstays/core/widgets/drawer.dart';
import '../../../../core/utils/common_launcher.dart';
import '../../../../core/widgets/common_appbar.dart';
import '../controllers/about_us_controller.dart';

class AboutUsView extends GetView<AboutUsController> {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CommonAppBar(title: "${AppStrings.aboutUs}"),
      drawer: CommonDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// ================= HERO SECTION =================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              margin: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,

                  colors: [
                    AppColors.primary,
                    AppColors.primary2
                  ],
                ),
              ),

              child: Column(
                children: [

                  Text(
                    AppStrings.aboutSoonStays,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.white26Bold,
                  ),

                  15.height,

                  Text(
                    AppStrings.atSoonStaysTravelIsMoreThanJustMoving,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.white12Light
                  ),
                ],
              ),
            ),

            /// ================= BODY =================
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 16
              ),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  /// ================= WHO WE ARE =================
                  Text(
                    AppStrings.whoWeAre,
                    style: AppTextStyle.black20Bold,
                  ),

                  const SizedBox(height: 10),

                  _paragraph(
                    AppStrings.theIdeaBehindSoonStaysWasBornFrom,
                  ),

                  const SizedBox(height: 24),

                  _paragraph(
                    AppStrings.inspiredByTheSpiritOfModernIndian,
                  ),

                  const SizedBox(height: 36),

                  /// ================= STATS =================
                  GridView.count(
                    shrinkWrap: true,

                    physics:
                    const NeverScrollableScrollPhysics(),

                    crossAxisCount: 2,

                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,

                    childAspectRatio: 1.15,

                    children: const [

                      _StatCard(
                        value: "500+",
                        title: AppStrings.verifiedHotels,
                      ),

                      _StatCard(
                        value: "100+",
                        title: AppStrings.citiesCovered,
                      ),

                      _StatCard(
                        value: "10K+",
                        title: AppStrings.happyCustomers,
                      ),

                      _StatCard(
                        value: "24/7",
                        title: AppStrings.customerSupport,
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  /// ================= PART OF JOURNEY =================
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: AppColors.lightBg,
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),

                    child: Column(
                      children: [

                        Text(
                          AppStrings.partOfYourJourney,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.black20Bold,
                        ),

                        const SizedBox(height: 28),

                        Text(
                          AppStrings.travelHasAlwaysBroughtPeopleTogether,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.greyDark13Light.copyWith(height: 2),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 44),

                  /// ================= COMMITMENT =================
                  Center(
                    child: Column(
                      children: [

                        Text(
                          AppStrings.ourCommitment,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.black20Bold,
                        ),

                        const SizedBox(height: 14),

                        Text(
                          AppStrings.asWeContinueToGrowAcrossNewDestination,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.greyDark14Light.copyWith(height: 1.5),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// ================= COMMITMENT CARDS =================
                  const _CommitmentCard(
                    title: AppStrings.affordableStays,
                    description: AppStrings.makeStaysAffordableWithoutCompromising,
                  ),

                  const SizedBox(height: 20),

                  const _CommitmentCard(
                    title: AppStrings.trustedRelationships,
                    description: AppStrings.buildGenuineRelationshipsWith,
                  ),

                  const SizedBox(height: 20),

                  const _CommitmentCard(
                    title: AppStrings.reliablePlatform,
                    description: AppStrings.createAPlatformThatTravelsCanRely,
                  ),

                  const SizedBox(height: 40),

                  /// ================= CONTACT CARD =================
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 35
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.topLeft,
                        colors: [
                          AppColors.primary,
                          AppColors.primary2
                        ],
                      ),
                    ),

                    child: Column(
                      children: [

                        Text(
                          AppStrings.letsStayConnected,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.white22Bold,
                        ),

                        const SizedBox(height: 20),

                        Text(
                          AppStrings.yourJourneyInspiresUs,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.white12Light.copyWith(height: 1.8),
                        ),

                        const SizedBox(height: 20),

                        _contactRow(
                          Icons.phone_in_talk_rounded,
                          AppUrls.phoneNumber,
                          AppColors.white,
                              () => CommonLauncher.makeCall(AppUrls.phoneNumber),
                        ),

                        const SizedBox(height: 22),

                        _contactRow(
                          Icons.email_outlined,
                          AppUrls.supportEmail,
                          Colors.white,
                                () => CommonLauncher.sendEmail(email: AppUrls.supportEmail)
                        ),

                        const SizedBox(height: 22),

                        _contactRow(
                          Icons.language,
                          AppUrls.website,
                          Colors.white,
                                () => CommonLauncher.openUrl(AppUrls.website)
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),

            10.height,

          ],
        ),
      ),
    );
  }

  /// ================= PARAGRAPH =================
  Widget _paragraph(String text) {
    return Text(
      text,
      style: AppTextStyle.greyDark13Light.copyWith(height: 2.2),
    );
  }

  /// ================= CONTACT ROW =================
  Widget _contactRow(
      IconData icon,
      String text,
      Color color,
      Function() onTap
      ) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.center,
        children: [

          Icon(
            icon,
            size: 24,
            color: color,
          ),

          const SizedBox(width: 16),

          Text(
            text,
            style: AppTextStyle.white13Regular,
          ),
        ],
      ),
    );
  }
}

/// ================= STAT CARD =================

class _StatCard extends StatelessWidget {
  final String value;
  final String title;

  const _StatCard({
    required this.value,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightBg,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: Column(
        mainAxisAlignment:
        MainAxisAlignment.center,

        children: [

          Text(
            value,
            style: AppTextStyle.primary28SemiBold,
          ),


          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyle.greyDark13Light,
          ),
        ],
      ),
    );
  }
}

/// ================= COMMITMENT CARD =================

class _CommitmentCard extends StatelessWidget {
  final String title;
  final String description;

  const _CommitmentCard({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 34,
      ),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        children: [

          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyle.primary14Medium,
          ),

          const SizedBox(height: 18),

          Text(
            description,
            textAlign: TextAlign.center,
            style: AppTextStyle.greyDark12Light.copyWith(height: 2),
          ),
        ],
      ),
    );
  }
}
