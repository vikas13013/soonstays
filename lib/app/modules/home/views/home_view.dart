import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonstays/app/modules/search/view/search_view.dart';
import 'package:soonstays/core/constants/app_colors.dart';
import 'package:soonstays/core/constants/app_size.dart';
import 'package:soonstays/core/constants/app_strings.dart';
import 'package:soonstays/core/constants/app_text_styles.dart';
import 'package:soonstays/core/widgets/common_buttons.dart';
import 'package:soonstays/core/widgets/common_rating_idicator.dart';
import 'package:soonstays/core/widgets/drawer.dart';
import 'package:soonstays/core/widgets/image_cache_network.dart';
import '../../../../core/arguments/property_details_arguments.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_urls.dart';
import '../../../../core/get_storage/session_manager.dart';
import '../../../../core/utils/common_launcher.dart';
import '../../../../core/widgets/common_appbar.dart';
import '../../../data/model/property_list/property_list_model.dart';
import '../../../data/model/search_criteria_model.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  ScrollController?scrollController;

   HomeView({
        super.key,this.scrollController,
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      // drawer: CommonDrawer(),
      body: SafeArea(
        top: false,
        bottom: true,
        child: SingleChildScrollView(
          controller: scrollController,
          physics: ScrollPhysics(),
          child: Stack(
            children: [

              /// TOP CARD / BANNER
              HotelSearchCard(),

              Container(
                margin: EdgeInsets.only(
                  top: 270
                ),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
                color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      ///SEARCH CARD SPACE
                      205.height,

                      ///Feature Card
                      featureCard(),

                      20.height,

                      ///Popular City
                      PopularCityCard(),

                      20.height,

                      Obx(() => controller.propertyList.isEmpty?
                      SizedBox():
                      CurrentHotels(
                        searchCriteriaData: controller.argumentData.value,
                      ),),

                      20.height,

                      ///Info Card 1
                      InfoCard1(),

                      5.height,

                      ///Hotel Facility Card
                      HotelFacilityCard(),

                      ///Info Card
                      InfoCard(),

                      10.height,

                      ///Travel Promo Card
                      TravelPromoCard().paddingOnly(top: 50,bottom: 10),

                      10.height,

                      ///How We Work Section
                      HowItWorksSection(),

                      ///Explore Card
                      ExploreCard(),

                    ],
                  ),
              ),

                /// SEARCH CARD
                Positioned(
                  left: 15,
                  right: 15,
                  top: 210,
                  child: SearchView(
                    type: 1,
                  ),
                ),

              ],
            ),
          ),
      ),
    );
  }

}

///Home Search Card

class HotelSearchCard extends GetView<HomeController> {

  const HotelSearchCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
           AppAssets.homeBg1
          ),
          fit: BoxFit.fill,
        )
      ),
      child: Column(
        children: [


          /// Custom AppBar
          SafeArea(
            top: true,
            bottom: false,
            child: Row(
              children: [

                /// Menu
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:5),
                  child: Row(
                    children: [

                      //
                      // /// MENU ICON
                      // Builder(
                      //   builder: (context) {
                      //
                      //     return InkWell(
                      //       onTap: () {
                      //         Scaffold.of(context).openDrawer();
                      //       },
                      //       child: const Icon(
                      //         Icons.menu,
                      //         color: AppColors.primary,
                      //       ),
                      //     );
                      //   },
                      // ),


                      10.width,

                      Image.asset(
                        AppAssets.logo,
                        fit: BoxFit.contain,
                        height: 40,
                      ),

                    ],
                  ),
                ),


                const Spacer(),

                Row(
                  children: [

                    topButton(
                      bgColor: AppColors.white.withOpacity(0.9),
                      icon: Icons.support_agent,
                      onTap: () => CommonLauncher.makeCall(AppUrls.phoneNumber),
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
            ),
          ),

          15.height,

          Column(
            children: [

              Text.rich(
                style: TextStyle(
                  height: 1.3
                ),
                TextSpan(
                    text: AppStrings.findYourPerfectStayAcross,
                    style: AppTextStyle.primary20Bold,
                    children: [

                      TextSpan(
                          text: " ${AppStrings.india}",
                          style: AppTextStyle.secondary20Bold
                      )

                    ]
                ),
              ),

              4.height,

              Text(
                AppStrings.discoverAffordableComfortable,
                style: AppTextStyle.primary11Medium,
              ),

            ],
          ).marginOnly(
              left: 20,
              right: Get.width*0.3
          ),


          20.height,

        ],
      ),
    );
  }
}

