import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:soonstays/core/constants/app_colors.dart';
import 'package:soonstays/core/constants/app_size.dart';
import 'package:soonstays/core/constants/app_strings.dart';
import 'package:soonstays/core/constants/app_text_styles.dart';
import 'package:soonstays/core/widgets/common_appbar.dart';
import 'package:soonstays/core/widgets/common_buttons.dart';
import '../controllers/property_filter_controller.dart';
import '../models/property_filter_model.dart';
import 'package:get/get.dart';

class PropertyFilter {

  static show({
    required BuildContext context,
    required Function(FilterModel model) onApply,
  }) {

    final controller = Get.put(FilterController(),
    );

    showGeneralDialog(

      context: context,

      barrierDismissible: true,

      barrierLabel: "Filter",

      pageBuilder: (
          context,
          animation,
          secondaryAnimation,
          ) {
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
            backgroundColor: AppColors.primary,
            leadingWidth: 100,
            leading: Center(
              child: Text(
                AppStrings.filters,
                style: AppTextStyle.white20Medium,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.only(
                bottomRight: Radius.circular(40),
                bottomLeft: Radius.circular(40)
              )
            ),
            actions: [

              IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.close,
                  color: AppColors.white,
                ),
              )

            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15)
                  )
              ),
              child: Column(

                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  10.height,

                  /// PRICE
                  CommonExpanded(
                      icons: Icons.currency_rupee_rounded,
                      title: AppStrings.pricePerNight,
                      children: [

                        Column(
                          children: controller.priceList.map((item) {

                            final value = item["value"]!;

                            final display = item["display"]!;

                            return Obx(() {
                              bool selected = controller.selectedPrice.contains(value);
                              return CheckboxListTile(
                                value: selected,
                                minVerticalPadding: 0,
                                checkboxShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.all(Radius.circular(5))
                                ),
                                contentPadding: EdgeInsets.zero,
                                visualDensity: const VisualDensity(
                                  horizontal: -4,
                                  vertical: -4,
                                ),
                                activeColor: AppColors.primary, // selected bg
                                checkColor: Colors.white, // tick color
                                side: BorderSide(
                                  color: selected
                                      ? AppColors.primary
                                      : AppColors.grey,
                                  width: 1.2,
                                ),
                                controlAffinity: ListTileControlAffinity.leading,
                                title: Text("${display}",style: AppTextStyle.black13Regular,),
                                onChanged: (_) {

                                  if(selected){
                                    controller.selectedPrice.remove(
                                      value,
                                    );
                                  }else{
                                    controller.selectedPrice.add(
                                      value,
                                    );
                                  }
                                },
                              );
                            });

                          }).toList(),
                        )

                      ]
                  ),

                  const SizedBox(height: 20),

                  /// TAGS

