import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:soonstays/core/constants/app_colors.dart';
import 'package:soonstays/core/constants/app_size.dart';
import 'package:soonstays/core/constants/app_strings.dart';
import 'package:soonstays/core/constants/app_text_styles.dart';
import 'package:soonstays/core/widgets/common_buttons.dart';
import 'package:soonstays/core/widgets/common_rating_idicator.dart';
import 'package:soonstays/core/widgets/common_readmore_widget.dart';
import 'package:soonstays/core/widgets/common_view_details.dart';
import 'package:soonstays/core/widgets/shimmer/property_details_shimmer.dart';
import '../../../../core/utils/share_plus.dart';
import '../../../../core/widgets/image_cache_network.dart';
import '../../../data/model/property_details/available_rooms_model.dart';
import '../../../routes/app_pages.dart';
import '../controllers/property_details_controller.dart';

///Property Details View
class PropertyDetailsView extends GetView<PropertyDetailsController> {
  const PropertyDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
    controller.isLoading.value?
    PropertyDetailShimmer():
    Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        toolbarHeight: 0,
      ),
      body:NestedScrollView(

        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [

            /// TOP CONTENT
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Stack(
                    children: [

                      SizedBox(
                        height: 250,
                        child: Row(
                          children: [

                            /// LEFT BIG IMAGE
                            Expanded(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(30),
                                    bottomLeft: Radius.circular(30)
                                ),
                                child: CommonChacheImage(
                                    Url: "${controller.propertyListData.value.mediaAssets![0].contentBucketUrl}",
                                    fit: BoxFit.cover
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),

                      Positioned(
                        bottom: 15,
                        right: 10,
                        child: InkWell(
                          onTap : () => Get.toNamed(
                            Routes.PROPERTIES_IMAGES,
                            arguments: controller.propertyImages,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              Center(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 10
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Row(
                                    children: [

                                      Icon(
                                        Icons.image_outlined,
                                        size: 15,
                                        color: AppColors.white,
                                      ),

                                      5.width,

                                      Text(
                                        AppStrings.viewAllPhotos,
                                        style: AppTextStyle.white12Medium,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      /// BLUE TOP EFFECT
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 140,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xff1C1F6B),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),

                      /// TOP BUTTONS
                      Positioned(
                        top: 15,
                        left: 10,
                        child: InkWell(
                          onTap: () => Get.back(),
                          child: circleButton(
                              Icons.arrow_back_ios_new
                          ),
                        ),
                      ),

                      Positioned(
                        top: 15,
                        right: 10,
                        child: InkWell(
                            onTap: () => CommonShare.link(
                              title: "SoonStays",
                              url: "https://soonstays.com",
                            ),
                            child: circleButton(Icons.share_outlined)
                        ),
                      ),


                    ],
                  ),

                  10.height,

                  Obx(() => Column(
                    children: [

                      /// Hotel Details
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text(
                                  controller.propertyData.value.displayName??"",
                                  style: AppTextStyle.black16Bold,
                                ),


                                5.height,

                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Icon(
                                      Icons.location_on_outlined,
                                      color: AppColors.primary,
                                      size: 14,
                                    ),

                                    3.width,

                                    Flexible(
                                        child: Text(
                                          "${controller.propertyData.value.fullAddress}",
                                          style: AppTextStyle.greay10Regular,
                                          textAlign: TextAlign.start,
                                        )
                                    )

                                  ],
                                )


                              ],
                            ),
                          ),

                          5.width,

                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: AppColors.greyLight,
                                    width: 0.8
                                )
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                CommonRatingIdicator(
                                    Size: 10
                                ),

                                2.height,

                                Text(
                                  AppStrings.excellent,
                                  style: AppTextStyle.black12SemiBold,
                                ),

                                2.height,

                                Text(
                                  '120 ${AppStrings.reviews}',
                                  style: AppTextStyle.greay10Regular,
                                )

                              ],
                            ),
                          )

                        ],
                      ),

                      15.height,

                      ///Facility Container
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 8
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.greyLight,
                                width: 0.6
                            ),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        width: double.infinity,
                        child: Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          runSpacing: 10,
                          children: List.generate(
                            controller.facilityList.length,
                                (index) {

                              var data = controller.facilityList[index];

                              return SizedBox(
                                width: 60,
                                height: 50,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: AppColors.lightBg,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: data['icon'],
                                    ),

                                    Text(
                                      "${data['name']}",
                                      style: AppTextStyle.greyDark8SemiBold,
                                      textAlign: TextAlign.center,
                                    ),

                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      15.height,

                      ///Price Details Card

                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10
                        ),
                        decoration: BoxDecoration(
                            color: AppColors.lightBg,
                            border: Border.all(
                                color: AppColors.greyLight,
                                width: 0.2
                            ),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text.rich(
                                      TextSpan(
                                          text: "${AppStrings.rupeesText} ${controller.pricePerNight.value}",
                                          style: AppTextStyle.black18Bold,
                                          children: [

                                            TextSpan(
                                                text: " / ${AppStrings.night}",
                                                style: AppTextStyle.greay14Medium
                                            ),

                                          ]
                                      ),
                                    ),

                                    5.height,

                                    Text(
                                      "+ ${AppStrings.rupeesText}80 ${AppStrings.taxes}",
                                      style: AppTextStyle.greay11Regular,
                                    ),

                                    5.height,

                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 6,
                                          vertical: 5
                                      ),
                                      decoration: BoxDecoration(
                                          color: AppColors.primary3,
                                          borderRadius: BorderRadius.circular(12)
                                      ),
                                      child: Row(
                                        children: [

                                          Icon(
                                            Icons.verified_user_rounded,
                                            size: 16,
                                            color: AppColors.white,
                                          ),

                                          4.width,

                                          Text(
                                            AppStrings.bestPrice,
                                            style: AppTextStyle.white11Medium,
                                          )


                                        ],
                                      ),
                                    )

                                  ],
                                ),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [

                                    CommonButton(
                                      height: 35,
                                      radius: 10,
                                      onTap: () {},
                                      text: AppStrings.reserveNow,
                                      color1: AppColors.secondary,
                                      color2: AppColors.secondary2,
                                    ),

                                    10.height,

                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        Icon(
                                          Icons.check_circle_outline,
                                          color: AppColors.green,
                                          size: 15,
                                        ),

                                        3.width,

                                        Text(
                                          AppStrings.noPrePaymentRequired,
                                          style: AppTextStyle.green10Medium,
                                          textAlign: TextAlign.center,
                                        ),

                                      ],
                                    )

                                  ],
                                )


                              ],
                            ),

                            10.height,

                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10
                              ),
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: AppColors.greyLight,
                                  )
                              ),
                              child: Wrap(
                                spacing: 12,
                                runSpacing: 15,
                                alignment: WrapAlignment.spaceBetween,
                                children: [

                                  bookingInfoItem(
                                      title: AppStrings.checkIn,
                                      date: "16 May, 2026",
                                      time: "${AppStrings.after} 12:00 ${AppStrings.pm}"
                                  ),

                                  bookingInfoItem(
                                      title: AppStrings.checkOut,
                                      date: "17 May, 2026",
                                      time: "${AppStrings.before} 12:00 ${AppStrings.am}"
                                  ),

                                  bookingInfoItem(
                                      title: AppStrings.guestsAndRooms,
                                      date: "1 ${AppStrings.room} , 1 ${AppStrings.adults}",
                                      time: ""
                                  ),

                                ],
                              ),
                            )

                          ],
                        ),
                      ),

                      15.height,

                    ],
                  ),).marginSymmetric(
                      horizontal: 14
                  ),
                ],
              ),
            ),

            /// STICKY TAB
            SliverPersistentHeader(
              pinned: true,
              delegate: TabBarDelegate(
                child: Container(
                  color: AppColors.white,
                  padding:
                  const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),

                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),

                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius:
                      BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                        )
                      ],
                    ),

                    child: ListView.builder(
                      scrollDirection:
                      Axis.horizontal,
                      itemCount:
                      controller.tabList.length,
                      itemBuilder: (context, index) {

                        var data = controller.tabList[index];

                        return Obx(
                              () => InkWell(
                            onTap: () {

                              controller.selectedTab.value = index;
                            },

                            child: Column(
                              children: [

                                Text(
                                  data.toUpperCase(),

                                  style: controller.selectedTab.value == index
                                      ? AppTextStyle.primary12SemiBold
                                      : AppTextStyle.greay12SemiBold,
                                ),

                                if (controller.selectedTab.value == index)

                                  Container(
                                    height: 3,
                                    width: 80,
                                    margin:
                                    const EdgeInsets
                                        .only(
                                        top: 3),
                                    color: AppColors
                                        .primary,
                                  )
                              ],
                            ).marginOnly(
                              right: 15,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ];
        },

        /// BODY CONTENT
        body: Obx(
              () => CustomScrollView(
            slivers: [

              SliverToBoxAdapter(
                child: 10.height,
              ),

              SliverToBoxAdapter(
                child: controller.selectedTab.value == 0
                    ? Column(
                  children: List.generate(
                    controller.availableRoomsList.length,(index) {

                    return hotelRoomCard(
                        context: context,
                        data: controller.availableRoomsList[index]
                    );

                  },),
                )
                    : controller.selectedTab.value == 1
                    ? AboutHotel(desc: controller.propertyData.value.description.toString())
                    : controller.selectedTab.value == 2
                    ? Location()
                    : controller.selectedTab.value == 3
                    ? AmenitiesAndServices(amenitiesSerList: controller.propertyData.value.amenities!.toList())
                    : controller.selectedTab.value == 4
                    ? Policies(policiesData: controller.propertyData.value.policy.toString())
                    : SizedBox(),
              ),

              SliverToBoxAdapter(
                child: 20.height,
              ),

            ],
          ),
        ),
      ),
    ),);
  }

  static Widget imageBox(String image) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CommonChacheImage(Url: image),
      ),
    );
  }

  static Widget circleButton(IconData icon) {
    return Container(
      height: 40,
      width: 40,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        size: 20,
      ),
    );
  }

  Widget bookingInfoItem({
   required String title,
   required String date,
   required String time,
}) {
    return IntrinsicWidth(
      child: Column(
        mainAxisSize: MainAxisSize.min,

        children: [

          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppColors.lightBg,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Icon(
              time==""?Icons.groups_2_outlined:
              Icons.calendar_month_outlined,
              size: 18,
              color: AppColors.primary3,
            ),
          ),

          8.width,

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Text(
                title,
                style: AppTextStyle.greay10Medium,
              ),

              2.height,

              Text(
                date,
                style: AppTextStyle.black12SemiBold,
              ),

              2.height,

              Text(
                time,
                style: AppTextStyle.greay10Medium,
              ),

            ],
          ),

        ],
      ),
    );
  }

  /// ROOM CARD
  Widget hotelRoomCard({
    required BuildContext context,
    required AvailableRoomsList data
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Stack(
          children: [

            CommonChacheImage(
              Url: "${data.imageItems?[0].contentBucketUrl.toString()}",
              imgHeight: 160,
              imgWidht: double.infinity,
              fit: BoxFit.cover
            ),

            Positioned(
              left: 16,
              bottom: 16,
              child: InkWell(
                onTap : () => RoomDetailsDialog.show(context: context,data: data),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [

                      Icon(
                        Icons.photo_library_outlined,
                        size: 12,
                      ),

                      SizedBox(width: 6),

                      Text(
                        "${data.imageItems!.length} ${AppStrings.photos}",
                        style: AppTextStyle.black12Medium
                      )

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),

        /// =========================
        /// ROOM TITLE
        /// =========================

        10.height,

         Text(
          data.name??"",
          style: AppTextStyle.black20Bold,
        ),

        8.height,

        /// =========================
        /// ROOM FEATURES
        /// =========================

        Wrap(
          spacing: 26,
          runSpacing: 14,
          children: [

            featureItem(
              Icons.crop_free,
              "${data.areaSqft} sq.ft.",
            ),

            featureItem(
              Icons.bed_outlined,
              "${data.bedType}",
            ),

            featureItem(
              Icons.group_outlined,
              "${data.minAdults}-${data.maxAdults} Adults",
            ),
          ],
        ),

        const SizedBox(height: 12),

        /// =========================
        /// INFO BOX
        /// =========================

        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10
          ),
          decoration: BoxDecoration(
            color: const Color(0xffF4F7FF),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color(0xffE2E8F0),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                height: 20,
                width: 20,
                decoration: const BoxDecoration(
                  color: Color(0xff2563EB),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.info_outline,
                  color: Colors.white,
                  size: 12,
                ),
              ),

              const SizedBox(width: 10),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "Allocating 1 Room for your group",
                    style: AppTextStyle.black12SemiBold,
                  ),

                  Text(
                    "Based on standard room occupancy limits.",
                    style: AppTextStyle.greay10Regular,
                  ),

                ],
              ),

            ],
          ),
        ),


        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () => RoomDetailsDialog.show(context: context,data: data),
              child: Row(
                children: [

                  Text(
                    AppStrings.viewFullDetails,
                    style: AppTextStyle.primary13SemiBold,
                  ),

                  5.width,

                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 15,
                  )

                ],
              ),
            ),
          ],
        ),


        /// =========================
        /// RATE PLAN TITLE
        /// =========================

        Text(
          AppStrings.selectARatePlan,
          style: AppTextStyle.greay12SemiBold,
        ),

        const SizedBox(height: 8),

        /// =========================
        /// PLAN CARD 1
        /// =========================

        Column(
          children: List.generate(
            data.ratePlans!.length, (i) {

              var plans = data.ratePlans![i];

            return ratePlanCard(
              title: "${plans.name}",
              isCancel: plans.cancellationPolicy!.refundable!,
              mealPlan: "${plans.mealPlan}",
              discount: "17% ${AppStrings.off}",
              oldPrice: "${plans.pricing!.subTotal}",
              newPrice: "${plans.pricing!.subTotal}",
              taxes: "${plans.pricing!.taxAmount} ${AppStrings.taxes}",
              roomId: "${data.id}",
              ratePlanId: "${plans.id}",
              controller: controller
            ).marginOnly(
              bottom: 10
            );

          },),
        ),

        const SizedBox(height: 40),
      ],
    ).paddingSymmetric(
      horizontal: 14
    );
  }

  /// =========================
  /// FEATURE ITEM
  /// =========================

  static Widget featureItem(
      IconData icon,
      String text,
      ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [

        Icon(
          icon,
          size: 16,
          color: Colors.grey,
        ),

        const SizedBox(width: 8),

        Text(
          text,
          style: AppTextStyle.greay12Medium,
        ),

      ],
    );
  }

  /// =========================
  /// RATE PLAN CARD
  /// =========================

  static Widget ratePlanCard({
    required String title,
    required String discount,
    required String oldPrice,
    required String newPrice,
    required String taxes,
    required String mealPlan,
    required bool isCancel,
    required String roomId,
    required String ratePlanId,
    required PropertyDetailsController controller,
    bool bestValue = false,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 13,
        vertical: 10
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color(0xffE5E7EB),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black.withOpacity(.03),
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Flexible(
                child: Text(
                  title,
                  style: AppTextStyle.black15SemiBold,
                ),
              ),

              10.width,

              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5
                ),
                decoration: BoxDecoration(
                  color: AppColors.greenBg,
                  borderRadius: BorderRadius.circular(6)
                ),
                child: Text(
                  discount,
                  style: AppTextStyle.green10Bold,
                ),
              )

            ],
          ),

          5.height,

          Row(
            children: [

              Icon(
                Icons.restaurant_outlined,
                size: 15,
                color: AppColors.grey,
              ),

              5.width,

              Text(
                "${mealPlan}",
                style: AppTextStyle.black14Regular,
              )

            ],
          ),

          5.height,
          isCancel?
          Row(
            children: [

              Icon(
                Icons.check_circle_outline_outlined,
                size: 14,
                color: AppColors.green,
              ),

              5.width,

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  
                  Text(
                    AppStrings.fullyRefundable,
                    style: AppTextStyle.black12SemiBold,
                  ),

                  Text(
                    AppStrings.cancellationPolicyApplies24hBeforeCheckIn,
                    style: AppTextStyle.greay10Regular,
                  )
                  
                ],
              )

            ],
          ):
          Row(
            children: [

              Icon(
                Icons.do_not_disturb_alt_outlined,
                size: 14,
                color: AppColors.red,
              ),

              5.width,

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Text(
                    AppStrings.nonRefundable,
                    style: AppTextStyle.black12SemiBold,
                  ),

                  Text(
                    AppStrings.cancellationPolicyApplies24hBeforeCheckIn,
                    style: AppTextStyle.greay10Regular,
                  )

                ],
              )

            ],
          ),

          10.height,

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Flexible(
                child: Text.rich(
                    TextSpan(
                        text: "",
                        children: [

                          TextSpan(
                            text: "${AppStrings.rupeesText}${oldPrice}",
                            style: AppTextStyle.greay14Medium.copyWith(
                                decoration: TextDecoration.lineThrough
                            ),
                          ),

                          TextSpan(
                            text: "  ${AppStrings.rupeesText}${newPrice}",
                            style: AppTextStyle.black18Bold,
                          ),

                          TextSpan(
                            text: "  +${AppStrings.rupeesText}${taxes} Taxes",
                            style: AppTextStyle.greay12Medium,
                          ),



                        ]
                    )
                ),
              ),

              5.width,

              CommonButton(
                height: 35,
                onTap: () => controller.checkoutNavigate(roomId: "${roomId}", ratePlanId: "${ratePlanId}"),
                text: AppStrings.reserveNow,
                textStyle: AppTextStyle.white12Medium,
                color1: AppColors.secondary,
                color2: AppColors.secondary2,
              )

            ],
          )

        ],
      ),
    );
  }

  Widget AboutHotel({required String desc}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          AppStrings.aboutThisProperty,
          style: AppTextStyle.black16SemiBold,
        ),

        5.height,

        CommonReadMoreWidget(
          text: "${desc}",
          textStyle: AppTextStyle.black12Light,
        )

      ],
    ).marginSymmetric(
      horizontal: 15
    );
  }

  Widget Location(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          AppStrings.propertyLocation,
          style: AppTextStyle.black16SemiBold,
        ),

        5.height,

        Image.network(
          "https://i.sstatic.net/HILmr.png" ,
          width: double.infinity,
          height: 200,
        ),

        5.height,

        Container(
          padding: EdgeInsets.symmetric(
            vertical: 3,
            horizontal:10
          ),
          decoration: BoxDecoration(
            color: AppColors.blue1.withOpacity(
              0.1
            ),
            borderRadius: BorderRadius.circular(
              10
            )
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min, // important
            children: [

              CircleAvatar(
                backgroundColor: AppColors.blue1,
                radius: 2.5,
              ),

              4.width,

              Text(
                AppStrings.location.toUpperCase(),
                style: AppTextStyle.black9Bold.copyWith(
                  color: AppColors.blue1
                ),
              )

            ],
          ),
        ),

        10.height,

        Text(
          AppStrings.addressDetails.toUpperCase(),
          style: AppTextStyle.greay11SemiBold,
        ),

        5.height,

        Text(
          "81, Malviya Nagar, beside SBI Panchanan Bhawan, Roshanpura, Malviya Nagar, Bhopal, Madhya Pradesh, India - 462008",
          style: AppTextStyle.black13SemiBold,
        ),

        20.height,

        Container(
          padding: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 8
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(
              10
            ),
            border: Border.all(
              color: AppColors.grey,
              width: 0.2
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.greyLight,
                offset: Offset(1, 1),
                spreadRadius: 2,
                blurRadius: 2
              )
            ]
          ),
          child: Row(
            children: [

              CircleAvatar(
                radius: 15,
                backgroundColor: AppColors.greenBg,
                child: Icon(
                  Icons.done,
                  color: AppColors.green,
                  size: 15,
                ),
              ),

              10.width,

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    AppStrings.coordinatesVerified,
                    style: AppTextStyle.black10SemiBold,
                  ),

                  Text(
                    "23.236410, 77.401710",
                    style: AppTextStyle.greay8Regular,
                  )

                ],
              )

            ],
          ),
        ),

        30.height,

        CommonButton(
          height: 40,
          onTap: () {},
          text: "${AppStrings.getDirections} ➶",
        )


      ],
    ).marginSymmetric(
        horizontal: 15
    );
  }

  Widget AmenitiesAndServices(
  {
    required List amenitiesSerList}
      ){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          AppStrings.amenitiesServices,
          style: AppTextStyle.black16SemiBold,
        ),

        10.height,

        Column(
          children: List.generate(
            amenitiesSerList.length,
                (i) {

              var amenitiesData = amenitiesSerList[i];

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                CircleAvatar(
                  radius: 12,
                  backgroundColor: AppColors.greyLight,
                  child: Icon(
                    Icons.done,
                    color: AppColors.green,
                    size: 12,
                  ),
                ),

                10.width,

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      "${amenitiesData['amenity_name']??""}",
                      style: AppTextStyle.black12SemiBold,
                    ),

                    5.height,

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: ((amenitiesData['selections'] ?? {}) as Map<String, dynamic>).entries.map(
                            (e) => SizedBox(
                              width: Get.width*0.82,
                              child: Text.rich(
                                TextSpan(
                              text: "${e.key.toUpperCase()} : ",
                              style: AppTextStyle.greay10Medium,
                              children: [
                                TextSpan(
                                  text: e.value.toString(),
                                  style: AppTextStyle.black10Medium,
                                ),
                              ],
                                ),
                              ),
                            ),
                      )
                          .toList(),
                    )


                  ],
                )


              ],
            ).marginOnly(
              bottom: 15
            );

          },),
        )

      ],
    ).marginSymmetric(
        horizontal: 15
    );
  }

  Widget Policies({required String policiesData}){

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColors.greyLight,
          width: .6,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Heading
          Text(
            "Property Policies",
            style: AppTextStyle.black16SemiBold,
          ),

          15.height,

          /// Check In / Check Out
          Row(
            children: [

              Expanded(
                child: policyTimeCard(
                  icon: Icons.login,
                  title: "Check-In",
                  value: "12:00 PM",
                ),
              ),

              10.width,

              Expanded(
                child: policyTimeCard(
                  icon: Icons.logout,
                  title: "Check-Out",
                  value: "11:00 AM",
                ),
              ),

            ],
          ),

          15.height,

          Divider(),

          15.height,

          /// Dynamic Policies

          Html(
            data: policiesData,
          )

        ],
      ),
    );
  }

  Widget policyTimeCard({
    required IconData icon,
    required String title,
    required String value,
  }) {

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.lightBg,
        borderRadius: BorderRadius.circular(10),
      ),

      child: Row(
        children: [

          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius:
              BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              size: 18,
              color: AppColors.primary,
            ),
          ),

          8.width,

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                title,
                style:
                AppTextStyle.greay10Regular,
              ),

              Text(
                value,
                style:
                AppTextStyle.black12Bold,
              ),

            ],
          )
        ],
      ),
    );
  }

}



class TabBarDelegate
    extends SliverPersistentHeaderDelegate {

  final Widget child;

  TabBarDelegate({
    required this.child,
  });

  @override
  double get minExtent => 50;

  @override
  double get maxExtent => 50;

  @override
  Widget build(
      BuildContext context,
      double shrinkOffset,
      bool overlapsContent,
      ) {
    return child;
  }

  @override
  bool shouldRebuild(
      covariant SliverPersistentHeaderDelegate
      oldDelegate,
      ) {
    return false;
  }
}