///Popular City Card
class PopularCityCard extends GetView<HomeController> {

  const PopularCityCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text(
              AppStrings.popularCities,
              style: AppTextStyle.black16SemiBold,
            ),

          ],
        ).marginSymmetric(
          horizontal: 20,
        ),

        10.height,


        SizedBox(
          height: 100,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 20),
            itemCount: controller.popularCityList.length,
            physics: ScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {

              var popularCity = controller.popularCityList[index];

              return InkWell(
                onTap: () => controller.popularCityOnTap(popularCity: popularCity),
                child: Column(
                  children: [
                    Container(
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("${popularCity['img']}"),
                              fit: BoxFit.fill
                          )
                      ),
                    ),

                    5.height,

                    Text(
                      "${popularCity['label']}",
                      style: AppTextStyle.black13SemiBold,
                    ),

                  ],
                ).marginOnly(
                    right: 15
                ),
              );

            },
          ),
        )


      ],
    );
  }
}


///InfoCard 1
class InfoCard1 extends StatelessWidget {

  const InfoCard1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: 15
      ),
      padding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10
      ),
      decoration: BoxDecoration(
          color: AppColors.secondary.withOpacity(0.08),
          borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  AppStrings.partnerWithUs,
                  style: AppTextStyle.primary14Bold,
                ),

                Text(
                  AppStrings.growYourBusinessWithSoonStays,
                  style: AppTextStyle.primary10Regular,
                )

              ],
            ),
          ),

          Expanded(
            flex: 1,
            child: Image.asset(
              AppAssets.home5,
              height: 45,
            ),
          ),

          15.width,

          InkWell(
            onTap: () => Get.toNamed(Routes.FRANCHISE),
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 10
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xFFFF8A4C),
                    Color(0xFFFF5A00),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x22FF6B35),
                    blurRadius: 12,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  AppStrings.joinNow,
                  style: AppTextStyle.white12SemiBold,
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}

///Info Card
class InfoCard extends StatelessWidget {

  const InfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CommonInfoCard(
          img: AppAssets.home6,
          title: AppStrings.corporateTravelProgram,
          description: AppStrings.simplifyBusinessTravelForYourEmployees,
          buttonText: AppStrings.request,
          textStyle: AppTextStyle.primary14Bold,
          onTap: () => Get.toNamed(Routes.CORPORATE),
          bgColor: AppColors.lightBg,
          buttonBgColor: AppColors.primary.withOpacity(
              0.8
          ),
        ),
      ],
    );
  }
}

///CommonInfoCard
class CommonInfoCard extends StatelessWidget {
  final String img;
  final String title;
  final TextStyle textStyle;
  final String description;
  final String buttonText;
  final VoidCallback onTap;
  final Color bgColor;
  final Color buttonBgColor;
  const CommonInfoCard({
    super.key,
    required this.img,
    required this.title,
    required this.textStyle,
    required this.description,
    required this.buttonText,
    required this.onTap,
    required this.bgColor,
    required this.buttonBgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: bgColor??AppColors.lightBg,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Stack(
        children: [

          /// RIGHT CIRCLE
          Positioned(
            right: -40,
            bottom: -40,
            child: Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.white,
              ),
            ),
          ),

          /// CONTENT
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                /// TEXT AREA
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      /// TITLE
                      Text(
                        title,
                        style: textStyle??AppTextStyle.black16Bold,
                      ),

                      4.height,

                      /// DESCRIPTION
                      Text(
                        description,
                        style: AppTextStyle.greyDark10Regular,
                      ),
                    ],
                  ),
                ),

                8.width,

                Expanded(
                  flex: 1,
                  child: Image.asset(
                    img,
                    height: 60,
                    fit: BoxFit.contain,
                  ),
                ),

                5.width,

                CommonButton2(
                  onTap: onTap,

                  radius: 10,
                  text: buttonText,
                  startColor: buttonBgColor,
                  endColor: buttonBgColor,
                )

              ],
            ),
          ),

        ],
      ),
    );
  }
}


