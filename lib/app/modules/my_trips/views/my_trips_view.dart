import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:soonstays/core/constants/app_assets.dart';
import 'package:soonstays/core/constants/app_colors.dart';
import 'package:soonstays/core/constants/app_size.dart';
import 'package:soonstays/core/constants/app_strings.dart';
import 'package:soonstays/core/constants/app_text_styles.dart';
import 'package:soonstays/core/utils/app_date_format.dart';
import 'package:soonstays/core/widgets/blinkit_dot.dart';
import 'package:soonstays/core/widgets/common_appbar.dart';
import 'package:soonstays/core/widgets/common_buttons.dart';
import 'package:soonstays/core/widgets/image_cache_network.dart';

import '../../../../core/widgets/empty_box.dart';
import '../../../../core/widgets/shimmer/my_trips_shimmer.dart';
import '../../../data/model/bookings/bookings_model.dart';
import '../../../routes/app_pages.dart';
import '../controllers/my_trips_controller.dart';

class MyTripsView extends GetView<MyTripsController> {
  int?type;
  MyTripsView({
    super.key,
    this.type
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: type==1?DashBoardAppBar():CommonAppBar(
        title: AppStrings.myTrips,
        action: [

          Icon(
            Icons.luggage_rounded,
            color: AppColors.white,
            size: 30,
          ),

          15.width,

        ]
      ),

      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [

            10.height,

            Container(
              height: 52,
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFFEAEAEA),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.03),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TabBar(
                padding: EdgeInsets.zero,
                indicatorPadding: EdgeInsets.zero,
                labelPadding: EdgeInsets.zero,
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.05),
                      blurRadius: 8,
                    ),
                  ],
                ),
                labelColor: AppColors.blue,
                unselectedLabelStyle: AppTextStyle.greay12Regular,
                unselectedLabelColor: Colors.grey,
                labelStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
                controller: controller.tabController,
                overlayColor: WidgetStatePropertyAll(Colors.transparent),
                tabs: [

                  Tab(
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [

                        Icon(
                          Icons.calendar_today_outlined,
                          size: 12,
                        ),

                        SizedBox(width: 4),

                        Text(
                            AppStrings.upcoming
                        ),

                      ],
                    ),
                  ),

                  Tab(
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [

                        Icon(
                          Icons.cancel_outlined,
                          size: 15,
                        ),

                        SizedBox(width: 4),

                        Text(AppStrings.cancelled),

                      ],
                    ),
                  ),

                  Tab(
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [

                        Icon(
                          Icons.task_alt_outlined,
                          size: 15,
                        ),

                        SizedBox(width: 4),

                        Text(AppStrings.completed),

                      ],
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: TabBarView(
                controller: controller.tabController,
                children: [

                  Padding(
                    padding: EdgeInsetsGeometry.only(
                        top: 10
                    ),
                    child: myTripsList(
                      controller: controller,
                      bookingData: controller.upcoming,
                      onRefresh: () => controller.getBookings(
                        status: "CONFIRMED,PENDING",
                        bookingData: controller.upcoming,
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsetsGeometry.only(
                        top: 10
                    ),
                    child: myTripsList(
                      controller: controller,
                      bookingData: controller.cancelled,
                      onRefresh: () => controller.getBookings(
                        status: "CANCELLED",
                        bookingData: controller.cancelled,
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsetsGeometry.only(
                        top: 10
                    ),
                    child: myTripsList(
                      controller: controller,
                      bookingData: controller.completed,
                      onRefresh: () => controller.getBookings(
                        status: "COMPLETED",
                        bookingData: controller.completed,
                      ),
                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}


myTripsList({
  required MyTripsController controller,
  required BookingTabData bookingData,
  required Future<void> Function() onRefresh,
}){

  return  Obx(() {

    /// Initial Loading
    if (bookingData.isLoading.value) {
      return ListView.builder(
        itemCount: 5,
        itemBuilder: (_, __) =>
        const BookingCardShimmer(),
      );
    }

    /// Empty State
    if (bookingData.list.isEmpty) {
      return EmptyTripView();
    }

    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.builder(
        controller: controller.scrollController,
        physics:
        const AlwaysScrollableScrollPhysics(),
        itemCount: bookingData.list.length +
            (bookingData.isLoadMore.value
                ? 1
                : 0),
        itemBuilder: (context, index) {

          /// Pagination Loader
          if (index == bookingData.list.length) {
            return const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: Center(
                child:
                CircularProgressIndicator(),
              ),
            );
          }

          final data =
          bookingData.list[index];

          return BookingCard(
            data: data,
            image:
            data.propertySnapshot?.image ??
                "",
            hotelName:
            data.propertySnapshot?.name ??
                "",
            address:
            data.propertySnapshot?.address ??
                "",
            bookingId: data.id ?? "",
            amount:
            data.grandTotal?.toString() ??
                "",
            checkIn:
            AppDateFormatter().formatDate(
              data
                  .payloadData
                  ?.searchCriteria
                  ?.timeline
                  ?.checkIn,
            ),
            checkOut:
            AppDateFormatter().formatDate(
              data
                  .payloadData
                  ?.searchCriteria
                  ?.timeline
                  ?.checkOut,
            ),
            roomName:
            data.roomSnapshot?.name ?? "",
            guests:
            "${data.payloadData?.searchCriteria?.occupancy?.totalAdults ?? 0} Adult",
            stayNights:
            "${data.payloadData?.searchCriteria?.timeline?.lengthOfStay ?? 0}N",
            bookingStatus:
            data.status ?? "",
            paymentStatus:
            data.paymentStatus ?? "",
          );
        },
      ),
    );
  });

}



class BookingCard extends StatelessWidget {
  final BookingList data;
  final String image;
  final String hotelName;
  final String address;
  final String bookingId;
  final String amount;
  final String checkIn;
  final String checkOut;
  final String roomName;
  final String guests;
  final String stayNights;
  final String bookingStatus;
  final String paymentStatus;

  const BookingCard({
    super.key,
    required this.data,
    required this.image,
    required this.hotelName,
    required this.address,
    required this.bookingId,
    required this.amount,
    required this.checkIn,
    required this.checkOut,
    required this.roomName,
    required this.guests,
    required this.stayNights,
    required this.bookingStatus,
    required this.paymentStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10,
        left: 10,
        right: 10
      ),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// IMAGE SECTION
              Stack(
                children: [

                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CommonChacheImage(
                        Url: image,
                        imgWidht: 100,
                        imgHeight: 80,
                        fit: BoxFit.cover
                    ),
                  ),

                  Positioned(
                    left: 8,
                    top: 8,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        stayNights,
                        style: AppTextStyle.white10Bold,
                      ),
                    ),
                  ),
                ],
              ),

              10.width,

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      hotelName,
                      style: AppTextStyle.black16Bold,
                    ),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Icon(
                          Icons.location_on_outlined,
                          size: 10,
                          color: AppColors.grey,
                        ),

                        Expanded(
                          child: Text(
                            address,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.greay11Regular,
                          ),
                        ),


                      ],
                    ),

                    6.height,

                    Text.rich(
                      TextSpan(
                        text: "${AppStrings.bookingId} : ",
                        style: AppTextStyle.black10Medium,
                        children: [

                          TextSpan(
                            text: bookingId,
                            style: AppTextStyle.black10SemiBold
                          )

                        ]
                      )
                    ),

                  ],
                ),
              )

            ],
          ),

          10.height,

          Wrap(
            spacing: 12,
            runSpacing: 12,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [

              _InfoChip(
                icon: Icons.calendar_month_outlined,
                title: checkIn,
                subtitle: "Check-in",
              ),

              _InfoChip(
                icon: Icons.calendar_month_outlined,
                title: checkOut,
                subtitle: "Check-out",
              ),

              _InfoChip(
                icon: Icons.bed_outlined,
                title: roomName,
                subtitle: guests,
                isExpanded: true,
              ),
            ],
          ),

          10.height,

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  border: BoxBorder.all(
                      color: AppColors.secondary,
                      width: 0.5
                  ),
                  color: const Color(0xffFFF4E7),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  bookingStatus,
                  style: AppTextStyle.secondary10Bold,
                ),
              ),

              10.width,

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: AppColors.greyLight,
                  border: BoxBorder.all(
                      color: AppColors.grey,
                      width: 0.5
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  paymentStatus,
                  style: AppTextStyle.greyDark10Bold,
                ),
              ),

              Spacer(),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  Text(
                    AppStrings.amountPaid.toString().toUpperCase(),
                    style: AppTextStyle.greay8Bold,
                  ),

                  2.height,

                  Text.rich(
                    TextSpan(
                      text: "${AppStrings.rupeesText} ",
                      style: AppTextStyle.primary10Bold.copyWith(
                        color: AppColors.blue
                      ),
                      children: [

                        TextSpan(
                          text: amount,
                          style: AppTextStyle.primary18Bold,
                        )

                      ]
                    ),
                  ),

                  Text(
                    AppStrings.allTaxesIncluded,
                    style: AppTextStyle.greay8SemiBold.copyWith(
                      height: 0.5,
                      color: AppColors.greenDark
                    ),
                  )

                ],
              ),

            ],
          ),

          10.height,

          CommonButton(
            padding: EdgeInsets.zero,
            height: 30,
            onTap: () => Get.toNamed(
              Routes.MY_TRIP_DETAILS,
              arguments: data,
            ),
            text: AppStrings.viewDetails,
            textStyle: AppTextStyle.white10Bold,
          ),

        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isExpanded;

  const _InfoChip({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.isExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: isExpanded ? 250 : 130,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [

          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppColors.lightBg,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Icon(
              icon,
              color: AppColors.blue,
              size: 10,
            ),
          ),

          5.width,

          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.black10Bold,
                ),

                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.greay8Medium,
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
