import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonstays/app/modules/menu/controllers/menu_controller.dart';
import 'package:soonstays/core/constants/app_assets.dart';
import 'package:soonstays/core/constants/app_colors.dart';
import 'package:soonstays/core/constants/app_size.dart';
import 'package:soonstays/core/constants/app_strings.dart';
import 'package:soonstays/core/constants/app_text_styles.dart';
import 'package:soonstays/core/widgets/common_appbar.dart';

import '../../../../core/constants/app_urls.dart';
import '../../../../core/utils/common_launcher.dart';
import '../../../routes/app_pages.dart';

class MenuView extends GetView<MenuViewController> {
  ScrollController?scrollController;

  MenuView({
    super.key,this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: DashBoardAppBar(),
      body: ListView(
        controller: scrollController,
        physics: ScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: 15
        ),
        shrinkWrap: true,
        children: [

          20.height,

          // Container(
          //   width: double.infinity,
          //   height: 220,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(20),
          //     image: DecorationImage(image: AssetImage(AppAssets.logo2)),
          //     gradient: LinearGradient(
          //       colors: [
          //
          //         AppColors.primary,
          //         AppColors.blue
          //
          //       ]
          //     )
          //   ),
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.end,
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //
          //       Column(
          //         mainAxisAlignment: MainAxisAlignment.end,
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //
          //
          //           Container(
          //             padding: EdgeInsets.all(10),
          //             decoration: BoxDecoration(
          //                 color: Colors.white70,
          //                 borderRadius: BorderRadius.circular(15)
          //             ),
          //             child: Obx(() => Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //
          //                 Text(
          //                   controller.nameValue.value==''?AppStrings.na:controller.nameValue.value,
          //                   maxLines: 1,
          //                   style: AppTextStyle.primary20Bold,
          //                 ),
          //
          //                 Text(
          //                   AppStrings.manageYourProfileDetails,
          //                   style: AppTextStyle.primary10Medium,
          //                 )
          //
          //               ],
          //             ),),
          //           ),
          //
          //           5.height,
          //
          //           Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //
          //               Container(
          //                 padding: EdgeInsetsGeometry.symmetric(
          //                     horizontal: 10,
          //                     vertical: 10
          //                 ),
          //                 decoration: BoxDecoration(
          //                     color: Colors.white70,
          //                     borderRadius: BorderRadius.circular(10)
          //                 ),
          //                 child: Row(
          //                   crossAxisAlignment: CrossAxisAlignment.center,
          //                   children: [
          //
          //                     Icon(
          //                       Icons.phone_outlined,
          //                       color: AppColors.blue,
          //                       size: 13,
          //                     ),
          //
          //                     5.width,
          //
          //                     Obx(() =>  Text(
          //                       controller.mobileValue.value,
          //                       style: AppTextStyle.primary12Medium,
          //                     ),)
          //
          //                   ],
          //                 ),
          //               ),
          //
          //               5.height,
          //
          //               Container(
          //                 padding: EdgeInsetsGeometry.symmetric(
          //                     horizontal: 10,
          //                     vertical: 10
          //                 ),
          //                 decoration: BoxDecoration(
          //                     color: Colors.white70,
          //                     borderRadius: BorderRadius.circular(10)
          //                 ),
          //                 child: Row(
          //                   crossAxisAlignment: CrossAxisAlignment.center,
          //                   children: [
          //
          //                     Icon(
          //                       Icons.email_outlined,
          //                       color: AppColors.blue,
          //                       size: 13,
          //                     ),
          //
          //                     5.width,
          //
          //                     Obx(() => Text(
          //                       controller.emailValue.value==''?AppStrings.na:controller.emailValue.value,
          //                       style: AppTextStyle.primary12Medium,
          //                       maxLines: 1,
          //                     ),)
          //
          //                   ],
          //                 ),
          //               ),
          //
          //             ],
          //           ),
          //
          //           30.height,
          //
          //         ],
          //       ).marginSymmetric(
          //           horizontal: 10,
          //           vertical: 10
          //       )
          //
          //     ],
          //   ),
          // ),

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primary,
                  AppColors.blue,
                ],
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [


                  /// HOTEL BG IMAGE
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Opacity(
                        opacity: 0.18,
                        child: Image.asset(
                          AppAssets.homeBg1,
                          fit: BoxFit.fill,
                          width: Get.width,
                        ),
                      ),
                    ),
                  ),

                  /// CONTENT
                  Obx(() => Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        CircleAvatar(
                          radius: 34,
                          backgroundColor: Colors.white,
                          child: ClipOval(
                            child: Text(controller.nameValue.value.isEmpty?AppStrings.na:controller.getInitials(controller.nameValue.value)),
                          ),
                        ),

                        14.width,

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [

                              Row(
                                children: [

                                  Expanded(
                                    child: Text(
                                      "${controller.nameValue.value.isEmpty?AppStrings.na:controller.nameValue.value.capitalizeFirst}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextStyle.white20SemiBold,
                                    ),
                                  ),

                                ],
                              ),

                              8.height,

                              _infoRow(
                                Icons.email_outlined,
                                controller.emailValue.value.isEmpty?AppStrings.na:controller.emailValue.value,
                              ),

                              5.height,

                              _infoRow(
                                Icons.call_outlined,
                                controller.mobileValue.value.isEmpty?AppStrings.na:controller.mobileValue.value,
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),),

                  Positioned(
                    top: 10,
                    right: 10,
                    child: InkWell(
                      onTap: () => Get.toNamed(Routes.USER_PROFILE)!.then((value) => controller.fillData(),),
                      child: Icon(
                        Icons.edit_outlined,
                        color: AppColors.white,
                      ),
                    ),
                  )

                ],
              ),
            ),
          ),

          20.height,

          _sectionTitle(AppStrings.business),

          5.height,

          _card(

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                _BusinessItem(
                    icon: Icons.business,
                    title: AppStrings.corporate,
                    onTap: () => Get.toNamed(Routes.CORPORATE)
                ),

                _BusinessItem(
                    icon: Icons.storefront,
                    title: AppStrings.franchise,
                    onTap: () => Get.toNamed(Routes.FRANCHISE)
                ),

                _BusinessItem(
                    icon: Icons.flight,
                    title: AppStrings.travelAgent,
                    onTap: () => Get.toNamed(Routes.TRAVEL_AGENT)
                ),

              ],
            ),

          ),

          20.height,

          _sectionTitle(AppStrings.company),

          5.height,

          _menuCard([

            _menuTile(
              Icons.info_outline,
              AppStrings.aboutUs,
              () => Get.toNamed(Routes.ABOUT_US),
            ),

            _menuTile(
              Icons.work_outline,
              AppStrings.careers,
                  () => CommonLauncher.openUrl(AppUrls.linkedin),
            ),

            _menuTile(
              Icons.article_outlined,
              AppStrings.blog,
              () => CommonLauncher.openUrl(AppUrls.blogUrl),
            ),

            _menuTile(
              Icons.trending_up,
              AppStrings.investor,
                  () => Get.toNamed(Routes.INVESTOR),
            ),

          ]),

          20.height,

          _sectionTitle(AppStrings.policies),

          5.height,

          _menuCard([
            _menuTile(
              Icons.description_outlined,
              AppStrings.termsAndConditions,
              () => Get.toNamed(Routes.TERMS_CONDITIONS),
            ),

            _menuTile(
              Icons.security_outlined,
              AppStrings.privacyPolicy,
                  () => Get.toNamed(Routes.PRIVACY_POLICY),
            ),

            _menuTile(
              Icons.cancel_outlined,
              AppStrings.cancellationPolicy,
                    () => Get.toNamed(Routes.CANCELLATION_POLICY),
            ),

            _menuTile(
              Icons.gavel_outlined,
              AppStrings.legalAndPrivacy,
                  () => Get.toNamed(Routes.LEGAL_POLICY),
            ),
          ]),

          20.height,

          _sectionTitle(AppStrings.quickAccess),

          5.height,

          _menuCard([

            _menuTile(
              Icons.headset,
              AppStrings.contactUs,
                  () => Get.toNamed(Routes.CONTACT_US),
            ),

            _menuTile(
              Icons.help_outline,
              AppStrings.faq,
                  () => Get.toNamed(Routes.FAQ),
            ),
          ]),

          20.height,

          _sectionTitle(AppStrings.helpAndSupport),

          5.height,

          _card(
            Column(
              children: [

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

              ],
            ),
          ),

          20.height,

          _sectionTitle(AppStrings.followUs),

          5.height,

          _card(
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                5.width,

                socialIcon(
                    img: AppAssets.facebook,
                    url: AppUrls.facebook
                ),

                15.width,

                socialIcon(
                    img: AppAssets.insta,
                    url: AppUrls.instagram
                ),

                15.width,

                socialIcon(
                    img: AppAssets.youTube,
                    url: AppUrls.youtube
                ),

                15.width,

                socialIcon(
                    img: AppAssets.linkedin,
                    url: AppUrls.linkedin
                ),

                5.width,

              ],
            ),
          ),

          20.height

        ],
      ),
    );
  }

  static Widget _sectionTitle(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text.toUpperCase(),
        style: AppTextStyle.primary14SemiBold.copyWith(
          color: AppColors.blue
        ),
      ),
    );
  }

  static Widget _card(Widget child) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 15,
          )
        ],
      ),
      child: child,
    );
  }
}