///HotelFacilityCard
class HotelFacilityCard extends StatelessWidget {
  const HotelFacilityCard({super.key});

  @override
  Widget build(BuildContext context) {
    final facilities = [
      {
        "icon": Icons.wifi,
        "title": AppStrings.freeWiFi,
        "iconColor": Color(0xFF7C3AED),
        "bgColor": Color(0xFFF3EEFF),
      },
      {
        "icon": Icons.tv,
        "title": AppStrings.tv,
        "iconColor": Color(0xFF10B981),
        "bgColor": Color(0xFFECFDF5),
      },
      {
        "icon": Icons.call_to_action_outlined,
        "title": AppStrings.ac,
        "iconColor": Color(0xFF3B82F6),
        "bgColor": Color(0xFFEFF6FF),
      },
      {
        "icon": Icons.shower,
        "title": AppStrings.hotWater,
        "iconColor": Color(0xFF0EA5E9),
        "bgColor": Color(0xFFEFF9FF),
      },
      {
        "icon": Icons.clean_hands_outlined,
        "title": AppStrings.toiletries,
        "iconColor": Color(0xFFF59E0B),
        "bgColor": Color(0xFFFFF8E7),
      },
      {
        "icon": Icons.videocam_outlined,
        "title": AppStrings.security247,
        "iconColor": Color(0xFFEF4444),
        "bgColor": Color(0xFFFFF1F2),
      },
      {
        "icon": Icons.roller_shades_closed_outlined,
        "title": AppStrings.cleanTowels,
        "iconColor": Color(0xFF14B8A6), // Teal
        "bgColor": Color(0xFFE6FFFA),
      },
      {
        "icon": Icons.person,
        "title": AppStrings.roomService,
        "iconColor": Color(0xFFF97316), // Orange
        "bgColor": Color(0xFFFFF7ED),
      },
    ];

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            AppStrings.amenitiesYouLove,
            style: AppTextStyle.black16SemiBold,
          ),

          5.height,

          /// GRID
          GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: facilities.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: .9,
            ),

            itemBuilder: (_, index) {

              final item = facilities[index];

              return _FacilityItem(
                icon: item["icon"] as IconData,
                title: item["title"] as String,
                iconColor: item["iconColor"] as Color,
                bgColor: item["bgColor"] as Color,
              );
            },
          ),
        ],
      ),
    );
  }
}

/// ================= ITEM =================

class _FacilityItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color iconColor;
  final Color bgColor;

  const _FacilityItem({
    required this.icon,
    required this.title,
    required this.iconColor,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        /// ICON
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: 20,
          ),
        ),

        8.height,

        /// TEXT
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyle.primary10SemiBold,
        ),

      ],
    );
  }
}


