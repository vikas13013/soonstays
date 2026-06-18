import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:soonstays/core/constants/app_size.dart';
import 'package:soonstays/core/widgets/common_appbar.dart';
import 'package:soonstays/core/widgets/common_buttons.dart';
import 'package:soonstays/core/widgets/image_cache_network.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/textfield_validation.dart';
import '../../../../core/widgets/common_dialog.dart';
import '../../../../core/widgets/common_text_field.dart';
import '../controllers/booking_screen_controller.dart';

class BookingScreenView extends GetView<BookingScreenController> {
  const BookingScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: AppStrings.reviewDetails),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10
        ),
        color: AppColors.greyLight2,
        child: ListView(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          children: [

            10.height,

            TopSession(
              controller: controller
            ),

            10.height,

            DetailsCard(
              controller: controller
            ),

            10.height,

            CommonExpanded(
              count: "1",
              title: AppStrings.guestDetails,
              subTitle: AppStrings.bookingConfirmationWillBeSentToTheseDetails,
              children: [

                Form(
                  key: controller.globalKey.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      ///Full Name TextField
                      CustomInputFieldBorder(
                        borderColor: AppColors.black,
                        style: AppTextStyle.black14Regular,
                        controller: controller.fullNameController.value,
                        hintText: "${AppStrings.fullName}*",
                        validator: (value) => Validators.required(
                            value,
                            AppStrings.fullNameIsRequired
                        ),
                      ),

                      10.height,

                      ///Email TextField
                      CustomInputFieldBorder(
                        borderColor: AppColors.black,
                        style: AppTextStyle.black14Regular,
                        controller: controller.emailController.value,
                        inputType: TextInputType.emailAddress,
                        hintText: "${AppStrings.emailAddress}*",
                        validator: (value) => Validators.email(
                            controller.emailController.value.text
                        ),
                      ),

                      Text(
                        AppStrings.bookingVoucherWillBeSentHere,
                        style: AppTextStyle.black8Light,
                      ),

                      10.height,

                      ///Mobile TextField
                      CustomInputFieldBorder(
                        borderColor: AppColors.black,
                        style: AppTextStyle.black14Regular,
                        controller: controller.mobileNumberController.value,
                        hintText: "${AppStrings.mobileNumber}*",
                        inputType: TextInputType.phone,
                        inputFormattes: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: (value) => Validators.phone(
                            value,
                            10
                        ),
                      ),

                    ],
                  ),
                )


              ]
            ),


            10.height,

            CommonExpanded(
                count: "2",
                title: AppStrings.addOnsPreferences,
                subTitle: AppStrings.optionalDetailsToPersonaliseYourStay,
                children: [

                  CommonExpanded(
                      title: AppStrings.gstInvoice,
                      subTitle: AppStrings.forBusinessTravelClaims,
                      children: [

                        ///GSTIN Number TextField
                        CustomInputFieldBorder(
                          borderColor: AppColors.black,
                          style: AppTextStyle.black14Regular,
                          controller: controller.gstinNumberController.value,
                          hintText: AppStrings.gstinNumber,
                        ),

                        10.height,

                        ///Company Name TextField
                        CustomInputFieldBorder(
                          borderColor: AppColors.black,
                          style: AppTextStyle.black14Regular,
                          controller: controller.companyNameController.value,
                          hintText: AppStrings.companyName,
                        ),

                        10.height,

                        ///Company Address TextField
                        CustomInputFieldBorder(
                          borderColor: AppColors.black,
                          style: AppTextStyle.black14Regular,
                          controller: controller.companyAddressController.value,
                          hintText: AppStrings.companyAddress,
                        ),

                        10.height,

                      ]
                  ),

                  CommonExpanded(
                      title: AppStrings.specialRequests,
                      subTitle: AppStrings.earlyCheckInDietaryNeeds,
                      children: [

                        ///Request Note TextField
                        CustomInputFieldBorder(
                          borderColor: AppColors.black,
                          fillColor: AppColors.greyLight2,
                          style: AppTextStyle.black14Regular,
                          controller: controller.requestController.value,
                          maxLines: 4,
                          hintText:   AppStrings.writeYourRequestHere,
                        ),

                        10.height,

                      ]
                  ),

                ]
            ),

            10.height,

            CommonExpanded(
                count: "3",
                title: AppStrings.couponsAndOffers,
                subTitle: AppStrings.saveMoreOnYourBooking,
                children: [

                  ///Coupon TextField
                  Row(
                    children: [

                      Flexible(
                        child: CustomInputFieldBorder(
                          onChanged: (value) {
                            if(value.isEmpty){

                              controller.couponLengthIs.value = false;

                            }else{

                              controller.couponLengthIs.value = true;

                            }
                          },
                          borderColor: AppColors.black,
                          style: AppTextStyle.black14Regular,
                          controller: controller.couponController.value,
                          hintText: "${AppStrings.enterCouponPromoCode}*",
                        ),
                      ),

                      10.width,

                      Obx(
                        () => CommonButton(
                          height: 45,
                          radius: 8,
                          onTap:() => controller.couponLengthIs.value?controller.validateCoupon(
                              couponCode: controller.couponController.value.text,
                              bookingAmount: double.tryParse("${controller.ratePlansData.value.pricing!.subTotal}")!,
                              hotelId: controller.propertyData.value.id.toString(),
                              roomId: controller.availableRoomsData.value.id.toString()
                          ):null,
                          text: AppStrings.apply,
                          textStyle: controller.couponLengthIs.value?AppTextStyle.white14Bold:AppTextStyle.greay14Bold,
                          color1: controller.couponLengthIs.value?AppColors.primary3:AppColors.lightBg,
                          color2: controller.couponLengthIs.value?AppColors.primary3:AppColors.lightBg,
                        ),
                      )

                    ],
                  ),

                ]
            ),

            10.height,

            CommonExpanded(
                count: "4",
                title: AppStrings.paymentMethod,
                subTitle: AppStrings.chooseHowYouLikeToPay,
                children: [

                  Obx(
                        ()=>Column(
                      children: [

                        paymentCard(
                          title: AppStrings.payOnlineNow,
                          subtitle: AppStrings.secureYourRoomInstantly,
                          price: controller.ratePlansData.value.pricing!.totalPayable.toString(),
                          showTag: true,
                          isSelected: controller.selectedPayment.value == 0,
                          onTap: (){
                            controller.selectedPayment.value = 0;
                          },
                        ),

                        paymentCard(
                          title: AppStrings.payAtHotel,
                          subtitle: AppStrings.noUpFrontPayment,
                          price: controller.ratePlansData.value.pricing!.totalPayable.toString(),
                          isSelected: controller.selectedPayment.value == 1,
                          onTap: (){
                            controller.selectedPayment.value = 1;
                          },
                        ),

                      ],
                    ),
                  )

                ]
            ),

            100.height,

          ],
        ),
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15)
          )
        ),
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10
          ),
          shrinkWrap: true,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      AppStrings.totalPayable,
                      style: AppTextStyle.black16SemiBold,
                    ),

                    Text(
                      AppStrings.inclusiveOfAllTaxes,
                      style: AppTextStyle.greay11Medium,
                    ),

                    Text(
                      "${AppStrings.rupeesText} ${controller.ratePlansData.value.pricing!.totalPayable.toString()}",
                      style: AppTextStyle.primary22Bold,
                    )


                  ],
                ),

                Obx(() => CommonButton(
                  onTap: () => controller.createBooking(),
                  text: controller.selectedPayment.value==1?AppStrings.confirm:AppStrings.payNowAndBook,
                  height: 45,
                  radius: 10,
                  padding: EdgeInsets.symmetric(
                      horizontal: 30
                  ),
                  textStyle: AppTextStyle.white14Bold,
                ),)

              ],
            )

          ],
        ),
      ),
    );
  }
}

