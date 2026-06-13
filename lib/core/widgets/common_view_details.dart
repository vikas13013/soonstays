import 'package:flutter/material.dart';
import 'package:soonstays/core/constants/app_colors.dart';
import 'package:soonstays/core/constants/app_text_styles.dart';
import 'package:get/get.dart';
import 'package:soonstays/core/utils/gallery_zoom_slides.dart';

import '../constants/app_size.dart';

class RoomDetailsDialog {

  static Future<void> show({

    required BuildContext context,


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
                            "Family Room",
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
                                "PREMIUM SELECTION",
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
                          onTap: () => GalleryZoomSlides(imageList: []),
                          child: ClipRRect(
                            borderRadius:
                            BorderRadius.circular(16),
                            child: Image.network(
                              "https://kehu.s3.amazonaws.com/property/025d7e77-5b8c-45cd-adcf-65107a029232/IMAGE/1776626878609-550638629%20(1).jpg",
                              height: 250,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        GridView.builder(
                          shrinkWrap: true,
                          physics:
                          NeverScrollableScrollPhysics(),
                          itemCount: 4,
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 5/2,
                          ),
                          itemBuilder: (_, i) {

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
                                      Icons.groups_2_outlined,
                                      color: AppColors.grey,
                                      size: 18,
                                    ),
                                  ),

                                  10.width,

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      Text(
                                        "AREA",
                                        style: AppTextStyle.greay10Medium,
                                      ),

                                      Text(
                                        "180 sqft",
                                        style: AppTextStyle.black14SemiBold,
                                      )

                                    ],
                                  )

                                ],
                              ),
                            );
                          },
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