Widget _BusinessItem({
  required IconData icon,
  required String title,
  required VoidCallback onTap,
}) {

  return Expanded(
    child: InkWell(
      onTap: onTap,
      overlayColor: WidgetStatePropertyAll(Colors.transparent),
      child: Column(
        children: [

          Icon(
            icon,
            size: 22,
            color: AppColors.blue,
          ),

          10.height,

          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyle.black12Medium,
          ),

        ],
      ),
    ),
  );

}

Widget _menuTile(
    IconData icon,
    String title,
    VoidCallback onTap
    ) {
  return ListTile(
    contentPadding: EdgeInsets.zero,
    leading: Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.lightBg
      ),
      child: Icon(
        icon,
        color: AppColors.blue,
        size: 22,
      ),
    ),
    title: Text(
      title,
      style: AppTextStyle.black14Regular,
    ),
    trailing: const Icon(
      Icons.arrow_forward_ios,
      size: 15,
      color: AppColors.grey,
    ),
    onTap: onTap,
  );
}

Widget _menuCard(
    List<Widget> children,
    ) {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 18,
      vertical: 8,
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(22),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.05),
          blurRadius: 15,
        ),
      ],
    ),
    child: Column(
      children: children,
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

Widget _infoRow(
    IconData icon,
    String text,
    ) {
  return Row(
    children: [

      Icon(
        icon,
        color: Colors.white70,
        size: 14,
      ),

      6.width,

      Text(
        text,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 12,
        ),
      ),

    ],
  );
}