Widget paymentCard({
  required String title,
  required String subtitle,
  required String price,
  bool isSelected = false,
  bool showTag = false,
  VoidCallback? onTap,
}) {
  return InkWell(
    onTap: onTap,
    overlayColor: WidgetStatePropertyAll(Colors.transparent),
    child: Container(
      margin: const EdgeInsets.only(
        bottom: 15,
      ),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: isSelected?
        AppColors.lightBg:
        Colors.white,
        borderRadius: BorderRadius.circular(
          15,
        ),
        border: Border.all(
          color: isSelected
              ? AppColors.primary3
              : AppColors.greyLight,
          width: isSelected ? 1.5 : .8,
        ),
      ),
      child: Row(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [

          /// RADIO
          Container(
            margin: const EdgeInsets.only(
              top: 2,
            ),

            child: Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off,
              size: 24,
              color: isSelected
                  ? AppColors.primary3
                  : Colors.grey,
            ),
          ),

          12.width,

          /// TEXT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  children: [

                    Expanded(
                      child: Text(
                        title,
                        style: AppTextStyle.black14SemiBold,
                      ),
                    ),

                    if(showTag)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),

                        decoration: BoxDecoration(
                          color: AppColors.greenBg,
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                        ),

                        child: Text(
                          AppStrings.bestValue.toUpperCase(),
                          style: TextStyle(
                            color: AppColors.greenDark,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                  ],
                ),

                5.height,

                Text(
                  subtitle,
                  style: AppTextStyle.greay10Regular,
                ),

                12.height,

                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "${AppStrings.rupeesText} $price",
                    style: AppTextStyle.primary18SemiBold
                  ),
                )

              ],
            ),
          ),
        ],
      ),
    ),
  );
}


