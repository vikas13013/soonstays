import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonstays/app/modules/menu/views/menu_view.dart';
import 'package:soonstays/core/constants/app_colors.dart';
import 'package:soonstays/core/constants/app_size.dart';
import 'package:soonstays/core/constants/app_strings.dart';
import '../../../../core/widgets/double_back_exit.dart';
import '../../home/views/home_view.dart';
import '../../my_trips/views/my_trips_view.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardBackToExit(
      child: Scaffold(
        body: Stack(
          children: [

            Obx(
                  () => IndexedStack(
                index: controller.selectedIndex.value,
                children: [

                  HomeView(
                    scrollController: controller.homeScrollController,
                  ),

                   MyTripsView(type: 1,),

                   MenuView(
                     scrollController: controller.moreScrollController,
                   ),

                ],
              ),
            ),

            Obx(() => AnimatedPositioned(
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeInOutCubic,
              left: 0,
              right: 0,
              bottom: controller.showBottomBar.value
                  ? 0
                  : -100,
              child: const CommonBottomNav(),
            ),),

          ],
        ),
      ),
    );
  }
}


///Common Bottom Navigation
class CommonBottomNav extends GetView<DashboardController> {
  const CommonBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40)
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.08),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Obx(
            () => Row(
          children: [

            _navItem(
              icon: Icons.home_outlined,
              title: AppStrings.home,
              index: 0,
            ),

            _navItem(
              icon: Icons.luggage_outlined,
              title: AppStrings.myTrips,
              index: 1,
            ),

            _navItem(
              icon: Icons.grid_view_outlined,
              title: AppStrings.more,
              index: 2,
            ),
          ],
        ),
      ),
    );
  }

  Widget _navItem({
    required IconData icon,
    required String title,
    required int index,
  }) {
    final bool isSelected = controller.selectedIndex.value == index;

    return Expanded(
      child: InkWell(
        onTap: () => controller.changeTab(index),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: SizedBox(
          height: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              /// Top Indicator
              AnimatedContainer(
                duration: const Duration(
                  milliseconds: 300,
                ),
                curve: Curves.easeInOut,
                height: 3,
                width: isSelected ? 35 : 0,
                decoration: BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),

              8.height,

              /// Active Background
              AnimatedContainer(
                duration: const Duration(
                  milliseconds: 250,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.lightBg
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  icon,
                  size: isSelected ? 28 : 25,
                  color: isSelected
                      ? AppColors.blue
                      : Colors.grey,
                ),
              ),

              4.height,

              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected
                      ? FontWeight.w600
                      : FontWeight.w400,
                  color: isSelected
                      ? AppColors.blue
                      : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}