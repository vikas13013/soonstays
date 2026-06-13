import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soonstays/common/screens/property_filter_screen.dart';
import 'package:soonstays/core/constants/app_strings.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/widgets/common_appbar.dart';
import '../controllers/faq_controller.dart';

class FaqView extends GetView<FaqController> {
  const FaqView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: CommonAppBar(
          title: AppStrings.faq,
          isActionTrue: true
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              10.height,

              /// HEADER
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: 10
                ),
                padding: EdgeInsets.all(20),
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
                            AppStrings.frequentlyAskedQuestions,
                            style: AppTextStyle.white20Bold,
                          ),

                        ],
                      ),
                    ),

                    Image.asset(
                      AppAssets.faqImg,
                      height: 100,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.faqList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {

                  var data = controller.faqList[index];

                  return CommonFaqExpanded(
                      title: data['title'].toString(),
                      subTitle: data['sub_title'].toString(),
                    subTitle2: data['sub_title2'].toString(),
                    children: data['faq'],
                  );

                },
              )

            ],
          ),
        ),
      ),
    );
  }
}

Widget CommonFaqExpanded({
  required String title,
  required String subTitle,
  required String subTitle2,
  required List<dynamic> children
}) {

  final isExpanded = false.obs;

  return Container(
    margin: EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 5
    ),
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
       expandedCrossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            subTitle==""?SizedBox():
            Text(
              "${subTitle}",
              style: AppTextStyle.black13Regular,
            ).marginOnly(
                bottom: 10
            ),

            children.isEmpty?SizedBox():
            Column(
              children: List.generate(children.length, (index) {

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Icon(
                      Icons.circle,
                      color: AppColors.grey,
                      size: 8,
                    ).marginOnly(
                        top: 6
                    ),

                    5.width,

                    Flexible(
                      child: Text(
                        "${children[index]}",
                        style: AppTextStyle.black13Regular,
                      ),
                    ),

                  ],
                ).marginOnly(
                    bottom: 10
                );

              },),
            ),

            subTitle2==""?SizedBox():
            Text(
              "${subTitle2}",
              style: AppTextStyle.black13Regular,
            ).marginOnly(
                bottom: 10
            ),

          ],
        ).marginOnly(
          left: 10
        )

      ],
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