Widget bookingInfoItem({
  required String title,
  required String date,
  required String time,
}) {
  return IntrinsicWidth(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(
          children: [

            Icon(
              Icons.calendar_month_outlined,
              size: 12,
              color: AppColors.primary3,
            ),

            5.width,

            Text(
              title.toUpperCase(),
              style: AppTextStyle.greay9SemiBold,
            ),

          ],
        ),

        2.height,

        Text(
          date,
          style: AppTextStyle.black12SemiBold,
        ),

        2.height,

        time==''?
        Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5
          ),
          decoration: BoxDecoration(
            color: AppColors.lightBg,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            AppStrings.edit,
            style: AppTextStyle.primary12SemiBold.copyWith(
                color: AppColors.primary3
            ),
          ),
        ):
        Text(
          time,
          style: AppTextStyle.greay10Medium,
        ),

      ],
    ),
  );
}

Widget bookingInfoItem2({
  required String title,
  required String date,
  required IconData icon,
}) {
  return Flexible(
    child: IntrinsicWidth(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Icon(
            icon,
            size: 13,
            color: AppColors.primary3,
          ),

          6.width,

          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: AppTextStyle.greay10SemiBold,
                ),

                4.height,

                Text(
                  date,
                  style: AppTextStyle.black11Regular,
                ),

              ],
            ),
          ),
        ],
      ),
    ),
  );
}


Widget TopSession({
  required BookingScreenController controller
}) {

  return  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [

      Container(
        padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5
        ),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(
              40,
            ),
            border: Border.all(
                color: AppColors.greyLight
            )
        ),
        child: Row(
          children: [

            CircleAvatar(
              radius: 10,
              backgroundColor: AppColors.lightBg,
              child: Icon(
                Icons.watch_later_outlined,
                size: 15,
              ),
            ),

            5.width,

            Obx(() => Text(
              "${AppStrings.session} ${controller.formattedTime}",
              style: AppTextStyle.black12SemiBold,
            ),)

          ],
        ),
      ),

      Container(
        padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5
        ),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(
              40,
            ),
            border: Border.all(
                color: AppColors.greyLight
            )
        ),
        child: Row(
          children: [

            CircleAvatar(
              radius: 10,
              backgroundColor: AppColors.white,
              child: Icon(
                Icons.lock,
                size: 15,
                color: AppColors.greenDark,
              ),
            ),

            5.width,

            Text(
              AppStrings.secureCheckout,
              style: AppTextStyle.green12SemiBold.copyWith(
                color: AppColors.greenDark
              ),
            )

          ],
        ),
      ),

    ],
  );

}


