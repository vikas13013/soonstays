import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:get/get.dart';
import 'package:soonstays/core/constants/app_colors.dart';
import 'package:soonstays/core/constants/app_size.dart';
import 'package:soonstays/core/constants/app_strings.dart';
import 'package:soonstays/core/constants/app_text_styles.dart';
import 'package:soonstays/core/utils/app_date_format.dart';
import 'package:soonstays/core/widgets/blinkit_dot.dart';
import 'package:soonstays/core/widgets/common_appbar.dart';
import 'package:soonstays/core/widgets/image_cache_network.dart';

import '../../../data/model/bookings/bookings_model.dart';
import '../controllers/my_trip_details_controller.dart';

class MyTripDetailsView extends GetView<MyTripDetailsController> {
  const MyTripDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: AppStrings.bookingDetails),
      body:  SingleChildScrollView(
        child: Column(
          children: [

            /// STATUS CARD
            BookingStatusCard(
              data: controller.BookingData.value,
            ),

            /// HOTEL DETAILS
            HotelDetailsCard(
              data: controller.BookingData.value,
            ),

            /// GUEST DETAILS
            GuestInformationCard(
              data: controller.BookingData.value,
            ),

            /// PRICE SUMMARY
            FinalPriceCard(
              roomPrice: "${controller.BookingData.value.totalBasePrice}",
              taxes: "${controller.BookingData.value.totalTax}",
              discount: "${controller.BookingData.value.totalDiscount}",
              totalAmount: "${controller.BookingData.value.grandTotal}",
            ),

            /// HOTEL POLICIES
            HotelPoliciesCard(policies: controller.BookingData.value.propertySnapshot!.policy.toString(),),

            // /// CANCELLATION
            // CancellationPolicyCard(
            //   title: "Free Cancellation",
            //   description:
            //   "Cancel before 08 Jun 2026 and receive full refund.",
            // ),


            50.height,

          ],
        ),
      ),
    );
  }
}

class BookingStatusCard extends StatelessWidget {
  final BookingList data;
  BookingStatusCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
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

          Container(
            height: 40,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: const BoxDecoration(
              color: Color(0xffFF9800),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Row(
              children: [

                Container(
                  width: 18,
                  height: 18,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    size: 12,
                    color: Color(0xffFF9800),
                  ),
                ),

                10.width,

                Text(
                  "${AppStrings.booking} ${data.status}",
                  style: AppTextStyle.white12SemiBold,
                ),

                const Spacer(),

                Text(
                  AppDateFormatter().formatDateDisplay(data.createdAt),
                  style: AppTextStyle.white10SemiBold,
                ),

              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      AppStrings.congratulations,
                      style: AppTextStyle.black24SemiBold,
                    ),

                    Text.rich(
                      style: AppTextStyle.greay13Regular,
                      TextSpan(
                        text: AppStrings.yourStayAt,
                        children: [

                          TextSpan(
                            text: "${data.property?.displayName}"
                          ),

                          TextSpan(
                            text: AppStrings.isSecured
                          ),

                        ]
                      )
                    ),
                  ],
                ),

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: BoxBorder.all(
                      color: AppColors.secondary,
                      width: 0.5
                    ),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    children: [

                      BlinkingDot(
                        color: AppColors.secondary,
                      ),

                      5.width,

                      Text("${data.status}",style: AppTextStyle.secondary10Bold,),

                    ],
                  ),
                )
                
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade300,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text.rich(
              style: AppTextStyle.greay10SemiBold,
              TextSpan(
                  text: "${AppStrings.bookingId} : ",
                  children: [

                    TextSpan(
                        text: "${data.id}",
                        style: AppTextStyle.black10SemiBold
                    )

                  ]
              ),
            ),
          ).marginOnly(
            right: 12,
            left: 12,
            bottom: 12
          ),

        ],
      ),
    );
  }
}

class HotelDetailsCard extends StatelessWidget {
  final BookingList data;

  const HotelDetailsCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [

          /// HOTEL IMAGE
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            child: CommonChacheImage(
                Url: data.propertySnapshot!.image.toString(),
                imgHeight: 180,
                imgWidht: double.infinity,
                fit: BoxFit.fill,
                borderRadius: 0
            ),
          ),

