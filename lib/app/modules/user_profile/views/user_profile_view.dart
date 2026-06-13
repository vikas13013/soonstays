import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soonstays/core/constants/app_assets.dart';
import 'package:soonstays/core/constants/app_colors.dart';
import 'package:soonstays/core/constants/app_size.dart';
import 'package:soonstays/core/constants/app_strings.dart';
import 'package:soonstays/core/constants/app_text_styles.dart';
import 'package:soonstays/core/constants/app_urls.dart';
import 'package:soonstays/core/widgets/common_appbar.dart';
import 'package:soonstays/core/widgets/common_buttons.dart';
import 'package:soonstays/core/widgets/common_dialog.dart';
import 'package:soonstays/core/widgets/common_text_field.dart';
import 'package:soonstays/core/widgets/shader_icon.dart';
import 'package:soonstays/core/widgets/shimmer/profile_shimmer.dart';

import '../controllers/user_profile_controller.dart';

class UserProfileView extends GetView<UserProfileController> {
  int?type;
  UserProfileView({
    super.key,
    this.type
  });
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value?
      ProfileShimmerScreen():
      Scaffold(
        appBar:CommonAppBar(
            title: AppStrings.profile,
            borderRadius: 0
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [

                SizedBox(
                  height: 760,
                  child: Stack(
                    children: [

                      Container(
                        width: double.infinity,
                        height: 220,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppAssets.profileBg),
                              fit: BoxFit.fill
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [


                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.white70,
                                      borderRadius: BorderRadius.circular(15)
                                  ),
                                  child: Obx(() => Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      Text(
                                        controller.nameValue.value==''?AppStrings.na:controller.nameValue.value,
                                        maxLines: 1,
                                        style: AppTextStyle.primary20Bold,
                                      ),

                                      Text(
                                        AppStrings.manageYourProfileDetails,
                                        style: AppTextStyle.primary10Medium,
                                      )

                                    ],
                                  ),),
                                ),

                                5.height,

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Container(
                                      padding: EdgeInsetsGeometry.symmetric(
                                          horizontal: 10,
                                          vertical: 10
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.white70,
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [

                                          Icon(
                                            Icons.phone_outlined,
                                            color: AppColors.blue,
                                            size: 13,
                                          ),

                                          5.width,

                                          Obx(() =>  Text(
                                            controller.mobileValue.value,
                                            style: AppTextStyle.primary12Medium,
                                          ),)

                                        ],
                                      ),
                                    ),

                                    5.height,

                                    Container(
                                      padding: EdgeInsetsGeometry.symmetric(
                                          horizontal: 10,
                                          vertical: 10
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.white70,
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [

                                          Icon(
                                            Icons.email_outlined,
                                            color: AppColors.blue,
                                            size: 13,
                                          ),

                                          5.width,

                                          Obx(() => Text(
                                            controller.emailValue.value==''?AppStrings.na:controller.emailValue.value,
                                            style: AppTextStyle.primary12Medium,
                                            maxLines: 1,
                                          ),)

                                        ],
                                      ),
                                    ),

                                  ],
                                ),

                                30.height,

                              ],
                            ).marginSymmetric(
                                horizontal: 10,
                                vertical: 10
                            )

                          ],
                        ),
                      ),

                      Positioned(
                        top: 190,
                        right: 10,
                        left: 10,
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: BoxBorder.all(color: AppColors.greyLight
                              )
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Row(
                                    children: [

                                      ShaderIcon(
                                          icons: Icons.person_outline_outlined,
                                          iconSize: 30
                                      ),

                                      10.width,

                                      SizedBox(
                                        width: Get.width*0.5,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            Text(
                                              AppStrings.personalInformation,
                                              style: AppTextStyle.black16SemiBold,
                                            ),

                                            Text(
                                              AppStrings.updateYourPersonalDetailsAndPreferences,
                                              style: AppTextStyle.greyDark10Regular,
                                            )

                                          ],
                                        ),
                                      ),

                                    ],
                                  ),

                                  Image.asset(
                                    AppAssets.profile2,
                                    height: 55,
                                  )

                                ],
                              ),

                              25.height,

                              Text(
                                AppStrings.fullName.toUpperCase(),
                                style: AppTextStyle.greyDark13Medium,
                              ),

                              5.height,

                              CustomInputFieldBorder(
                                controller: controller.nameController.value,
                                hintText: AppStrings.fullName,
                                prefixIcon: Icon(
                                  Icons.person_outline_outlined,
                                  color: AppColors.grey,
                                ),
                              ),

                              15.height,

                              Text(
                                AppStrings.emailAddress.toUpperCase(),
                                style: AppTextStyle.greyDark13Medium,
                              ),

                              5.height,

                              CustomInputFieldBorder(
                                controller: controller.emailController.value,
                                hintText: AppStrings.emailAddress,
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: AppColors.grey,
                                ),
                              ),

                              15.height,

                              Text(
                                AppStrings.mobileNumber.toUpperCase(),
                                style: AppTextStyle.greyDark13Medium,
                              ),

                              5.height,

                              CustomInputFieldBorder(
                                controller: controller.mobileController.value,
                                hintText: AppStrings.mobileNumber,
                                prefixIcon: Icon(
                                  Icons.phone_outlined,
                                  color: AppColors.grey,
                                ),
                                readOnly: true,
                              ),

                              5.height,

                              Text(
                                AppStrings.contactSupportToUpdateYourSecureMobileNumber,
                                style: AppTextStyle.greyDark10Light,
                              ),

                              15.height,

                              Text(
                                AppStrings.gender.toUpperCase(),
                                style: AppTextStyle.greyDark13Medium,
                              ),

                              5.height,

                              Obx(() => Row(
                                children: [

                                  Expanded(
                                    child: genderItem(
                                      title: "Male",
                                      icon: Icons.male,
                                      isSelected: controller.selectedGender.value=="Male",
                                      onTap: () {
                                        controller.changeGender("Male");
                                      },
                                    ),
                                  ),

                                  const SizedBox(width: 10),

                                  Expanded(
                                    child: genderItem(
                                      title: "Female",
                                      icon: Icons.female,
                                      isSelected: controller.selectedGender.value=="Female",
                                      onTap: () {
                                        controller.changeGender("Female");
                                      },
                                    ),
                                  ),

                                  const SizedBox(width: 10),

                                  Expanded(
                                    child: genderItem(
                                      title: "Other",
                                      icon: Icons.transgender,
                                      isSelected: controller.selectedGender.value=="Other",
                                      onTap: () {
                                        controller.changeGender("Other");
                                      },
                                    ),
                                  ),

                                ],
                              ),),

                              25.height,

                              CommonButton(
                                onTap: () => controller.updateProfile(),
                                height: 50,
                                text: AppStrings.saveChanges,
                                textStyle: AppTextStyle.white14SemiBold,
                              ),

                              10.height,

                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

                10.height,

                Container(
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsetsGeometry.symmetric(
                      horizontal: 10
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: BoxBorder.all(color: AppColors.greyLight
                      )
                  ),
                  child: Column(
                    children: [


                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Row(
                            children: [

                              ShaderIcon(
                                  icons: Icons.shield_outlined,
                                  iconSize: 30
                              ),

                              10.width,

                              SizedBox(
                                width: Get.width*0.5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text(
                                      AppStrings.account,
                                      style: AppTextStyle.black16SemiBold,
                                    ),

                                    Text(
                                      AppStrings.manageYourAccountSettingsAndSecurity,
                                      style: AppTextStyle.greyDark10Regular,
                                    )

                                  ],
                                ),
                              ),

                            ],
                          ),

                          Image.asset(
                            AppAssets.profile1,
                            height: 55,
                          )

                        ],
                      ),

                      10.height,

                      Container(
                          decoration: BoxDecoration(
                              border: BoxBorder.all(
                                color: AppColors.greyLight,
                              ),
                              borderRadius: BorderRadius.circular(12)
                          ),
                          child: Column(
                            children: [

                              10.height,

                              AccountRow(
                                icons: Icons.tv_outlined,
                                iconsColor: AppColors.greyDark,
                                title: AppStrings.manageDevices,
                                onTap: () {

                                },
                              ),

                              Divider(
                                color: AppColors.greyLight,
                              ),

                              AccountRow(
                                onTap: () => CommonDialogs.DeleteDialog(
                                  onTap: () => Get.back(),
                                ),
                                  icons: Icons.delete_outline_rounded,
                                  iconsColor: AppColors.red,
                                  title: AppStrings.deleteAccount,
                                  textStyle: AppTextStyle.red14Medium
                              ),

                              10.height,

                            ],
                          )
                      )

                    ],
                  ),
                ),

                15.height,

                CommonButton(
                  onTap: () => CommonDialogs.showLogoutDialog(
                    onLogout: () => Get.back(),
                  ),
                  color1: AppColors.red,
                  color2: AppColors.red,
                  textStyle: AppTextStyle.white18SemiBold,
                  text: AppStrings.logOut,
                ).marginSymmetric(
                    horizontal: 10
                ),

                100.height,

              ],
            ),
          ),
        ),
      )
    );
  }

  Widget AccountRow(
  {
    required IconData icons,
    Color?iconsColor,
    double?iconSize,
    required String title,
    required VoidCallback onTap,
    TextStyle?textStyle,
}){

    return InkWell(
      overlayColor: WidgetStatePropertyAll(Colors.transparent),
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Row(
            children: [

              Icon(
                icons,
                color: iconsColor??AppColors.primary,
                size: iconSize??20,
              ),

              10.width,

              Text(
                title,
                style: textStyle??AppTextStyle.primary14Medium,
              ),

            ],
          ),

          Icon(
            Icons.arrow_forward_ios_outlined,
            size: 15,
            color: AppColors.primary,
          )

        ],
      ).marginSymmetric(
          horizontal: 10,
          vertical: 10
      ),
    );

  }

  Widget genderItem({
    required String title,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.blue
              : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.blue,
          ),
        ),
        child: Column(
          children: [

            Icon(
              icon,
              color: isSelected
                  ? Colors.white
                  : AppColors.blue,
            ),

            const SizedBox(height: 5),

            Text(
              title,
              style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : AppColors.blue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

}

