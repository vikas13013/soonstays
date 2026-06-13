import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:soonstays/core/constants/app_colors.dart';
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

    if (isPickerOpening.value) return;

    isPickerOpening.value = true;

    try {

      final picked = await showDateRangePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime(2030),
        builder: (context, child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: AppColors.primary3,
              cardColor: AppColors.white,
              buttonTheme: const ButtonThemeData(
                  textTheme: ButtonTextTheme.primary
              ),
              colorScheme: const ColorScheme.light(
                background: AppColors.white,
                /// selected start/end date
                primary: AppColors.primary3,
                /// range fill color
                secondary: Color(
                  0xffDAD3FF,
                ),
                /// text color
                onPrimary: Colors.white,
              ),
            ),
            child: child!,
          );
        },
        initialDateRange: DateTimeRange(
          start: checkInDate.value,
          end: checkOutDate.value,
        ),
      );

      if (picked != null) {

        checkInDate.value = picked.start;

        checkOutDate.value = picked.end;

        dateData();

      }

    } finally {

      isPickerOpening.value = false;
    }
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
