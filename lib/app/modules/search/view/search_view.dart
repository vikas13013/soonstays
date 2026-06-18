import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/arguments/property_details_arguments.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/common_toast.dart';
import '../../../../core/widgets/common_buttons.dart';
import '../../../../core/widgets/common_loader.dart';
import '../../../data/model/location_model.dart';
import '../../../data/model/search_criteria_model.dart';
import '../../../routes/app_pages.dart';
import '../../property_list/controllers/property_list_controller.dart';
import '../controller/search_controller.dart';
import '../modal/guests_modal.dart';

///Common Search View
class SearchView extends StatelessWidget {
  final int type; //0 = dialog, 1 = Routes.PROPERTY_LIST,

   SearchView({
    super.key,
    required this.type,
  });

  final controller = Get.put(SearchViewController());


  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.08),
              blurRadius: 20,
              offset: const Offset(0,10),
            ),
          ],
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            /// LOCATION
            Obx(()=> _CommonSearchTile(
                onTap: () {

                  CommonLocationDialog.show(

                    context: context,

                    onSelect: (model){

                      controller.selectedCityType.value = model.type ?? "";

                      controller.selectedCityName.value = model.label ?? "";

                      controller.selectedCityId.value = model.id ?? "";

                    },
                  );

                },
                icon: Icons.location_on_outlined,
                title: AppStrings.location,
                value: controller.selectedCityName.value.isEmpty
                    ? AppStrings.searchCityHetel
                    : controller.selectedCityName.value,
              ),
            ),

            const SizedBox(
              height: 8,
            ),

            /// DATE
            Obx(() => _CommonSearchTile(
              onTap: () {

                controller.openDatePicker(
                  context,
                );

              },
              icon: Icons.calendar_month_outlined,
              title: AppStrings.checkInOut,
              value: "${controller.displayCheckInDate.value} - ${controller.displayCheckOutDate.value}",
            ),),

            const SizedBox(
              height: 8,
            ),

            /// GUEST
            Obx(() => _CommonSearchTile(
              onTap: () {

                print("Guest Clicked");

                CommonRoomGuestDialog.show(
                  context: context,
                  onApply: (data){

                    print(
                        data.adults
                    );

                    print(
                        data.children
                    );

                    print(
                        data.rooms
                    );

                  },
                );
              },
              icon: Icons.group_outlined,
              title: AppStrings.guestsAndRooms,
              value: "${controller.adults.value} ${AppStrings.adults}, ${controller.children.value} ${AppStrings.children}, ${controller.rooms.value} ${AppStrings.rooms}",
            ),),

            const SizedBox(
              height: 18,
            ),

            /// SEARCH BUTTON
            CommonButton(
              color1: AppColors.secondary,
              color2: AppColors.secondary2,
              value: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Icon(
                    Icons.search,
                    color: AppColors.white,
                  ),

                  5.width,

                  Text(
                    AppStrings.searchStays,
                    style: AppTextStyle.white14SemiBold,
                  ),

                ],
              ),
              onTap: () {

                if(controller.selectedCityName.value.isEmpty){

                  AppToast.show(
                    message: AppStrings.pleaseSelectALocationOrPropertyToSearch,
                    type: AppToastType.info,
                  );

                }else{

                  controller.searchCriteria.value =
                      SearchCriteriaModel(
                        destinationType: controller.selectedCityType.value,
                        destinationId: controller.selectedCityId.value,
                        checkIn: controller.apiCheckInDate.value,
                        checkOut: controller.apiCheckOutDate.value,
                        lengthOfStay: controller.lengthOfStay.value,
                        totalRooms: controller.rooms.value,
                        totalAdults: controller.adults.value,
                        totalChildren: controller.children.value,
                        childAges: controller.childAges,
                        latitude: controller.latitude.value,
                        longitude: controller.longitude.value,
                        radiusKm: 100
                      );

                  final PropertyDetailsArgument data = PropertyDetailsArgument(
                    cityName: controller.selectedCityName.value,
                    searchCriteria: controller.searchCriteria.value,
                  );

                  if(type==0){

                    Get.back(
                        result: data
                    );

                  }else if(type==1){

                    ///Refresh Data

                    Get.toNamed(
                      Routes.PROPERTY_LIST,
                      arguments: data,
                    );

                  }

                }


              },
            ),
          ],
        ),
      ),
    );
  }

}