///Current Hotels Section
class CurrentHotels extends GetView<HomeController> {
  final SearchCriteriaModel searchCriteriaData;
  CurrentHotels({
    super.key,
    required this.searchCriteriaData
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        Text(
          AppStrings.featuredHotels,
          style: AppTextStyle.black16SemiBold,).marginSymmetric(
          horizontal: 20
        ),

        8.height,

        /// ================= LIST =================
        Obx(() => SizedBox(
          height: 200,
          child: ListView.builder(
            padding: EdgeInsets.only(
              left: 20,
              bottom: 15
            ),
            controller: controller.pageController,
            scrollDirection: Axis.horizontal,
            physics: ScrollPhysics(),
            itemCount: controller.propertyList.length,
            itemBuilder: (_, index) {

              final hotel = controller.propertyList[index];

              return InkWell(
                onTap: () => Get.toNamed(
                    Routes.PROPERTY_DETAILS,
                    arguments: PropertyDetailsArgument(
                        searchCriteria: searchCriteriaData,
                        propertiesData: hotel
                    )
                ),
                child: Container(
                  width: 140,
                  margin: EdgeInsets.only(
                    right: 15,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF000000).withOpacity(0.06),
                        blurRadius: 24,
                        spreadRadius: 0,
                        offset: const Offset(0, 8),
                      ),
                      BoxShadow(
                        color: const Color(0xFF000000).withOpacity(0.03),
                        blurRadius: 6,
                        spreadRadius: 0,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [

                      CommonChacheImage(
                          imgHeight: 90,
                          imgWidht: 140,
                          Url: "${hotel.mediaAssets![0].contentBucketUrl}",
                          fit: BoxFit.fill
                      ),

                      6.height,

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            "${hotel.displayName}",
                            style: AppTextStyle.black12SemiBold,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),

                          Text(
                            "${hotel.fullAddress}",
                            style: AppTextStyle.greay10Regular,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),

                          5.height,


                          Row(
                            children: [

                              CommonRatingIdicator(
                                rating: double.tryParse("${hotel.rating}"),
                              ),

                              5.width,

                              Text(
                                "${hotel.rating}",
                                style: AppTextStyle.primary12SemiBold,
                              ),
                            ],
                          ),

                          10.height,

                          Text.rich(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            TextSpan(
                              text: "${AppStrings.rupeesText}${hotel.totalPrice}",
                              style: AppTextStyle.primary14Bold,
                              children: [

                                TextSpan(
                                  text: " / ${AppStrings.night}",
                                  style: AppTextStyle.greay10Medium
                                )

                              ]
                            )
                          ),

                          5.height,

                        ],
                      ).marginSymmetric(
                        horizontal: 5
                      )

                    ],
                  ),
                ),
              );
            },
          ),
        ),),

      ],
    );
  }
}


///Top Hotel Section
class TopHotelsSection extends GetView<HomeController> {
  TopHotelsSection({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        /// ================= HEADER =================
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),

          child: Obx(() => Row(
            children: [

              /// TITLE
              Expanded(
                child: Text(
                  AppStrings.topHotelsAndStays,
                  style: AppTextStyle.black16SemiBold,
                ),
              ),

              /// LEFT
              _ArrowButton(
                icon: Icons.arrow_back_ios_new,
                isActive: controller.currentIndex.value==0?false:true,
                onTap: () {
                  if (controller.currentIndex.value > 0) {

                    controller.currentIndex.value--;

                    controller.pageController.animateToPage(
                      controller.currentIndex.value,

                      duration:
                      const Duration(
                        milliseconds: 300,
                      ),

                      curve: Curves.ease,
                    );
                  }
                },
              ),

              const SizedBox(width: 10),

              /// RIGHT
              _ArrowButton(
                icon: Icons.arrow_forward_ios,
                isActive: true,
                onTap: () {
                  if (controller.currentIndex.value < controller.propertyList.length - 1) { //hotels.length
                    controller.currentIndex.value++;
                    controller.pageController.animateToPage(controller.currentIndex.value,
                      duration: const Duration(
                        milliseconds: 300,
                      ),
                      curve: Curves.ease,
                    );
                  }
                },
              ),
            ],
          ),),
        ),

        const SizedBox(height: 20),