          Padding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: 10,
              vertical: 5
            ),
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [

                Text(
                  "${data.property?.displayName}",
                  style: AppTextStyle.black24SemiBold,
                ),

                Row(
                  children: [

                    const Icon(
                      Icons.location_on_outlined,
                      size: 14,
                      color: AppColors.blue,
                    ),

                    4.width,

                    Expanded(
                      child: Text(
                        "${data.property?.fullAddress}",
                        style: AppTextStyle.greay12Regular,
                      ),
                    ),
                  ],
                ),

                10.height,

                Row(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [

                    /// CHECK IN
                    Expanded(
                      child: _DateInfoWidget(
                        title: "CHECK-IN",
                        weekDay: BookingDateHelper.getWeekDay(data.checkinDate ?? ""),
                        day: BookingDateHelper.getDay(data.checkinDate ?? ""),
                        monthYear: BookingDateHelper.getMonthYear(data.checkinDate ?? ""),
                        time: "${data.property?.checkIn} ${AppStrings.onwards}",
                      ),
                    ),

                    const SizedBox(width: 12),

                    /// CHECK OUT
                    Expanded(
                      child: _DateInfoWidget(
                        title: "CHECK-IN",
                        weekDay: BookingDateHelper.getWeekDay(data.checkoutDate ?? ""),
                        day: BookingDateHelper.getDay(data.checkoutDate ?? ""),
                        monthYear: BookingDateHelper.getMonthYear(data.checkoutDate ?? ""),
                        time: "${AppStrings.before} ${data.property?.checkOut}",
                      ),
                    ),

                  ],
                ),

                18.height,

                Row(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [

                    /// GUEST
                    Expanded(
                      child: Row(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: const Color(0xffECFFF4),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.groups_2_outlined,
                              color: Color(0xff0DB56A),
                              size: 15,
                            ),
                          ),

                          10.width,

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text(
                                  AppStrings.guests.toString().toUpperCase(),
                                  style: AppTextStyle.greay12Medium
                                ),

                                4.height,

                                Text(
                                  "${data.totalGuests.toString()} ${AppStrings.guestsStay}",
                                  style: AppTextStyle.black14SemiBold,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 12),

                    /// ROOM
                    Expanded(
                      flex: 2,
                      child: Row(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [

                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: const Color(0xffF4F7FF),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.bed_outlined,
                              color: Color(0xff3158F5),
                              size: 15,
                            ),
                          ),

                          10.width,

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text(
                                  AppStrings.roomDetails,
                                  style: AppTextStyle.greay12Medium,
                                ),

                                2.height,

                                Text(
                                  "${data.noOfRooms.toString()} * ${data.roomSnapshot!.name.toString()}",
                                  style: AppTextStyle.black14Medium,
                                ),

                                2.height,

                                Text(
                                  "${data.ratePlanSnapshot?.name}",
                                  style: AppTextStyle.primary12Medium.copyWith(
                                    color: AppColors.blue
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                10.height,
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DateInfoWidget extends StatelessWidget {
  final String title;
  final String weekDay;
  final String day;
  final String monthYear;
  final String time;

  const _DateInfoWidget({
    required this.title,
    required this.weekDay,
    required this.day,
    required this.monthYear,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [

        Text(
          title,
          style: AppTextStyle.greay11SemiBold,
        ),

        6.height,

        Row(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [

            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xff2E17A8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  2.height,

                  Text(
                    weekDay,
                    style: AppTextStyle.white10SemiBold,
                  ),

                  Text(
                    day,
                    style: AppTextStyle.white22Medium,
                  ),

                ],
              ),
            ),

            10.width,

            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [

                  Text(
                    monthYear,
                    style: AppTextStyle.black18Medium,
                  ),

                  2.height,

                  Text(
                    time,
                    style: AppTextStyle.greay12Regular,
                  ),

                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

class GuestInformationCard extends StatelessWidget {
  final BookingList data;

  const GuestInformationCard({
    super.key,
    required this.data
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 8,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 15
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [

          /// HEADER
          Row(
            children: [

              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: const Color(0xffF2F3FF),
                  borderRadius:
                  BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.person,
                  color: Color(0xff2E17A8),
                  size: 15,
                ),
              ),

              const SizedBox(width: 14),

              Text(
                AppStrings.guestInformation,
                style: AppTextStyle.black18SemiBold,
              ),
            ],
          ),

          const SizedBox(height: 20),

          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: data.guests?.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {

              var guest = data.guests?[index];

              return Column(
                children: [

                  _GuestInfoItem(
                    icon: Icons.person_outline,
                    title: AppStrings.fullName.toUpperCase(),
                    value: "${guest?.name}",
                  ),

                  5.height,

                  _GuestInfoItem(
                    icon: Icons.alternate_email,
                    title: AppStrings.emailAddress.toUpperCase(),
                    value: "${guest?.email}",
                  ),

                  5.height,

                  _GuestInfoItem(
                    icon: Icons.call_outlined,
                    title: AppStrings.mobileNumber.toUpperCase(),
                    value: "${guest?.mobile}",
                  ),

                ],
              );

            },
          )

        ],
      ),
    );
  }
}

class _GuestInfoItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _GuestInfoItem({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [

        Icon(
          icon,
          color: const Color(0xff2E17A8),
          size: 15,
        ),

        10.width,

        Expanded(
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [

              Text(
                title,
                style: AppTextStyle.greay10Medium,
              ),

              Text(
                value,
                style: AppTextStyle.primary14Medium,
              ),

            ],
          ),
        ),

      ],
    );
  }
}

class HotelPoliciesCard extends StatefulWidget {
  final String policies;

  const HotelPoliciesCard({
    super.key,
    required this.policies,
  });

  @override
  State<HotelPoliciesCard> createState() =>
      _HotelPoliciesCardState();
}

class _HotelPoliciesCardState extends State<HotelPoliciesCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 8,
      ),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [

          /// HEADER
          Row(
            children: [

              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: const Color(0xffFFF7E8),
                  borderRadius:
                  BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.shield_outlined,
                  color: Color(0xffF59E0B),
                  size: 15,
                ),
              ),

              const SizedBox(width: 14),

              Text(
                AppStrings.hotelPolicies,
                style: AppTextStyle.black18SemiBold,
              ),
            ],
          ),

          Html(
            data: widget.policies,
          )

        ],
      ),
    );
  }
}

