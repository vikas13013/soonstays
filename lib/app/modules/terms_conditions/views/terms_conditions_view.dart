import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonstays/core/constants/app_assets.dart';
import 'package:soonstays/core/constants/app_colors.dart';
import 'package:soonstays/core/constants/app_size.dart';
import 'package:soonstays/core/constants/app_text_styles.dart';
import 'package:soonstays/core/widgets/common_appbar.dart';
import '../controllers/terms_conditions_controller.dart';

class TermsConditionsView extends GetView<TermsConditionsController> {
  const TermsConditionsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
          title: "Terms & Conditions",
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
                            "Clear rules.",
                            style: AppTextStyle.white20Bold,
                          ),

                          Text(
                            "Better experience.",
                            style: AppTextStyle.secondary20Bold,
                          ),

                          SizedBox(height: 12),

                          Text(
                            "Please read these terms carefully before using SoonStays.",
                            style: AppTextStyle.white12Regular,
                          ),
                        ],
                      ),
                    ),

                    Image.asset(
                      "${AppAssets.termsConditionsBg}",
                      height: 100,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              /// COMPANY CARD
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 15,
                    )
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: AppColors.lightBg,
                        borderRadius:
                        BorderRadius.circular(16),
                      ),
                      child: const Icon(
                        Icons.business,
                        color: AppColors.blue,
                      ),
                    ),

                    const SizedBox(width: 15),

                    const Expanded(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [

                          Text(
                            "ADH Hospitality Pvt Ltd - SoonStays",
                            style: AppTextStyle.primary16SemiBold,
                          ),

                          SizedBox(height: 8),

                          Text(
                            "Brand : SoonStays",
                            style: AppTextStyle.black13Regular,
                          ),

                          Text(
                            "Website : www.soonstays.com",
                            style: AppTextStyle.black13Regular,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              /// CONTENT CARD
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.circular(22),
                ),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [

                    Row(
                      children: [

                        Container(
                          height: 34,
                          width: 34,
                          decoration: BoxDecoration(
                            color: AppColors.blue,
                            borderRadius:
                            BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              "1",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 12),

                        const Text(
                          "Introduction",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "These Terms of Use (“Terms”) govern access to and use of the SoonStays platform operated by ADH Hospitality Pvt Ltd (“SoonStays”, “Company”, “we”, “us”, or “our”). By accessing or using the website, mobile application, or related services (“Platform”), you agree to be legally bound by these Terms, our Privacy Policy, Cancellation & Refund Policy, and any additional guidelines posted on the Platform.",
                      style: TextStyle(
                        height: 1.7,
                      ),
                    ),
                  ],
                ),
              ),

              15.height,

              Container(
                margin:
                const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.circular(22),
                ),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [

                    Row(
                      children: [

                        Container(
                          height: 34,
                          width: 34,
                          decoration: BoxDecoration(
                            color: AppColors.blue,
                            borderRadius:
                            BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              "2",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 12),

                        const Text(
                          "Nature of Platform",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "SoonStays operates as an online hospitality booking marketplace that connects guests with third-party hotels, serviced apartments, and accommodation partners.",
                      style: TextStyle(
                        height: 1.7,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}