        /// ================= LIST =================
        Obx(() => SizedBox(
          height: 370,
          child: PageView.builder(
            controller: controller.pageController,
            scrollDirection: Axis.horizontal,
            physics: ScrollPhysics(),
            itemCount: controller.propertyList.length,
            onPageChanged: (value) {

              controller.currentIndex.value = value;

            },

            itemBuilder: (_, index) {

              final hotel = controller.propertyList[index];

              return _HotelCard(
                image: hotel.mediaAssets![0].contentBucketUrl.toString(),
                title: hotel.displayName.toString(),
                location: hotel.fullAddress.toString(),
                price: hotel.totalPrice.toString(),
                tag: "",
                rating: double.parse("${hotel.rating}"),
                propertyListData: hotel,
                searchCriteriaData: controller.argumentData.value,
              );
            },
          ),
        ),),
        
      ],
    );
  }
}


/// ================= HOTEL CARD =================

class _HotelCard extends StatelessWidget {
  final String image;
  final String title;
  final String location;
  final String price;
  final String tag;
  final double rating;
  final PropertiesList propertyListData;
  final SearchCriteriaModel searchCriteriaData;

  const _HotelCard({
    required this.image,
    required this.title,
    required this.location,
    required this.price,
    required this.tag,
    required this.rating,
    required this.propertyListData,
    required this.searchCriteriaData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: const Color(0xffE5E7EB),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [

          /// IMAGE
          Stack(
            children: [

              ClipRRect(
                borderRadius:
                BorderRadius.circular(18),

                child: Image.network(
                  image,
                  height: 200,
                  width: 300,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),

          18.height,

          /// TITLE
          Text(
            title,
            style: AppTextStyle.black18Medium,
          ),

          4.height,

          /// LOCATION
          Text(
            location,
            style: AppTextStyle.greay13Regular,
            maxLines: 1,
          ),

          const SizedBox(height: 10),

          /// RATING
          Row(
            children: [

              CommonRatingIdicator(
                rating: rating,
              ),

              const SizedBox(width: 8),

              Text(
                "$rating",
                style: AppTextStyle.greyDark12SemiBold,
              ),
            ],
          ),

          const Spacer(),

          /// PRICE & BUTTON
          Row(
            children: [

              Expanded(
                child: Text.rich(
                  TextSpan(
                    text: "${AppStrings.rupeesText} ",
                    style: AppTextStyle.black22SemiBold,
                    children: [

                      TextSpan(
                        text: price,
                        style: AppTextStyle.black18SemiBold
                      )

                    ]
                  ),
                ),
              ),

              CommonButton(
                height: 40,
                text: AppStrings.bookNow,
                onTap: () => Get.toNamed(
                    Routes.PROPERTY_DETAILS,
                    arguments: PropertyDetailsArgument(
                        searchCriteria: searchCriteriaData,
                        propertiesData: propertyListData
                    )
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// ================= ARROW BUTTON =================

class _ArrowButton extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  const _ArrowButton({
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      overlayColor: WidgetStatePropertyAll(Colors.transparent),
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: isActive?
          LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              AppColors.primary,
              AppColors.blue,
            ],
          ):LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              AppColors.greyLight,
              AppColors.greyLight,
            ],
          ),
        ),
        child: Icon(
          icon,
          size: 16,
          color: isActive
              ? Colors.white
              : Colors.grey.shade700,
        ),
      ),
    );
  }
}


///TravelPromo Card
class TravelPromoCard extends StatelessWidget {

  const TravelPromoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 15
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20)
        ),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary,
            AppColors.blue
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Stack(
        clipBehavior: Clip.none,
        children: [

          /// ================= TEXT =================
          Container(
            padding: EdgeInsets.only(
              left: 10,
              right: 30,
              bottom: 20,
              top: 20
            ),
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [

                /// TITLE
                Text(
                  AppStrings.discoverYourPerfectStayWithSoonStays,
                  style: AppTextStyle.white16SemiBold,
                ).marginOnly(
                    right: 20
                ),

                15.height,

                /// SUBTITLE
                Text(
                  AppStrings.weOfferCarefullySelected,
                  style: AppTextStyle.greyLight10Light,
                ).marginOnly(
                  right: 40
                ),

              ],
            ),
          ),

          /// ================= AIRPLANE =================
          Positioned(
            top: -50,
            right: 55,
            child: Image.asset(
              AppAssets.airoplan,
              height: 70,
              width: 70,
              fit: BoxFit.contain,
            ),
          ),

          /// ================= GIRL IMAGE =================
          Positioned(
            right: -35,
            bottom: 0,
            child: Image.asset(
              AppAssets.home2,
              height: 185,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}


///How We Work Section
class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          AppStrings.howItWorks,
          style: AppTextStyle.primary16SemiBold,
        ),

        10.height,

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            _stepItem(
              icon: Icons.search,
              title: "${AppStrings.search}",
              subtitle: "${AppStrings.findYourPerfectStay}",
            ),

            const Padding(
              padding: EdgeInsets.only(bottom: 25),
              child: Icon(
                Icons.arrow_right_alt_outlined,
                size: 15,
                color: AppColors.grey,
              ),
            ),

            _stepItem(
              icon: Icons.apartment_outlined,
              title: "${AppStrings.book}",
              subtitle: "${AppStrings.chooseAndBookInJustAFewTaps}",
            ),

            const Padding(
              padding: EdgeInsets.only(bottom: 25),
              child: Icon(
                Icons.arrow_right_alt_outlined,
                size: 15,
                color: AppColors.grey,
              ),
            ),

            _stepItem(
              icon: Icons.credit_card_outlined,
              title: "${AppStrings.payAndGo}",
              subtitle: "${AppStrings.securePaymentAndEnjoyYourTrip}",
            ),

          ],
        ),
      ],
    ).marginSymmetric(
      horizontal: 20
    );
  }

  Widget _stepItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Column(
      children: [

        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.lightBg1,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: AppColors.blue,
            size: 20,
          ),
        ),

        10.height,

        Text(
          title,
          style: AppTextStyle.primary14SemiBold,
        ),

        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: AppTextStyle.greay10Regular,
        ),

      ],
    );
  }
}


