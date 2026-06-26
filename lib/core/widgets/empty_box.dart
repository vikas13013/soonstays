import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/routes/app_pages.dart';
import '../constants/app_assets.dart';
import '../constants/app_size.dart';
import '../constants/app_strings.dart';
import '../constants/app_text_styles.dart';

///My Trips Empty Trips
class EmptyTripView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image.asset(
              AppAssets.myTripsBg,
              height: 200,
            ),

            10.height,

            Text(
              AppStrings.noUpcomingTrips,
              style: AppTextStyle.black20SemiBold,
            ),

            5.height,

            Text(
              AppStrings.youHaveNoConfirmedBookings,
              textAlign: TextAlign.center,
              style: AppTextStyle.greay13Regular,
            ),

            30.height,

            InkWell(
              onTap: () => Get.offAllNamed(Routes.DASHBOARD),
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 15
                ),
                height: 45,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff2200AA),
                      Color(0xff4A88FF),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    const Icon(
                      Icons.apartment,
                      color: Colors.white,
                    ),

                    10.width,

                    Text(
                        AppStrings.exploreHotels,
                        style: AppTextStyle.white15SemiBold
                    ),

                    10.width,

                    const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



///Property Empty Trips
class EmptyPropertyView extends StatelessWidget {
  final VoidCallback onTap;

  const EmptyPropertyView({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image.asset(
              AppAssets.propertyBg,
              height: 200,
            ),

            10.height,

            Text(
              AppStrings.noHotelsFound,
              style: AppTextStyle.black20SemiBold,
            ),

            5.height,

            Text(
              AppStrings.weCouldFindAnyHotelsMatching,
              textAlign: TextAlign.center,
              style: AppTextStyle.greay13Regular,
            ),

            30.height,

            InkWell(
              overlayColor: WidgetStatePropertyAll(Colors.transparent),
              onTap: onTap,
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 15
                ),
                height: 40,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff2200AA),
                      Color(0xff4A88FF),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
              
                    const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 20,
                    ),

                    10.width,
              
                    Text(
                        AppStrings.tryNewSearch,
                        style: AppTextStyle.white14SemiBold
                    ),
              
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}