class CancellationPolicyCard extends StatelessWidget {
  final String title;
  final String description;

  const CancellationPolicyCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [

          /// HEADER
          Row(
            children: [

              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: const Color(0xffECFFF4),
                  borderRadius:
                  BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.assignment_return_outlined,
                  color: Color(0xff10B981),
                  size: 15,
                ),
              ),

              const SizedBox(width: 14),

              const Expanded(
                child: Text(
                  AppStrings.cancellationPolicy,
                  style: AppTextStyle.black18SemiBold,
                ),
              ),
            ],
          ),

          15.height,

          /// POLICY BOX
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: const Color(0xffF0FDF4),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: const Color(0xffBBF7D0),
              ),
            ),
            child: Row(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [

                Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    color: Color(0xff10B981),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 15,
                  ),
                ),

                const SizedBox(width: 14),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [

                      Text(
                        title,
                        style: AppTextStyle.green16Medium,
                      ),

                      Text(
                        description,
                        style: AppTextStyle.green12Regular,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FinalPriceCard extends StatelessWidget {
  final String roomPrice;
  final String taxes;
  final String discount;
  final String totalAmount;

  const FinalPriceCard({
    super.key,
    required this.roomPrice,
    required this.taxes,
    required this.discount,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [

          /// HEADER
          Row(
            children: [

              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: const Color(0xffF4F7FF),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.receipt_long,
                  color: Color(0xff2E17A8),
                  size: 15,
                ),
              ),

              14.width,

              Text(
                AppStrings.priceSummanry,
                style: AppTextStyle.black18SemiBold,
              ),
            ],
          ),

          10.height,

          _priceRow(
            AppStrings.roomPrice,
            "${AppStrings.rupeesText}$roomPrice",
          ),

          10.height,

          _priceRow(
            AppStrings.taxesAndFees,
            "${AppStrings.rupeesText}$taxes",
          ),

          10.height,

          _priceRow(
            AppStrings.discount,
            "${AppStrings.rupeesText}$discount",
            valueColor: AppColors.greenDark
          ),

          5.height,

          Divider(
            thickness: 0.5,
          ),

          5.height,

          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.lightBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [

                      Text(
                        AppStrings.totalAmount,
                        style: AppTextStyle.black14SemiBold,
                      ),

                      Text(
                        AppStrings.inclusiveOfAllTaxes,
                        style: AppTextStyle.greay12Light,
                      ),
                    ],
                  ),
                ),

                Text(
                  "${AppStrings.rupeesText}$totalAmount",
                  style: AppTextStyle.primary20SemiBold.copyWith(color: AppColors.blue),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _priceRow(
      String title,
      String value, {
        Color valueColor = Colors.black,
      }) {
    return Row(
      children: [

        Expanded(
          child: Text(
            title,
            style: AppTextStyle.black14Regular.copyWith(color: valueColor),
          ),
        ),

        Text(
          value,
          style: AppTextStyle.black14SemiBold.copyWith(color: valueColor),
        ),
      ],
    );
  }
}