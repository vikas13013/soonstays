import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soonstays/core/constants/app_strings.dart';
import 'package:soonstays/core/constants/app_urls.dart';
import 'package:soonstays/core/widgets/common_buttons.dart';
import 'package:soonstays/core/widgets/common_text_field.dart';
import 'package:soonstays/core/widgets/image_cache_network.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/common_launcher.dart';
import '../../../../core/widgets/common_appbar.dart';
import '../controllers/contact_us_controller.dart';

class ContactUsView extends GetView<ContactUsController> {
  const ContactUsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: CommonAppBar(
          title: AppStrings.contactUs,
          isActionTrue: true
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              10.height,

              /// HEADER
              Container(
                padding: EdgeInsets.all(16),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [

                        AppColors.primary,

                        AppColors.blue,

                        AppColors.primary3,

                      ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Row(
                  children: [

                    Expanded (
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [

                          Text(
                            AppStrings.wereHereTo,
                            style: AppTextStyle.white16Bold,
                          ),

                          Text(
                            AppStrings.helpYou,
                            style:  AppTextStyle.secondary16Bold,
                          ),

                          SizedBox(height: 10),

                          Text(
                            AppStrings.ourSupportTeamIsAvailable,
                            style: AppTextStyle.white10Regular,
                          ),

                          10.height,

                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.secondary,
                              borderRadius: BorderRadius.circular(40)
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [

                                Icon(
                                  Icons.watch_later_outlined,
                                  color: AppColors.white,
                                  size: 12,
                                ),

                                5.width,

                                Text(
                                  AppStrings.guestSupport247,
                                  style: AppTextStyle.white10SemiBold,
                                )

                              ],
                            ),
                          )

                        ],
                      ),
                    ),

                    Image.asset(
                      AppAssets.contactUsImg,
                      height: 110,
                    ),

                  ],
                ),
              ),

              const SizedBox(height: 16),

              Text(
                AppStrings.quickContact,
                style: AppTextStyle.black13SemiBold,
              ),

              5.height,

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 10,
                children: [

                  box(
                      icon: Icons.phone_outlined,
                      iconColor: AppColors.blue,
                      bgColor: AppColors.lightBg,
                      title: AppStrings.callUs,
                      contact: AppUrls.phoneNumber,
                      subTitle: AppStrings.support247
                  ),

                  box(
                      icon: Icons.email_outlined,
                      iconColor: AppColors.green,
                      bgColor: AppColors.green.withOpacity(0.1),
                      title: AppStrings.emailUs,
                      contact: AppUrls.supportEmail,
                      subTitle: AppStrings.weReplyWithin24hrs
                  ),

                ],
              ),

              10.height,

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 10,
                children: [

                  box(
                      icon: Icons.language,
                      iconColor: AppColors.secondary,
                      bgColor: AppColors.secondary.withOpacity(0.1),
                      title: AppStrings.website,
                      contact: AppUrls.websiteSoonStays,
                      subTitle: AppStrings.visitOurWebsite
                  ),

                  box(
                      icon: Icons.location_on_outlined,
                      iconColor: AppColors.blue,
                      bgColor: AppColors.lightBg,
                      title: AppStrings.location,
                      contact: AppUrls.address,
                      subTitle: ""
                  ),

                ],
              ),

              20.height,

              Text(
                AppStrings.sendUsAMessage,
                style: AppTextStyle.black13SemiBold,
              ),

              5.height,

              CustomInputFieldBorder(
                controller: TextEditingController(),
                hintText: AppStrings.fullName,
                prefixIcon: Icon(
                  Icons.person_outline_outlined,
                  color: AppColors.blue1,
                  size: 15,
                ).marginOnly(
                    left: 10,
                    right: 5
                ),
              ),

              5.height,

              CustomInputFieldBorder(
                controller: TextEditingController(),
                hintText: AppStrings.mobileNumber,
                prefixIcon: Icon(
                  Icons.phone_outlined,
                  color: AppColors.blue1,
                  size: 15,
                ).marginOnly(
                    left: 10,
                    right: 5
                ),
              ),

              5.height,

              CustomInputFieldBorder(
                controller: TextEditingController(),
                hintText: AppStrings.emailAddress,
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: AppColors.blue1,
                  size: 15,
                ).marginOnly(
                    left: 10,
                    right: 5
                ),
              ),

              5.height,

              CustomInputFieldBorder(
                controller: TextEditingController(),
                hintText: AppStrings.howCanWeHelpYou,
                prefixIcon: Icon(
                  Icons.phone_outlined,
                  color: AppColors.blue1,
                  size: 15,
                ).marginOnly(
                    left: 10,
                    right: 5
                ),
              ),

              15.height,

              CommonButton(
                onTap: () {},
                height: 40,
                text: AppStrings.sendMessage,
                textStyle: AppTextStyle.white14SemiBold,
              ),

              20.height,

              Text(
                AppStrings.ourLocation,
                style: AppTextStyle.black13SemiBold,
              ),

              5.height,

              CommonChacheImage(
                Url: "https://i.sstatic.net/HILmr.png",
                imgHeight: 200
              ),

              20.height,

              Row(
                children: [

                  Flexible(
                    child: CommonImgTextButton(
                      height: 45,
                      width: double.infinity,
                      text: AppStrings.callNow,
                      img: AppAssets.phoneCall,
                      textStyle: AppTextStyle.black13SemiBold,
                      color1: AppColors.white,
                      color2: AppColors.white,
                      imgSize: 20,
                      onTap: () => CommonLauncher.makeCall(AppUrls.phoneNumber),
                    ),
                  ),

                  10.width,

                  Flexible(
                    child: CommonImgTextButton(
                      height: 45,
                      width: double.infinity,
                      img: AppAssets.whatsapp,
                      imgSize: 20,
                      borderColor: AppColors.green,
                      text: AppStrings.whatsAppUs,
                      textStyle: AppTextStyle.black13SemiBold,
                      color1: AppColors.white,
                      color2: AppColors.white,
                      onTap: () => CommonLauncher.openWhatsApp(phone: AppUrls.phoneNumber,message: "Hello Check"),
                    ),
                  ),

                ],
              ),

              const SizedBox(height: 50),

            ],
          ).marginSymmetric(
            horizontal: 10
          ),
        ),
      ),
    );
  }
}


Widget box({
  required IconData icon,
  required Color iconColor,
  required Color bgColor,
  required String title,
  required String contact,
  required String subTitle,
}){

  return Container(
    width: Get.width*0.45,
    height: 80,
    padding: EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: AppColors.white,
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        CircleAvatar(
          backgroundColor: bgColor,
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),

        8.width,

        Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                title,
                style: AppTextStyle.black8Regular,
              ),

              Text(
                contact,
                style: AppTextStyle.black10SemiBold,
              ),

              subTitle==""?
              SizedBox():
              Text(
                subTitle,
                style: AppTextStyle.greay10Regular,
              )

            ],
          ),
        )

      ],
    ),
  );

}