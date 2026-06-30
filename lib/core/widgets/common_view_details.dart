import 'package:flutter/material.dart';
import 'package:soonstays/app/modules/contact_us/views/contact_us_view.dart';
import 'package:soonstays/core/constants/app_colors.dart';
import 'package:soonstays/core/constants/app_strings.dart';
import 'package:soonstays/core/constants/app_text_styles.dart';
import 'package:get/get.dart';
import 'package:soonstays/core/utils/gallery_zoom_slides.dart';
import '../../app/data/model/property_details/available_rooms_model.dart';
import '../constants/app_size.dart';
import 'image_cache_network.dart';

class RoomDetailsDialog {

  static Future<void> show({

    required BuildContext context,
    required AvailableRoomsList data,


  }) async {


    await showGeneralDialog(

      context: context,

      barrierDismissible: true,

      barrierLabel: "",

      barrierColor: Colors.white,

      transitionDuration:
      const Duration(milliseconds: 250),

      pageBuilder: (
          context,
          animation,
          secondaryAnimation,
          ) {

        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [

                      Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children:  [

                          Text(
                            "${data.name}",
                            style: AppTextStyle.black20Bold,
                          ),

                          Row(
                            children: [

                              CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: 3,
                              ),

                              5.width,

                              Text(
                                AppStrings.premiumSelection,
                                style: AppTextStyle.greay10Medium,
                              ),
                            ],
                          ),

                        ],
                      ),

                      IconButton(
                        onPressed: () => Get.back(),
                        icon:  Icon(
                          Icons.close,
                          color: AppColors.grey,
                        ),
                      ),

                    ],
                  ),
                ),

                const Divider(),

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [

                        InkWell(
                          onTap: () => GalleryZoomSlides(imageList: data.imageItems?.map((e) => e.contentBucketUrl.toString(),).toList()),
                          child: CommonChacheImage(
                              Url: "${data.imageItems?[0].contentBucketUrl.toString()}",
                              imgHeight: 250,
                              imgWidht: double.infinity,
                              fit: BoxFit.cover
                          ),
                        ),

                        const SizedBox(height: 20),

                        GridView.count(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 5/2.1,
                          children: [

                            ///Area
                            newBox(
                                iconData: Icons.open_in_full_rounded,
                                value: data.areaSqft.toString(),
                                title: AppStrings.area
                            ),

                            ///Bedding
                            newBox(
                                iconData: Icons.bed_outlined,
                                value: '${data.bedType.toString()}',
                                title: AppStrings.bedding
                            ),

                            ///Max Adults
                            newBox(
                                iconData: Icons.groups_2_outlined,
                                value: data.maxAdults.toString(),
                                title: AppStrings.maxAdults
                            ),

                            ///Max Occupancy
                            newBox(
                                iconData: Icons.groups_2_outlined,
                                value: '${data.maxOccupancy.toString()}',
                                title: AppStrings.maxOccupancy
                            ),


                          ],
                        ),

                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        );
      },

      transitionBuilder:
          (
          context,
          animation,
          secondaryAnimation,
          child,
          ) {

        return SlideTransition(

          position: Tween<Offset>(

            begin: const Offset(0, 1),

            end: Offset.zero,

          ).animate(

            CurvedAnimation(

              parent: animation,

              curve: Curves.easeInOut,
            ),
          ),

          child: child,
        );
      },
    );
  }

}

Widget newBox({
  required IconData iconData,
  required String title,
  required String value,
}){

  return Container(
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
      border: Border.all(
          color: AppColors.grey,
          width: 0.3
      ),
      color: AppColors.greyLight.withOpacity(0.3),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(
                  color: AppColors.greyLight
              ),
              borderRadius: BorderRadius.circular(
                  8
              )
          ),
          child: Icon(
            iconData,
            color: AppColors.grey,
            size: 16,
          ),
        ),

        10.width,

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                title.toUpperCase(),
                style: AppTextStyle.greay10Medium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

              Text(
                value,
                style: AppTextStyle.black13SemiBold,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )

            ],
          ),
        )

      ],
    ),
  );

}