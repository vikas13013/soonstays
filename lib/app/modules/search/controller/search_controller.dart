import 'dart:convert';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:soonstays/core/constants/app_colors.dart';
import 'package:soonstays/core/constants/app_size.dart';
import 'package:soonstays/core/constants/app_strings.dart';
import 'package:soonstays/core/widgets/common_buttons.dart';
import 'package:soonstays/core/widgets/common_loader.dart';

import '../../../../core/get_storage/storage_keys.dart';
import '../../../../core/utils/app_date_format.dart';
import '../../../../core/utils/geo_locator.dart';
import '../../../data/model/location_model.dart';
import '../../../data/model/search_criteria_model.dart';
import '../../../data/services/location/location_service.dart';

class SearchViewController extends GetxController{

  final selectedCityType = "".obs;

  final selectedCityName = "".obs;

  final selectedCityId = "".obs;

  Rx<SearchCriteriaModel> searchCriteria = SearchCriteriaModel().obs;

  Rx<String> displayCheckInDate = "".obs;

  Rx<String> displayCheckOutDate = "".obs;

  Rx<String> apiCheckInDate = "".obs;

  Rx<String> apiCheckOutDate = "".obs;

  RxInt lengthOfStay = 1.obs;

  Rx<DateTime> checkInDate = DateTime.now().obs;

  Rx<DateTime> checkOutDate = DateTime.now().add(const Duration(days: 1)).obs;

  RxBool isPickerOpening = false.obs;

  dateData(){

    displayCheckInDate.value = AppDateFormatter.displayDate(
      checkInDate.value,
    );

    displayCheckOutDate.value = AppDateFormatter.displayDate(
      checkOutDate.value,
    );

    apiCheckInDate.value = AppDateFormatter.apiDate(
      checkInDate.value,
    );

    apiCheckOutDate.value = AppDateFormatter.apiDate(
      checkOutDate.value,
    );

    lengthOfStay.value = AppDateFormatter.getDaysDifference(
      startDate: "${apiCheckInDate.value}",
      endDate: "${apiCheckOutDate.value}",
    );

  }

  Future<void> openDatePicker(
      BuildContext context,
      ) async {
    List<DateTime?> values = [
      checkInDate.value,
      checkOutDate.value,
    ];

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            final nights = values.length >= 2 &&
                values[0] != null &&
                values[1] != null
                ? values[1]!
                .difference(values[0]!)
                .inDays
                : 0;

            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    Container(
                      width: 50,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius:
                        BorderRadius.circular(20),
                      ),
                    ),

                    10.height,

