import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonstays/core/constants/app_assets.dart';
import 'package:soonstays/core/constants/app_colors.dart';
import 'package:soonstays/core/constants/app_size.dart';
import 'package:soonstays/core/constants/app_text_styles.dart';
import 'package:soonstays/core/get_storage/session_manager.dart';

import '../../app/routes/app_pages.dart';
import '../constants/app_strings.dart';
import '../constants/app_urls.dart';
import '../utils/common_launcher.dart';

class CommonDrawer extends StatelessWidget {
  const CommonDrawer({super.key});

  @override
  Widget build(BuildContext context) {

    final isLogin = SessionManager.instance.isLoggedIn;

    final userName = isLogin?SessionManager.instance.user['fullName']:AppStrings.guest;

    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.only(
          bottomRight: Radius.circular(0),
          topRight: Radius.circular(32)
        )
      ),
      width: Get.width*.65,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
          ),
        ),

        child: Column(
          children: [

            /// TOP HEADER
            Container(
              padding: EdgeInsets.only(
                top: 40,
                left: 10,
                right: 10
              ),
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.primary,
                    AppColors.primary2,
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                ),
              ),

              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [

                      Container(
                        height: 40,
                        width: 40,

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white
                              .withOpacity(.15),
                        ),

                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),

                      10.width,

                      Text(
                        "${AppStrings.hello}, ",
                        style: AppTextStyle.white14Regular,
                      ),

                      Text(
                        "${userName??AppStrings.na}",
                        style: AppTextStyle.white16SemiBold,
                      ),

                    ],
                  ),

                  10.height,

                  isLogin?
                  SizedBox():
                  InkWell(
                    onTap: () => Get.toNamed(Routes.LOGIN),
                    child: Text(
                      AppStrings.loginSignUp,
                      style: TextStyle(
                        color: Colors.orange.shade300,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  10.height,

                ],
              ),
            ),

            /// MENU LIST
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 15,
                ),
                children: [

                  drawerItem(
                    icon: Icons.home_rounded,
                    title: AppStrings.home,
                    onTap: () => Get.back(),
                  ),

                  drawerItem(
                    icon: Icons.luggage_outlined,
                    title: AppStrings.myTrips,
                    onTap: () {

                      Get.back();

                      isLogin?
                      Get.toNamed(Routes.MY_TRIPS):
                      Get.toNamed(Routes.LOGIN);

                    },
                  ),

                  drawerItem(
                    icon: Icons.person_outline,
                    title: AppStrings.profile,
                    onTap: () {

                      Get.back();

                      isLogin?
                      Get.toNamed(Routes.USER_PROFILE):
                      Get.toNamed(Routes.LOGIN);

                    },
                  ),

                  Divider(
                    thickness: 0.5,
                  ),

                  5.height,

                  Text(
                    AppStrings.quickLink,
                    style: AppTextStyle.black15SemiBold,
                  ),

                  5.height,

                  drawerItem(
                    icon: Icons.business,
                    title: AppStrings.corporatePartner,
                    onTap: () {

                      Get.back();

                      Get.toNamed(Routes.CORPORATE);

                    },
                  ),

                  drawerItem(
                    icon: Icons.storefront_outlined,
                    title: AppStrings.beOurFranchise,
                    onTap: () {

                      Get.back();

                      Get.toNamed(Routes.FRANCHISE);

                    },
                  ),

                  drawerItem(
                    icon: Icons.flight_takeoff_outlined,
                    title: AppStrings.travelAgent,
                    onTap: () {

                      Get.back();

                      Get.toNamed(Routes.TRAVEL_AGENT);

                    },
                  ),

                  drawerItem(
                    icon: Icons.call_outlined,
                    title: AppStrings.contactUs,
                    onTap: () {

                      Get.back();

                      Get.toNamed(Routes.CONTACT_US);

                    },
                  ),

                  drawerItem(
                    icon: Icons.quiz_outlined,
                    title: AppStrings.faq,
                    onTap: () {

                      Get.back();

                      Get.toNamed(Routes.FAQ);

                    },
                  ),

                  Divider(
                    thickness: 0.5,
                  ),

                  5.height,

                  Text(
                    AppStrings.pages,
                    style: AppTextStyle.black15SemiBold,
                  ),

                  5.height,

                  drawerItem(
                      icon: Icons.info_outline,
                      title: AppStrings.aboutUs,
                      onTap: () {

                        Get.back();

                        Get.toNamed(Routes.ABOUT_US);

                      }
                  ),

                  drawerItem(
                    icon: Icons.work_outline,
                    title: AppStrings.careers,
                    onTap: () {

                      Get.back();

                      CommonLauncher.openUrl(AppUrls.linkedin);

                    },
                  ),


                  drawerItem(
                    icon: Icons.article_outlined,
                    title: AppStrings.blog,
                    onTap: () {

                      Get.back();

                      CommonLauncher.openUrl(AppUrls.blogUrl);

                    },
                  ),

                  drawerItem(
                    icon: Icons.trending_up,
                    title: AppStrings.investor,
                    onTap: () {

                      Get.back();

                      Get.toNamed(Routes.INVESTOR);

                    },
                  ),

                  Divider(
                    thickness: 0.5,
                  ),

                  5.height,

                  Text(
                    AppStrings.policies,
                    style: AppTextStyle.black15SemiBold,
                  ),

                  5.height,

                  drawerItem(
                    icon: Icons.description_outlined,
                    title: AppStrings.termsAndConditions,
                    onTap: () {

                      Get.back();

                      Get.toNamed(Routes.TERMS_CONDITIONS);

                    },
                  ),

                  drawerItem(
                    icon: Icons.privacy_tip_outlined,
                    title: AppStrings.privacyPolicy,
                    onTap: () {

                      Get.back();

                      Get.toNamed(Routes.PRIVACY_POLICY);

                    },
                  ),

                  drawerItem(
                    icon: Icons.cancel_outlined,
                    title: AppStrings.cancellationPolicy,
                    onTap: () {

                      Get.back();

                      Get.toNamed(Routes.CANCELLATION_POLICY);

                    },
                  ),

                  drawerItem(
                    icon: Icons.shield_outlined,
                    title: AppStrings.legalAndPrivacy,
                    onTap: () {

                      Get.back();

                      Get.toNamed(Routes.LEGAL_POLICY);

                    },
                  ),

                  Divider(
                    thickness: 0.5,
                  ),

                  5.height,

                  Text(
                    AppStrings.needHelp.toUpperCase(),
                    style: AppTextStyle.black15SemiBold,
                  ),

                  10.height,

                  needHelpCard(
                    imgPath: AppAssets.phoneCall,
                    title: AppStrings.callUs,
                    desc: AppUrls.phoneNumber,
                    onTap: () => CommonLauncher.makeCall(AppUrls.phoneNumber),
                  ),

                  10.height,

                  needHelpCard(
                      imgPath: AppAssets.whatsapp,
                      title: AppStrings.whatsApp,
                      desc: AppStrings.chatWithUs,
                    onTap: () => CommonLauncher.openWhatsApp(phone: AppUrls.phoneNumber,message: "Hello Check"),
                  ),

                  10.height,

                  needHelpCard(
                      imgPath: AppAssets.mail,
                      title: AppStrings.emailUs,
                      desc: "support@soonstays.com",
                    onTap: () => CommonLauncher.sendEmail(email: "support@soonstays.com"),
                  ),

                  const SizedBox(height: 25),

                  /// SOCIAL
                  Center(
                    child: Text(
                      AppStrings.followUs,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: [

                      socialIcon(
                        img: AppAssets.facebook,
                        url: AppUrls.facebook
                      ),

                      const SizedBox(width: 12),

                      socialIcon(
                          img: AppAssets.insta,
                          url: AppUrls.instagram
                      ),

                      const SizedBox(width: 12),

                      socialIcon(
                          img: AppAssets.youTube,
                          url: AppUrls.youtube
                      ),

                      const SizedBox(width: 12),

                      socialIcon(
                          img: AppAssets.linkedin,
                          url: AppUrls.linkedin
                      ),
                    ],
                  ),


                  const SizedBox(height: 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget drawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isSelected = false,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 6,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 13,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.lightBg
              : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [

            Icon(
              icon,
              color: isSelected
                  ? AppColors.primary
                  : AppColors.primary,
              size: 18,
            ),

            const SizedBox(width: 15),

            Text(
              title,
              style: isSelected
                  ?AppTextStyle.primary14Regular
                  :AppTextStyle.primary14Regular
            )

          ],
        ),
      ),
    );
  }

  Widget socialIcon(
  {
  required String img,
  required String url,
  }) {

    return InkWell(
      onTap: () async => await CommonLauncher.openUrl(url),
      child: Container(
        height: 42,
        width: 42,
        padding: EdgeInsets.all(
          10
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xffF5F5F5),
        ),
        child: Image.asset(img),
      ),
    );
  }

  Widget needHelpCard({
    required String imgPath,
    required String title,
    required String desc,
    required VoidCallback onTap,
}){
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10,
          ),
          border: BoxBorder.all(
            color: AppColors.greyLight,
            width: 0.5
          ),
        ),
        child: Row(
          children: [

            Image.asset(
              imgPath,
              height: 22,
            ),

            10.width,

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: AppTextStyle.primary12Medium,
                ),

                2.height,

                Text(
                  desc,
                  style: AppTextStyle.greay10Regular,
                ),

              ],
            )

          ],
        ),
      ),
    );
  }

}