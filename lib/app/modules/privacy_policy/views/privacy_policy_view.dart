import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/widgets/common_appbar.dart';
import '../controllers/privacy_policy_controller.dart';

class PrivacyPolicyView extends GetView<PrivacyPolicyController> {
  const PrivacyPolicyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F8FC),
      appBar: CommonAppBar(
          title: AppStrings.privacyPolicy,
          isActionTrue: true
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: 15
            ),
            child: Column(
              children: [

                const _HeaderSection(),

                20.height,

                ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.sections.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {

                    var data = controller.sections[index];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          "${data['title']}",
                          style: AppTextStyle.black16SemiBold,
                        ),

                        5.height,

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            data['content'].length, (i) {

                              var content = data['content'][i];

                              return Text(
                                "$content",
                                style: AppTextStyle.greay13Regular,
                              );

                          },),
                        ),

                      ],
                    ).marginOnly(
                      bottom: 10
                    );

                  },
                )

              ],
            ),
          ),
        ),
      ),
    );
  }

}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: 15
      ),
      padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30
      ),
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
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
        children: [

          Expanded(
            child: Text(
              "${AppStrings.adhHospitalityPvtLtd} - ${AppStrings.soonStays.toUpperCase()}",
              style: AppTextStyle.white18Bold,
            ),
          ),

          Image.asset(
            AppAssets.legalPolicy,
            height: 80,
          ),

        ],
      ),
    );
  }
}
