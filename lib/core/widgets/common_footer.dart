import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonstays/core/constants/app_strings.dart';
import 'package:soonstays/core/constants/app_text_styles.dart';
import 'package:soonstays/core/utils/common_launcher.dart';

import '../../app/routes/app_pages.dart';
import '../constants/app_assets.dart';
import '../constants/app_urls.dart';

///Common Footer Section
class CommonFooterSection extends StatelessWidget {
  const CommonFooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 24,
      ),

      decoration: BoxDecoration(
        color: Color(0xFFf9fafb),

      ),

      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          /// ================= TOP ROW =================
          Row(
            children: [

              /// LOGO
              Image.asset(
                AppAssets.logo,
                height: 40,
              ),

              const Spacer(),

              /// SOCIALS
              _socialButton(AppAssets.facebook,AppUrls.facebook),

              const SizedBox(width: 12),

              _socialButton(AppAssets.linkedin,AppUrls.linkedin),

              const SizedBox(width: 12),

              _socialButton(AppAssets.insta,AppUrls.instagram),

              const SizedBox(width: 12),

              _socialButton(AppAssets.youTube,AppUrls.youtube),

            ],
          ),

          const SizedBox(height: 20),

          /// ================= PAGES =================
          _sectionTitle(AppStrings.pages),

          const SizedBox(height: 15),

          Row(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    _footerText(AppStrings.aboutUs,onTap: () => Get.toNamed(Routes.ABOUT_US),),

                    const SizedBox(height: 12),

                    _footerText(AppStrings.blog,onTap: () => CommonLauncher.openUrl(AppUrls.blogUrl)),

                  ],
                ),
              ),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [

                    _footerText(AppStrings.careers,onTap: () => CommonLauncher.openUrl(AppUrls.linkedin)),

                    const SizedBox(height: 12),

                    _footerText(AppStrings.investor,onTap: () => Get.toNamed(Routes.INVESTOR),),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Divider(
            color: Colors.grey.shade300,
            thickness: 1,
          ),

          const SizedBox(height: 20),

          /// ================= QUICK LINK =================
          _sectionTitle(AppStrings.quickLink),

          const SizedBox(height: 15),

          Row(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    _footerText(
                      AppStrings.beOurFranchise,
                      onTap: () {},
                    ),

                    const SizedBox(height: 12),

                    _footerText(
                      AppStrings.contactUs,
                      onTap: () {},
                    ),

                  ],
                ),
              ),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    _footerText(
                      AppStrings.travelAgent,
                      onTap: () {},
                    ),

                    const SizedBox(height: 12),

                    _footerText(
                      AppStrings.faq,
                      onTap: () {},
                    ),

                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Divider(
            color: Colors.grey.shade300,
            thickness: 1,
          ),

          const SizedBox(height: 20),

          /// ================= POLICIES =================
          _sectionTitle(AppStrings.policies),

          const SizedBox(height: 15),

          Row(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    _footerText(
                      AppStrings.termsAndConditions,
                      onTap: () => Get.toNamed(Routes.TERMS_CONDITIONS),
                    ),

                    const SizedBox(height: 12),

                    _footerText(
                      AppStrings.cancellationPolicy,
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    _footerText(
                      AppStrings.privacyPolicy,
                      onTap: () {},
                    ),

                    const SizedBox(height: 12),

                    _footerText(
                      AppStrings.legalAndPrivacy,
                      onTap: () {},
                    ),

                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 22),

          Divider(
            color: Colors.grey.shade300,
            thickness: 1,
          ),

          const SizedBox(height: 20),

          /// ================= COPYRIGHT =================
          Center(
            child: Text(
              AppStrings.copyright2026AllRightsReservedBy,
              textAlign: TextAlign.center,
              style: AppTextStyle.greay12Medium,
            ),
          ),
        ],
      ),
    );
  }

  /// ================= TITLE =================
  Widget _sectionTitle(String text) {
    return Text(
      text,
      style: AppTextStyle.black15SemiBold,
    );
  }

  /// ================= TEXT =================
  Widget _footerText(String text,{required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: AppTextStyle.greay14Regular,
      ),
    );
  }

  /// ================= SOCIAL BUTTON =================
  Widget _socialButton(String icon,String url) {
    return InkWell(
      onTap: () async => await CommonLauncher.openUrl(url),
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: const Color(0xffEEF0F4),
          shape: BoxShape.circle,
        ),
        child: Center(child: Image.asset(icon,height: 15,width: 15,fit: BoxFit.contain,)),
      ),
    );
  }
}