                  CommonExpanded(
                      icons: Icons.sell_outlined,
                      title: AppStrings.popularTags,
                      children: [

                        Column(
                          children: controller.tagList.map((item) {

                            return Obx(() {
                              bool selected = controller.selectedTags.contains(item);
                              return CheckboxListTile(
                                value: selected,
                                minVerticalPadding: 0,
                                checkboxShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.all(Radius.circular(5))
                                ),
                                contentPadding: EdgeInsets.zero,
                                visualDensity: const VisualDensity(
                                  horizontal: -4,
                                  vertical: -4,
                                ),
                                activeColor: AppColors.primary, // selected bg
                                checkColor: Colors.white, // tick color
                                side: BorderSide(
                                  color: selected
                                      ? AppColors.primary
                                      : AppColors.grey,
                                  width: 1.2,
                                ),
                                controlAffinity: ListTileControlAffinity.leading,
                                title: Text(item,style: AppTextStyle.black13Regular,),
                                onChanged: (_) {

                                  if(selected){
                                    controller.selectedTags.remove(item);
                                  } else {
                                    controller.selectedTags.add(item);
                                  }

                                },
                              );
                            });

                          }).toList(),
                        )

                      ]
                  ),


                  const SizedBox(height: 20),

                  /// STAR

                  CommonExpanded(
                      icons: Icons.hotel_class_rounded,
                      title: AppStrings.starCategory,
                      children: [

                        Column(
                          children: controller.starList.map((star) {

                            return Obx(() {

                              bool selected = controller.selectedStars.contains(star);

                              return CheckboxListTile(
                                value: selected,
                                minVerticalPadding: 0,
                                checkboxShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.all(Radius.circular(5))
                                ),
                                contentPadding: EdgeInsets.zero,
                                visualDensity: const VisualDensity(
                                  horizontal: -4,
                                  vertical: -4,
                                ),
                                activeColor: AppColors.primary, // selected bg
                                checkColor: Colors.white, // tick color
                                side: BorderSide(
                                  color: selected
                                      ? AppColors.primary
                                      : AppColors.grey,
                                  width: 1.2,
                                ),
                                controlAffinity: ListTileControlAffinity.leading,
                                title: Row(
                                  children: List.generate(
                                    int.parse(star),
                                        (_) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 18,
                                    ),
                                  ),
                                ),
                                onChanged: (_) {

                                  if(selected){
                                    controller.selectedStars.remove(star);
                                  } else {
                                    controller.selectedStars.add(star);
                                  }

                                },
                              );
                            });

                          }).toList(),
                        ),

                      ]
                  ),


                  const SizedBox(height: 20),

                  CommonExpanded(
                      icons: Icons.thumb_up_alt_outlined,
                      title: AppStrings.userRating,
                      children: [

                        Column(
                          children: controller.ratingList.map((item) {

                            final value = item["value"]!;

                            final display = item["display"]!;

                            return ratingTile(
                              "${value}",
                              "${display}",
                              controller,
                            );

                          },).toList(),
                        ),

                      ]
                  ),

                  const SizedBox(height: 100),

                ],
              ),
            ),
          ),
          bottomSheet: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: AppColors.white
            ),
            child: CommonButton(
              onTap: () {

                onApply(
                  FilterModel(
                      price: controller.selectedPrice.toList(),
                      stars: controller.selectedStars.toList(),
                      tags: controller.selectedTags.toList(),
                      userRating: controller.selectedRatings.toList()
                  )
                );

                Get.back();

              },
              text: AppStrings.applyFilters,
              textStyle: AppTextStyle.white16Medium,
            ),
          ),
        );
      },
    );
  }

}


Widget CommonExpanded({
  required String title,
  required IconData icons,
  required List<Widget> children
}) {

  final isExpanded = true.obs;

  return Container(
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(10),
      border: BoxBorder.all(
        color: AppColors.greyLight
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.03),
          blurRadius: 10,
          spreadRadius: 2,
          offset: Offset(0, 8),
        ),
      ],
    ),
    child: ExpansionTile(
      backgroundColor: AppColors.white,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: AppColors.lightBg,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Center(
              child: Icon(
                icons,
                color: AppColors.primary,
                size: 18,
              ),
            ),
          ).marginOnly(
              right: 10
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: AppTextStyle.black15SemiBold,
                ),

              ],
            ),
          ),

        ],
      ),
      onExpansionChanged: (value){
        isExpanded.value = value;
        print("DDD${value}");
      },
      initiallyExpanded: isExpanded.value,
      trailing: Obx(() => Icon(
        isExpanded.value?
        Icons.keyboard_arrow_down_outlined:Icons.chevron_right,
        size: 25,
        color: AppColors.grey,
      ),),
      children: children,
      tilePadding: const EdgeInsets.only(
        left: 15,
        right: 5, // yaha control karo
      ),
      dense: true,
      visualDensity: const VisualDensity(
        horizontal: -4,
        vertical: -4,
      ),
      childrenPadding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: AppColors.white
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      collapsedShape: RoundedRectangleBorder(
        side: BorderSide(
            color: AppColors.white
        ),
        borderRadius: BorderRadius.circular(15),
      ),
    ),
  );

}

Widget ratingTile(
    String value,
    String title,
    FilterController controller,
    ) {

  return Obx(() {

    bool selected = controller.selectedRatings.contains(value);

    return CheckboxListTile(
      value: selected,
      minVerticalPadding: 0,
      checkboxShape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.all(Radius.circular(5))
      ),
      contentPadding: EdgeInsets.zero,
      visualDensity: const VisualDensity(
        horizontal: -4,
        vertical: -4,
      ),
      activeColor: AppColors.primary, // selected bg
      checkColor: Colors.white, // tick color
      side: BorderSide(
        color: selected
            ? AppColors.primary
            : AppColors.grey,
        width: 1.2,
      ),
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(
        title,
        style: AppTextStyle.black13Regular,
      ),
      onChanged: (_) {

        if(selected){

          controller.selectedRatings.remove(value);

        }else{

          controller.selectedRatings.add(value);

        }

      },
    );
  });
}