                    const Text(
                      "Select Dates",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    10.height,

                    Row(
                      children: [

                        Expanded(
                          child: _dateCard(
                            "Check-In",
                            values.isNotEmpty &&
                                values[0] != null
                                ? _formatDate(
                              values[0]!,
                            )
                                : "Select Date",
                          ),
                        ),

                        const SizedBox(width: 10),

                        Expanded(
                          child: _dateCard(
                            "Check-Out",
                            values.length > 1 &&
                                values[1] != null
                                ? _formatDate(
                              values[1]!,
                            )
                                : "Select Date",
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    CalendarDatePicker2(
                      config: CalendarDatePicker2WithActionButtonsConfig(
                        calendarType: CalendarDatePicker2Type.range,
                        selectedDayHighlightColor: AppColors.primary2,
                        selectedRangeHighlightColor: AppColors.lightBg,
                        centerAlignModePicker: true,
                        daySplashColor: AppColors.lightBg,
                        dayBorderRadius: BorderRadius.circular(12),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(
                          2035,
                        ),
                      ),
                      value: values,
                      onValueChanged: (dates,) {
                        setState(() {
                          values = dates;
                        });
                      },
                    ),

                    const SizedBox(height: 10),

                    if (nights > 0)
                      Container(
                        width: double.infinity,
                        padding:
                        const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: AppColors.lightBg,
                          borderRadius: BorderRadius.circular(12,),
                        ),
                        child: Text(
                          "$nights ${AppStrings.night}${nights > 1 ? 's' : ''}",
                          style: const TextStyle(
                            fontWeight:
                            FontWeight.w600,
                          ),
                        ),
                      ),

                    16.height,

                    CommonButton(
                      onTap: () {

                        if (values.length >= 2 &&
                            values[0] != null &&
                            values[1] != null) {

                          checkInDate.value =
                          values[0]!;

                          checkOutDate.value =
                          values[1]!;

                          dateData();

                          Get.back();
                        }

                      },
                      text: "${AppStrings.apply}",
                      height: 40,
                    ),

                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _dateCard(
      String title,
      String value,
      ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(
            0xffE5E7EB,
          ),
        ),
        borderRadius:
        BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontWeight:
              FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(
      DateTime date,
      ) {
    const months = [
      '',
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];

    return "${date.day} ${months[date.month]}";
  }


  ///Guests

  RxInt adults = 1.obs;
  RxInt children = 0.obs;
  RxInt rooms = 1.obs;

  RxList<int> childAges = <int>[].obs;

  void addAdult(){

    if(adults.value<30){

      adults.value++;

    }

  }

  void removeAdult(){
    if(adults.value>1){
      adults.value--;
    }
  }

  void addRoom(){

    if(rooms.value<10){

      rooms.value++;

    }

  }

  void removeRoom(){
    if(rooms.value>1){
      rooms.value--;
    }
  }

  void addChild(){

    if(children.value<10){

      children.value++;

      childAges.add(1);

    }


  }

  void removeChild(){

    if(children.value>0){

      children.value--;

      childAges.removeLast();
    }
  }

  void updateAge(
      int index,
      int value,
      ){

    childAges[index]=value;

    childAges.refresh();
  }

  void clear(){

    adults.value=1;
    children.value=0;
    rooms.value=1;
    childAges.clear();
  }


  ///location
  final searchController = TextEditingController().obs;

  final locationList = <LocationModel>[].obs;

  final isLoading = false.obs;

  final selectedLocation = Rxn<LocationModel>();

  final service = LocationService.create();



  @override
  void onInit() {
    super.onInit();

    locationList.clear();

    searchController.value.clear();

    getLocations("");

    ///Date Data Format
    dateData();

  }


  void clearData() {

    searchController.value.clear();

    locationList.clear();

    selectedLocation.value = null;
  }

  void latLngClear() {

    latitude.value = 0.0;

    longitude.value = 0.0;

  }

  /// GET LOCATIONS
  Future<void> getLocations(
      String value,
      ) async {

    try {

      isLoading.value = true;

      final response = await service.getLocations({
        "search": value,
      });

      print(response.bodyString);

      if (response.isSuccessful) {

        final List data = jsonDecode(response.bodyString);

        locationList.value = data.map((e) => LocationModel.fromJson(e),).toList();

      }

    } catch (e) {

      debugPrint("LOCATION ERROR : $e");

    } finally {

      isLoading.value = false;

    }
  }



  /// SELECT LOCATION
  void selectLocation(
      LocationModel model,
      ) {

    selectedLocation.value = model;

    searchController.value.text =
        model.label ?? "";
  }


  final latitude = 0.0.obs;

  final longitude = 0.0.obs;

  //TODO : Get Lat Lng
  Future<void> updateLocationInBackground() async {

    try {

      Loading().onLoading();

      Position position = await determinePosition();

      latitude.value = position.latitude;

      longitude.value = position.longitude;

      await GetStorage().write(
        StorageKeys.lat,
        position.latitude,
      );

      await GetStorage().write(
        StorageKeys.lng,
        position.longitude,
      );

    } catch (e) {

      debugPrint(
        "Location Error : $e",
      );

      Loading().onDone();

    }finally{

      Loading().onDone();

    }

  }

}
