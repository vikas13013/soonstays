import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonstays/common/screens/property_filter_screen.dart';
import 'package:soonstays/core/arguments/property_details_arguments.dart';
import 'package:soonstays/core/constants/app_colors.dart';
import 'package:soonstays/core/constants/app_size.dart';
import 'package:soonstays/core/constants/app_strings.dart';
import 'package:soonstays/core/constants/app_text_styles.dart';
import 'package:soonstays/core/utils/common_launcher.dart';
import 'package:soonstays/core/widgets/common_appbar.dart';
import 'package:soonstays/core/widgets/common_buttons.dart';
import 'package:soonstays/core/widgets/common_rating_idicator.dart';
import 'package:soonstays/core/widgets/empty_box.dart';
import 'package:soonstays/core/widgets/image_cache_network.dart';
import '../../../../core/widgets/common_shimmer.dart';
import '../../../../core/widgets/common_text_field.dart';
import '../../../routes/app_pages.dart';
import '../../search/view/search_view.dart';
import '../controllers/property_list_controller.dart';

class PropertyListView extends GetView<PropertyListController> {
  const PropertyListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PropertyAppBar(
        columnWidget: Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              "${controller.cityNameController.value}",
              style: AppTextStyle.white16SemiBold,
            ),

            Text(
              "${controller.displayCheckInDate.value} - ${controller.displayCheckOutDate.value}, ${controller.argumentData.value.totalAdults} ${AppStrings.adults} , ${controller.argumentData.value.totalChildren} ${AppStrings.children}",
              maxLines: 2,
              style: AppTextStyle.white10Medium,
            )
          ],
        ),),
        ontap: () => controller.searchDialog(),
      ),
      body: Column(
        children: [

          Row(
            children: [

              Flexible(
                child: CommonSearchBar(
                    controller: TextEditingController()
                ),
              ),

              InkWell(
                onTap: () {

                  PropertyFilter.show(
                    context: context,
                    onApply: (filter) {

                      controller.filterData.value = filter.toJson();

                      controller.getPropertyData(
                          cityName: controller.cityNameController.value,
                          data: controller.argumentData.value
                      );

                      log("filter : ${filter.toJson()}");

                    },
                  );

                },
                child: Container(
                  margin: EdgeInsets.only(
                    left: 10
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primary,
                        AppColors.primary2,
                        AppColors.primary3,

                      ]
                    )
                  ),
                  child: Row(
                    children: [

                      Text(
                        AppStrings.filters,
                        style: AppTextStyle.white12Medium,
                      ),

                      3.width,

                      Icon(
                        Icons.swap_horiz,
                        color: AppColors.white,
                        size: 15,
                      )

                    ],
                  ),
                ),
              )

            ],
          ),


          Expanded(
            child:Obx(() {

              /// First Time Loading
              if (controller.isLoading.value && controller.propertyList.isEmpty) {

                return ListView.builder(
                  itemCount: 10,
                  itemBuilder: (_, __) => SearchPropertyShimmer(),
                );

              }else if(controller.propertyList.isEmpty) {


               return EmptyPropertyView(
                  onTap: controller.searchDialog,
                );

              }

              return RefreshIndicator(
                backgroundColor: AppColors.white,
                color: AppColors.primary,
                strokeWidth: 2,
                onRefresh: controller.refreshProperties,
                child:
                ListView.builder(
                  controller: controller.scrollController,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  itemCount: controller.propertyList.length +
                      (controller.isPaginationLoading.value ? 1 : 0),
                  itemBuilder: (context, index) {

                    /// Pagination Loader
                    if (index == controller.propertyList.length) {

                      return const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }

                    final data = controller.propertyList[index];

                    return Container(
                      margin: EdgeInsets.only(
                          bottom: 10
                      ),
                      padding: EdgeInsets.all(
                          10
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(
                            15
                        ),
                        border: BoxBorder.all(
                          color: AppColors.greyLight,
                        ),
                      ),
                      child: Column(
                        children: [

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              CommonChacheImage(
                                  imgHeight: 110,
                                  imgWidht: Get.width*0.31,
                                  Url: "${data.mediaAssets![0].contentBucketUrl}"
                              ),

                              10.width,

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text(
                                      "${data.displayName??""}",
                                      style: AppTextStyle.primary14SemiBold,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),

                                    Row(
                                      children: [

                                        Icon(
                                          Icons.location_on_outlined,
                                          size: 12,
                                          color: AppColors.greyDark,
                                        ),

                                        Flexible(
                                          child: Text(
                                            "${data.fullAddress??""}",
                                            style: AppTextStyle.greyDark10Regular,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),

                                        InkWell(
                                          onTap: () => CommonLauncher.openMap(latitude: data.latitude!.toDouble(), longitude: data.longitude!.toDouble()),
                                          child: Text(
                                            "${AppStrings.showOnMap}",
                                            style: AppTextStyle.black9Medium.copyWith(
                                                color: Colors.blueAccent
                                            ),
                                          ),
                                        )

                                      ],
                                    ),

                                    5.height,

                                    data.tags!.isEmpty?
                                    SizedBox():
                                    Wrap(
                                      children: [

                                        box(
                                            text: "${data.tags![0]}"
                                        ),

                                        5.width,

                                        data.tags!.length>1?
                                        InkWell(
                                            onTap: () {

                                              Get.dialog(
                                                  Dialog(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadiusGeometry.all(
                                                            Radius.circular(10)
                                                        )
                                                    ),
                                                    insetPadding: EdgeInsets.symmetric(
                                                        vertical: 10,
                                                        horizontal: 20
                                                    ),
                                                    backgroundColor: AppColors.white,
                                                    child: ListView(
                                                      padding: EdgeInsets.symmetric(
                                                          horizontal: 15,
                                                          vertical: 15
                                                      ),
                                                      shrinkWrap: true,
                                                      children: [

                                                        Wrap(
                                                          runSpacing: 5,
                                                          spacing: 5,
                                                          children: List.generate(data.tags!.length,(i) {
                                                            return Container(
                                                              padding: EdgeInsets.all(5),
                                                              decoration: BoxDecoration(
                                                                  color: AppColors.lightBg,
                                                                  borderRadius: BorderRadius.circular(5)
                                                              ),
                                                              child: Text(
                                                                "${data.tags![i]}",
                                                                style: AppTextStyle.primary10Medium,
                                                              ),
                                                            );
                                                          },),
                                                        ),

                                                      ],
                                                    ),
                                                  )
                                              );

                                            },
                                            child: box(text: "+${data.tags!.length-1} ${AppStrings.more}")):SizedBox(),

                                      ],
                                    ),

                                    5.height,

                                    data.cancellationPolicy!.refundable==false?
                                    newBox(
                                        text: AppStrings.nonRefundable,
                                        icons: Icons.info_outline_rounded
                                    ):
                                    newBox(
                                        text: AppStrings.freeCancellation,
                                        textStyle: AppTextStyle.green10Medium,
                                        icons: Icons.done,
                                        iconColor: AppColors.green
                                    ),

                                    5.height,

                                    Row(
                                      children: [

                                        Icon(
                                          Icons.bakery_dining_outlined,
                                          color: AppColors.grey,
                                          size: 14,
                                        ),

                                        5.width,

                                        Text(
                                          '1 ${AppStrings.nights}, ${controller.searchCriteria.value.occupancy!.totalAdults} ${AppStrings.adults}',
                                          style: AppTextStyle.greay10Regular,
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                              ),

                            ],
                          ),

                          10.height,

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              /// Rating Section
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    CommonRatingIdicator(
                                      rating: double.tryParse(data.rating.toString()),
                                    ),

                                    5.height,

                                    Text(
                                      "100+ ${AppStrings.reviews}",
                                      style: AppTextStyle.greay10Regular,
                                    )

                                  ],
                                ),
                              ),

                              /// Price Section
                              Expanded(
                                flex: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [

                                    Wrap(
                                      crossAxisAlignment: WrapCrossAlignment.center,
                                      spacing: 5,
                                      children: [

                                        Text(
                                          "${AppStrings.rupeesText}${data.totalPrice}/-",
                                          style: AppTextStyle.black16Bold,
                                        ),

                                        Text(
                                          "${AppStrings.rupeesText}5125",
                                          style: AppTextStyle.greay13Regular.copyWith(
                                            decoration: TextDecoration.lineThrough,
                                          ),
                                        ),

                                      ],
                                    ),

                                    Text(
                                      "+ ${AppStrings.rupeesText}${data.taxAmount} ${AppStrings.taxes}",
                                      style: AppTextStyle.greay10Regular,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),

                                  ],
                                ),
                              ),

                              10.width,

                              /// Button Section
                              Flexible(
                                flex: 3,
                                child: SizedBox(
                                  height: 35,
                                  child: CommonButton2(
                                    onTap: () => Get.toNamed(
                                        Routes.PROPERTY_DETAILS,
                                        arguments: PropertyDetailsArgument(
                                          searchCriteria: controller.argumentData.value,
                                          propertiesData: data
                                        )
                                    ),
                                    text: AppStrings.viewDeal,
                                    textStyle: AppTextStyle.white10Medium,
                                    startColor: AppColors.primary,
                                    endColor: AppColors.primary3,
                                  ),
                                ),
                              ),
                            ],
                          )

                        ],
                      ),
                    );
                  },
                ),
              );
            })
          ),

        ],
      ).marginSymmetric(
        horizontal: 10,
        vertical: 10
      ),
    );
  }
}


Widget box({required String text}){
  return Container(
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
        color: AppColors.lightBg,
        borderRadius: BorderRadius.circular(5)
    ),
    child: Text(
      "${text}",
      style: AppTextStyle.primary10Medium,
    ),
  );
}

Widget newBox({
  required String text,
  TextStyle?textStyle,
  required IconData icons,
  Color?iconColor,
}){
  return Row(
    children: [
      Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: AppColors.lightBg,
            borderRadius: BorderRadius.circular(5)
        ),
        child: Row(
          children: [

            Icon(
              icons,
              size: 10,
              color: iconColor??AppColors.primary,
            ),

            5.width,

            Text(
              text,
              style: textStyle??AppTextStyle.primary10Medium,
            ),
          ],
        ),
      ),
    ],
  );
}