///Explore Hotel Card
class ExploreCard extends StatelessWidget {

  const ExploreCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary,
            AppColors.blue
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Flexible(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [
            
                /// TITLE
                Text(
                  AppStrings.exploreHotelsOnMap,
                  style: AppTextStyle.white18SemiBold,
                ),
            
                10.height,
            
                /// SUBTITLE
                Text(
                  AppStrings.searchAndBookTheBestHotelsAnywhere,
                  style: AppTextStyle.greyLight10Light,
                ),
              ],
            ),
          ),

          10.width,

          Image.asset(
            AppAssets.home3,
            height: 100,
            fit: BoxFit.contain,
          )

        ],
      ),
    );
  }
}


///Feature Card
class featureCard extends StatelessWidget {

  const featureCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 18,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.08),
            blurRadius: 20,
            spreadRadius: 2,
            offset: Offset.zero,
          ),
        ],
      ),

      child: Row(

        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,

        children: [

          _featureItem(
              icon: Icons.discount_outlined,
              title: AppStrings.bestOffers,
              color: AppColors.secondary
          ),

          _featureItem(
              icon: Icons.verified_user_outlined,
              title: AppStrings.trustedStays,
              color: AppColors.primary3
          ),

          _featureItem(
              icon: Icons.support_agent_outlined,
              title: AppStrings.support247,
              color: AppColors.green
          ),

          _featureItem(
              icon: Icons.wallet_outlined,
              title: AppStrings.easyBooking,
              color: AppColors.blue1
          ),
        ],
      ),
    );
  }
}

///Feature Item
Widget _featureItem({

  required IconData icon,

  required String title,

  required Color color,

}) {

  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [

      Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: color.withOpacity(0.05),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(icon,color: color,size: 20),
        // child: ShaderIcon(icons: icon),
      ),

      10.height,

      SizedBox(
        width: 70,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyle.primary10SemiBold,
        ),
      ),

    ],
  );
}