import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonstays/core/constants/app_strings.dart';
import '../../app/routes/app_pages.dart';
import '../constants/app_assets.dart';
import '../constants/app_colors.dart';
import '../constants/app_size.dart';
import '../constants/app_text_styles.dart';
import '../constants/app_urls.dart';
import '../get_storage/session_manager.dart';
import '../utils/common_launcher.dart';
import 'common_buttons.dart';
import 'common_dialog.dart';

///DashBoard App Bar
DashBoardAppBar({
  bool?isDrawer,
}){

  return AppBar(
    toolbarHeight: 65,
    backgroundColor: AppColors.primary,
    leadingWidth: Get.width*0.5,
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary,
            AppColors.blue,
          ],
        ),
      ),
    ),
    elevation: 3,
    leading: Padding(
      padding: const EdgeInsets.symmetric(horizontal:8),
      child: Row(
        children: [


          /// MENU ICON
          isDrawer==true?
          Builder(
            builder: (context) {

              return InkWell(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.05),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
              );
            },
          ):
          SizedBox(),

          10.width,

          Image.asset(
            AppAssets.logo,
            fit: BoxFit.contain,
            height: 40,
          ),

        ],
      ),
    ),
    centerTitle: true,
    actions: [

      Row(
        children: [

          topButton(
            bgColor: AppColors.white.withOpacity(0.9),
            icon: Icons.support_agent,
            onTap: () => CommonLauncher.makeCall("${AppUrls.phoneNumber}"),
          ),

          10.width,

          SessionManager.instance.isLoggedIn?
          PopupMenuButtonWidget():
          topButton(
            bgColor: AppColors.white.withOpacity(0.9),
            icon: Icons.account_circle_outlined,
            onTap: () => Get.toNamed(Routes.LOGIN),
          ).marginOnly(
            right: 10
          ),

        ],
      )

    ],
  );

}


Widget PopupMenuButtonWidget() {

  return PopupMenuButton<String>(
    offset: const Offset(0, 50),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    icon: const Icon(
      Icons.more_vert,
      color: AppColors.white,
    ),
    onSelected: (value) {

      switch (value) {

        case "profile":
          Get.toNamed(Routes.USER_PROFILE);
          break;

        case "trips":
          Get.toNamed(Routes.MY_TRIPS);
          break;

        case "logout":
          CommonDialogs.showLogoutDialog();
          break;
      }
    },
    itemBuilder: (context) => [

       PopupMenuItem(
        value: "profile",
        child: Row(
          children: [
            Icon(Icons.person_outline),
            SizedBox(width: 12),
            Text("${AppStrings.profile}"),
          ],
        ),
      ),

      PopupMenuItem(
        value: "trips",
        child: Row(
          children: [
            Icon(Icons.luggage_outlined),
            SizedBox(width: 12),
            Text("${AppStrings.myTrips}"),
          ],
        ),
      ),

      const PopupMenuDivider(),

      PopupMenuItem(
        value: "logout",
        child: Row(
          children: [
            const Icon(
              Icons.logout,
              color: Colors.red,
            ),
            const SizedBox(width: 12),
            Text(
              AppStrings.logOut,
              style: const TextStyle(
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    ],
  );

}


/// TOP BUTTON
Widget topButton({
  required IconData icon,
  Color?bgColor,
  required VoidCallback onTap
}) {

  return InkWell(
    overlayColor: WidgetStatePropertyAll(Colors.transparent),
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: Colors.white.withOpacity(.15),
        ),
        color: bgColor??Colors.white.withOpacity(.03),
      ),
      child: ShaderMask(

        shaderCallback: (bounds) {

          return LinearGradient(

            colors: [

              Color(0xffFF5E62),

              Color(0xffFF9B2F),

              Color(0xffFF5E62),
            ],

          ).createShader(bounds);
        },

        child: Icon(
          icon,
          color: Colors.white,
          size: 22,
        ),
      ),
    ),
  );
}

///Common App Bar
CommonAppBar({
  required String title,
  bool?titleCenter,
  TextStyle?titleStyle,
  List<Widget>?action,
  bool?isActionTrue,
  double?borderRadius
}){

  return AppBar(
    toolbarHeight: 60,
    backgroundColor: AppColors.white,
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary,
            AppColors.blue,
          ],
        ),
      ),
    ),
    elevation: 3,
    leadingWidth: 65,
    leading: Container(
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 10
      ),
      child: InkWell(
        onTap: () => Get.back(),
        overlayColor: WidgetStatePropertyAll(Colors.transparent),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.circle
          ),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.primary,
            size: 20,
          ),
        ),
      ),
    ),
    centerTitle: titleCenter??true,
    titleSpacing: 0,
    title: Text(
      title,
      style: titleStyle??AppTextStyle.white20SemiBold,
    ),
    actions: isActionTrue==true?[

      Row(
        children: [

          topButton(
            bgColor: AppColors.white.withOpacity(0.9),
            icon: Icons.support_agent,
            onTap: () => CommonLauncher.makeCall("${AppUrls.phoneNumber}"),
          ),

          10.width,

        ],
      )

    ]:action,
  );

}

///DashBoard App Bar
PropertyAppBar({
  required Widget columnWidget,
  required VoidCallback ontap
}){

  return PreferredSize(
    preferredSize: const Size.fromHeight(120),
    child: AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 120,
      elevation: 0,
      backgroundColor: AppColors.primary,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
          image: DecorationImage(
            image: AssetImage(
              AppAssets.appBarBg,
            ),
            fit: BoxFit.cover,
            opacity: .2,
          ),
        ),

        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15
            ),
            child: Column(
              children: [

                /// top section
                Row(
                  children: [

                    CommonSquareIconButton(
                      borderRadious: 50,
                      icon: Icons.arrow_back_ios_new_rounded,
                      backgroundColor: AppColors.white,
                      iconColor: Colors.black,
                      onTap: () => Get.back(),
                    ),

                    const Spacer(),


                    SessionManager.instance.isLoggedIn?SizedBox():
                    CommonSquareIconButton(
                      icon: Icons.account_circle_outlined,
                      backgroundColor: AppColors.secondary,
                      onTap: () => Get.toNamed(Routes.LOGIN),
                    ),

                    10.width,

                    CommonSquareIconButton(
                      icon: Icons.phone_in_talk_outlined,
                      backgroundColor: AppColors.blue,
                      onTap: () => CommonLauncher.makeCall("${AppUrls.phoneNumber}"),
                    ),

                  ],
                ),

                const Spacer(),

                /// search card
                InkWell(
                  overlayColor: WidgetStatePropertyAll(Colors.transparent),
                  onTap: ontap,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 12
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.08),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.white24,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                  
                        columnWidget,
                  
                        5.width,
                  
                        Icon(
                          Icons.edit,
                          size: 15,
                          color: AppColors.white,
                        ),
                  
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    ),
  );

}