///Guests Dialog
class CommonRoomGuestDialog {

  static show({
    required BuildContext context,
    required Function(RoomGuestModel model) onApply,
  }) {

    final controller =
    Get.isRegistered<SearchViewController>()
        ? Get.find<SearchViewController>()
        : Get.put(SearchViewController());

    showGeneralDialog(

      context: context,

      barrierDismissible: true,

      barrierLabel: "Room Guest",

      barrierColor: Colors.white,

      transitionDuration: const Duration(
        milliseconds: 250,
      ),

      pageBuilder: (
          context,
          animation,
          secondaryAnimation,
          ) {

        return Scaffold(

          backgroundColor: Colors.white,

          body: SafeArea(

            child: Column(

              children: [

                /// HEADER
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(

                    children: [

                      Expanded(
                        child: Text(
                          AppStrings.roomsAndGuests,
                          style: AppTextStyle.black18SemiBold,
                        ),
                      ),

                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.close,
                        ),
                      )
                    ],
                  ),
                ),

                Divider(),

                /// BODY
                Expanded(
                  child: Obx(
                        () => ListView(
                      padding: const EdgeInsets.all(16),
                      children: [

                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: BoxBorder.all(
                                color: AppColors.greyLight
                            ),
                            color: AppColors.white,
                            boxShadow: [

                              BoxShadow(
                                color: Colors.black.withOpacity(0.06),
                                blurRadius: 20,
                                spreadRadius: 2,
                                offset: const Offset(0, 6),
                              ),

                              BoxShadow(
                                color: Colors.grey.withOpacity(0.08),
                                blurRadius: 30,
                                spreadRadius: 4,
                                offset: const Offset(0, 10),
                              ),

                            ],
                          ),
                          child: buildCounter(
                            AppStrings.adults,
                            controller.adults.value,
                            controller.addAdult,
                            controller.removeAdult,
                          ),
                        ),

                        SizedBox(height: 15),

                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: BoxBorder.all(
                                color: AppColors.greyLight
                            ),
                            color: AppColors.white,
                            boxShadow: [

                              BoxShadow(
                                color: Colors.black.withOpacity(0.06),
                                blurRadius: 20,
                                spreadRadius: 2,
                                offset: const Offset(0, 6),
                              ),

                              BoxShadow(
                                color: Colors.grey.withOpacity(0.08),
                                blurRadius: 30,
                                spreadRadius: 4,
                                offset: const Offset(0, 10),
                              ),

                            ],
                          ),
                          child: Column(
                            children: [
                              buildCounter(
                                AppStrings.children,
                                controller.children.value,
                                controller.addChild,
                                controller.removeChild,
                              ),
                              ...List.generate(
                                controller.childAges.length,
                                    (index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      top: 10,
                                    ),
                                    child: Row(
                                      children: [

                                        Expanded(
                                          child: Text(
                                            "${AppStrings.child} ${index+1} ${AppStrings.age}",
                                            style: AppTextStyle.black14Medium,
                                          ),
                                        ),

                                        DropdownButton<int>(
                                          value: controller.childAges[index],
                                          underline: const SizedBox(),
                                          items: List.generate(
                                            18, (i) =>
                                              DropdownMenuItem(
                                                value: i,
                                                child: Text(
                                                  "$i ${AppStrings.years}",
                                                ),
                                              ),
                                          ),

                                          onChanged: (v) {

                                            controller.updateAge(
                                              index,
                                              v!,
                                            );

                                          },
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),

                        15.height,

                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: BoxBorder.all(
                                color: AppColors.greyLight
                            ),
                            color: AppColors.white,
                            boxShadow: [

                              BoxShadow(
                                color: Colors.black.withOpacity(0.06),
                                blurRadius: 20,
                                spreadRadius: 2,
                                offset: const Offset(0, 6),
                              ),

                              BoxShadow(
                                color: Colors.grey.withOpacity(0.08),
                                blurRadius: 30,
                                spreadRadius: 4,
                                offset: const Offset(0, 10),
                              ),

                            ],
                          ),
                          child: buildCounter(
                            AppStrings.rooms,
                            controller.rooms.value,
                            controller.addRoom,
                            controller.removeRoom,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                /// BUTTON
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(AppColors.primary3)
                      ),
                      onPressed: () {

                        onApply(

                          RoomGuestModel(
                            adults: controller.adults.value,
                            children: controller.children.value,
                            rooms: controller.rooms.value,
                            childAges: controller.childAges,
                          ),
                        );

                        Get.back();
                      },
                      child: Text(
                        AppStrings.applySelection,
                        style: AppTextStyle.white14SemiBold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
      transitionBuilder: (
          context,
          animation,
          secondaryAnimation,
          child,
          ) {

        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(
              0,
              1,
            ),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
    );
  }

  static Widget buildCounter(
      String title,
      int value,
      VoidCallback plus,
      VoidCallback minus,
      ) {

    return Row(

      children: [

        Expanded(
          child: Text(
            title,
            style: AppTextStyle.black14Medium,
          ),
        ),

        IconButton(
          onPressed: minus,
          icon: Icon(Icons.remove),
        ),

        Text("$value"),

        IconButton(
          onPressed: plus,
          icon: Icon(Icons.add),
        ),

      ],
    );
  }
}

class _CommonSearchTile extends StatelessWidget {

  final IconData icon;
  final String title;
  final String value;
  final VoidCallback onTap;

  const _CommonSearchTile({
    required this.icon,
    required this.title,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xffD9D9D9),
              width: .8,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: AppColors.lightBg,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ShaderMask(
                  shaderCallback: (bounds) {
                    return LinearGradient(
                      colors: [

                        AppColors.primary3,

                        Color(0xffFF5E62),

                      ],

                    ).createShader(bounds);
                  },
                  child: Icon(
                    icon,
                    color: AppColors.white,
                    size: 16,
                  ),
                ),
              ),

              14.width,

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      title,
                      style: AppTextStyle.greay10SemiBold,
                    ),

                    2.height,

                    Text(
                      value,
                      style: AppTextStyle.black12Medium,
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


///Location Dialog
class CommonLocationDialog {
  static Future<void> show({
    required BuildContext context,
    required Function(
        LocationModel model,
        ) onSelect,

  }) async {

    final controller = Get.put(SearchViewController());

    controller.clearData();

    await showGeneralDialog(

      context: context,

      barrierDismissible: true,

      barrierLabel: "Location Dialog",

      barrierColor: Colors.white,

      transitionDuration:
      const Duration(milliseconds: 250),

      pageBuilder: (
          context,
          animation,
          secondaryAnimation,
          ) {

        return Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: Column(
              children: [

                /// HEADER
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 16
                  ),
                  child: Row(
                    children: [

                      /// TITLE
                      Expanded(
                        child: Text(
                          AppStrings.locationOrPropertyName,
                          style: AppTextStyle.black18SemiBold,
                        ),
                      ),

                      /// CLOSE
                      InkWell(
                        onTap: () {

                          controller.clearData();

                          Get.back();

                        },
                        child: const Icon(
                          Icons.close,
                          size: 26,
                          color:  Color(0xff4B5563),
                        ),

                      ),
                    ],
                  ),
                ),

                Divider(
                  height: 1,
                  color: Colors.grey.shade300,
                ),

                20.height,

                /// SEARCH FIELD

                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: AppColors.primary,
                      width: 1.5,
                    ),
                  ),
                  child: TextField(
                    controller: controller.searchController.value,
                    onChanged: (value) {

                      if(value.length>=2){

                        controller.getLocations(value);

                      }else{

                        controller.locationList.clear();

                      }

                    },
                    cursorColor: AppColors.primary,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: AppStrings.searchCityHotelArea,
                      hintStyle: AppTextStyle.greay12Light,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 18,
                      ),
                      suffixIcon: ValueListenableBuilder(
                        valueListenable: controller.searchController.value,
                        builder: (context, value, child) {

                          final isEmpty = value.text.isEmpty;

                          return InkWell(
                            overlayColor: WidgetStatePropertyAll(Colors.transparent),
                            onTap: () async {

                              if (!isEmpty) {

                                controller.searchController.value.clear();

                                controller.locationList.clear();

                              }else{

                                log("Hello check");

                                await controller.updateLocationInBackground();

                                var locationModel = LocationModel(
                                  id: "0",
                                  label: "Current Location",
                                  type: ""
                                );

                                /// SELECT
                                controller.selectLocation(
                                    locationModel
                                );

                                /// RETURN FULL DATA
                                onSelect(locationModel);

                                controller.clearData();

                                /// CLOSE
                                Get.back();

                              }



                            },
                            child: Container(
                              width: isEmpty?100:50,
                              alignment: Alignment.center,
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.lightBg,
                                borderRadius:
                                BorderRadius.circular(10),
                              ),
                              child: isEmpty ?
                              Row(
                                children: [

                                  Icon(
                                    Icons.location_searching_outlined,
                                    size: 18,
                                  ),

                                  5.width,

                                  Text(
                                    AppStrings.nearMe.toUpperCase(),
                                    style: AppTextStyle.primary12SemiBold,
                                  ),

                                ],
                              ) :
                              const Icon(
                                Icons.close,
                                color: Color(0xff281593),
                                size: 20,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ).paddingSymmetric(
                    horizontal: 16
                ),

                /// SEARCH RESULT TITLE
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 22,
                      bottom: 12,
                    ),
                    child: Text(
                      AppStrings.searchResults,
                      style: TextStyle(
                        fontSize: 12,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff98A2B3),
                      ),
                    ),
                  ),
                ).marginSymmetric(
                    horizontal: 20
                ),

                /// LOCATION LIST
                Expanded(
                  child: Obx(() {

                    /// LOADING
                    if (controller.isLoading.value) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }



                    /// EMPTY
                    if (controller.locationList.isEmpty) {
                      return const Center(
                        child: Text(
                          "",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      );
                    }



                    return ListView.separated(
                      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                      padding: const EdgeInsets.only(
                        bottom: 20,
                      ),
                      itemCount: controller.locationList.length,
                      separatorBuilder: (context, index,) =>
                      const Divider(
                        height: 28,
                      ),
                      itemBuilder: (context, index,) {

                        final item = controller.locationList[index];

                        return InkWell(
                          onTap: () {

                            controller.latLngClear();

                            /// SELECT
                            controller.selectLocation(item);

                            /// RETURN FULL DATA
                            onSelect(item);

                            controller.clearData();

                            /// CLOSE
                            Get.back();

                          },
                          child: Row(
                            children: [
                              /// ICON
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: const Color(0xffF9FAFB),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Icon(
                                  item.type=='property'?Icons.home_work_outlined:Icons.location_on_outlined,
                                  color: Color(0xffF97316),
                                  size: 20,
                                ),
                              ),

                              14.width,

                              /// TEXT
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text(
                                      item.label ?? "",
                                      style: AppTextStyle.black16SemiBold,
                                    ),

                                    4.height,

                                    Text(
                                      item.type ?? "",
                                      style: AppTextStyle.greay12Regular,
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ).marginSymmetric(
                        horizontal: 20
                    );
                  }),
                )

              ],
            ),
          ),
        );
      },
      transitionBuilder:
          (
          context,
          animation,
          secondaryAnimation,
          child,
          ) {

        return SlideTransition(

          position: Tween<Offset>(

            begin: const Offset(0, 1),

            end: Offset.zero,

          ).animate(

            CurvedAnimation(

              parent: animation,

              curve: Curves.easeInOut,
            ),
          ),

          child: child,
        );
      },
    );
  }

}