Widget DetailsCard({required BookingScreenController controller}) {

  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 10
    ),
    decoration: BoxDecoration(
      color: AppColors.white,
      border: Border.all(
        color: AppColors.greyLight
      ),
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.08),
          blurRadius: 20,
          spreadRadius: 2,
          offset: Offset(0, 8),
        ),
      ],
    ),
    child: Column(
      children: [

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            CommonChacheImage(
                imgHeight: 100,
                imgWidht: Get.width*0.3,
                borderRadius: 10,
                Url: "https://kehu.s3.amazonaws.com/property/025d7e77-5b8c-45cd-adcf-65107a029232/IMAGE/1776626180556-550639229%20(1).jpg"
            ),

            10.width,

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "${controller.propertyData.value.displayName}",
                    style: AppTextStyle.black16Bold,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Icon(
                        Icons.location_on_outlined,
                        color: AppColors.grey,
                        size: 12,
                      ),

                      2.width,

                      Flexible(
                        child: Text(
                          "${controller.propertyData.value.displayName}",
                          style: AppTextStyle.greay9Regular,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),

                  10.height,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                    children: [

                      bookingInfoItem(
                          title: AppStrings.checkIn,
                          date: "${controller.searchCriteria["timeline"]['checkIn']}",
                          time: "${controller.propertyData.value.checkIn}"
                      ),

                      SizedBox(
                        height: 40,
                        child: VerticalDivider(
                          color: AppColors.greyLight,
                        ),
                      ),

                      bookingInfoItem(
                          title: AppStrings.checkOut,
                          date: "${controller.searchCriteria["timeline"]['checkOut']}",
                          time: "${controller.propertyData.value.checkOut}"
                      ),

                    ],
                  ),
                ],
              ),
            ),



          ],
        ),

        5.height,

        Divider(
          color: AppColors.greyLight,
        ),

        5.height,

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [


            bookingInfoItem2(
              title: AppStrings.room,
              date: "${controller.searchCriteria["occupancy"]['totalRooms']} ${controller.availableRoomsData.value.name??""} * ${controller.ratePlansData.value.mealPlan??""}",
              icon: Icons.bakery_dining_outlined,
            ),

            SizedBox(
                height: 40,
                child: VerticalDivider(
                  color: AppColors.greyLight,
                )
            ),

            bookingInfoItem2(
              title: AppStrings.guests,
              date: "${controller.searchCriteria["occupancy"]['totalAdults']} Adults * ${controller.searchCriteria["occupancy"]['totalChildren']} Children",
              icon: Icons.groups_2_outlined,
            ),

            SizedBox(
                height: 40,
                child: VerticalDivider(
                  color: AppColors.greyLight,
                )
            ),

            bookingInfoItem2(
              title: AppStrings.duration,
              date: "${controller.searchCriteria["timeline"]['lengthOfStay']} ${AppStrings.nights} \n",
              icon: Icons.nightlight_round_outlined,
            ),

          ],
        ),
      ],
    ),
  );

}

Widget CommonExpanded({
  required String title,
  required String subTitle,
  String?count,
  required List<Widget> children
}) {

  final isExpanded = count=="2"?false.obs:true.obs;

  return Container(
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(10),
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

          count==null?SizedBox():
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: AppColors.primary3,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Center(
              child: Text(
                count,
                style: AppTextStyle.white14SemiBold,
                textAlign: TextAlign.center,
              ),
            ),
          ).marginOnly(
            right: 10
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: AppTextStyle.black15SemiBold,
                ),

                Text(
                  subTitle,
                  style: AppTextStyle.greay10Regular,
                )

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
      ),),
      children: children,
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