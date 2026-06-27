import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soonstays/core/constants/app_colors.dart';
import 'package:soonstays/core/constants/app_strings.dart';
import 'package:soonstays/core/constants/app_text_styles.dart';
import 'package:soonstays/core/widgets/image_cache_network.dart';

import '../../../../core/utils/gallery_zoom_slides.dart';
import '../controllers/properties_images_controller.dart';

class PropertiesImagesView extends GetView<PropertiesImagesController> {
  const PropertiesImagesView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          AppStrings.propertyPhotos,
          style: AppTextStyle.black18Medium,
        ),
        actions: [

          IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.close),
          )

        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Obx(
                () => TabBar(
              controller: controller.tabController,
              padding: EdgeInsets.symmetric(
                horizontal: 8
              ),
              isScrollable: true,
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              tabAlignment: TabAlignment.start,
              splashFactory: NoSplash.splashFactory,
              labelPadding: const EdgeInsets.symmetric(horizontal: 5),

              onTap: (index) {
                controller.selectedIndex.value = index;
              },

              tabs: List.generate(
                controller.tabs.length,
                    (index) {

                  final isSelected =
                      controller.selectedIndex.value == index;

                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 250),

                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 10,
                    ),

                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primary
                          : Colors.white,

                      borderRadius: BorderRadius.circular(22),

                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                    ),

                    child: Text(
                      controller.tabs[index],

                      style: TextStyle(
                        color: isSelected
                            ? Colors.white
                            : Colors.black87,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),

      body: TabBarView(
        controller: controller.tabController,

        children: controller.tabs.map((tab) {

          final images = controller.getImages(tab);

          return GridView.builder(
            padding: const EdgeInsets.all(15),

            itemCount: images.length,

            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: .85,
            ),

            itemBuilder: (_, index) {

              return InkWell(
                onTap: () {
                  GalleryZoomSlides(imageList: images.map<String>((e) => e["content_bucket_url"].toString(),).toList(),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CommonChacheImage(
                    fit: BoxFit.cover,
                    Url: images[index]["content_bucket_url"],
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
