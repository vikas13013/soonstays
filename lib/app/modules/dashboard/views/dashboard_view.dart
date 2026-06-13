import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soonstays/app/modules/my_trips/views/my_trips_view.dart';
import 'package:soonstays/app/modules/user_profile/views/user_profile_view.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../corporate/views/corporate_view.dart';
import '../../franchise/views/franchise_view.dart';
import '../../home/views/home_view.dart';
import '../../login/views/login_view.dart';
import '../../travel_agent/views/travel_agent_view.dart';
import '../controllers/dashboard_controller.dart';

/// ================= MAIN SCREEN =================
class DashboardView extends GetView<DashboardController> {

  DashboardView({super.key});

  final List<Widget> pages = [

    const HomeView(),

    MyTripsView(
      type: 1,
    ),

    UserProfileView(
      type: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: AppColors.white,

      body: Stack(

        children: [

          /// Pages
          Obx(
                () => IndexedStack(
              index: controller.currentIndex.value,
              children: pages,
            ),
          ),

          /// Floating Bottom Navigation
          Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: Obx(
                  () => Container(

                height: 70,

                decoration: BoxDecoration(

                  color: Colors.white,

                  borderRadius: BorderRadius.circular(50),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.10),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),

                child: Row(

                  children: [

                    _navItem(
                      icon: Icons.home_rounded,
                      title: "Home",
                      index: 0,
                    ),

                    _navItem(
                      icon: Icons.luggage_outlined,
                      title: "Trips",
                      index: 1,
                    ),

                    _navItem(
                      icon: Icons.person_outline,
                      title: "Profile",
                      index: 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _navItem({

    required IconData icon,
    required String title,
    required int index,

  }) {

    final isSelected = controller.currentIndex.value == index;

    return Expanded(

      child: InkWell(

        borderRadius: BorderRadius.circular(20),

        onTap: () => controller.changeTab(index),

        child: Column(

          mainAxisAlignment:
          MainAxisAlignment.center,

          children: [

            Container(

              padding: const EdgeInsets.all(8),

              decoration: BoxDecoration(

                color: isSelected
                    ? const Color(
                  0xFFF2F4FF,
                )
                    : Colors.transparent,

                borderRadius:
                BorderRadius.circular(
                  12,
                ),
              ),

              child: Icon(

                icon,

                size: 22,

                color: isSelected
                    ? AppColors.secondary
                    : Colors.grey,
              ),
            ),

            Text(

              title,

              style: TextStyle(

                fontSize: 12,

                fontWeight:
                FontWeight.w500,

                color: isSelected
                    ? AppColors.secondary
                    : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

