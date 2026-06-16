import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:soonstays/core/constants/app_assets.dart';
import 'package:soonstays/core/get_storage/session_manager.dart';

import '../../../../core/arguments/property_details_arguments.dart';
import '../../../../core/get_storage/storage_keys.dart';
import '../../../../core/utils/app_date_format.dart';
import '../../../../core/utils/geo_locator.dart';
import '../../../data/model/property_list/property_list_model.dart';
import '../../../data/model/search_criteria_model.dart';
import '../../../data/repository/property_repository.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  @override
  void onInit() {
    super.onInit();

    loadHome();

  }



  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  final latitude = 0.0.obs;

  final longitude = 0.0.obs;

  Future<void> loadHome() async {

    final storage = GetStorage();

    latitude.value = storage.read(StorageKeys.lat) ?? 0.0;

    longitude.value = storage.read(StorageKeys.lng) ?? 0.0;

    await prepareSearchCriteria();

    /// Background me latest location update
    updateLocationInBackground();

  }

  //TODO : Get Lat Lng
  Future<void> updateLocationInBackground() async {

    try {

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

      /// Location change hone ke baad
      argumentData.value.latitude = position.latitude;

      argumentData.value.longitude = position.longitude;

      await getProperties();

    } catch (e) {

      debugPrint(
        "Location Error : $e",
      );
    }
  }

  final PageController pageController = PageController(viewportFraction: .88);

  final currentIndex = 0.obs;

  Rx<DateTime> checkInDate = DateTime.now().obs;

  Rx<DateTime> checkOutDate = DateTime.now().add(const Duration(days: 1)).obs;

  // Date
  Rx<String> cityNameController = "".obs;
  Rx<String> displayCheckInDate = "".obs;
  Rx<String> displayCheckOutDate = "".obs;
  RxInt lengthOfStay = 1.obs;

  Future<void> prepareSearchCriteria() async {

    displayCheckInDate.value = AppDateFormatter.apiDate(
          checkInDate.value,
        );

    displayCheckOutDate.value = AppDateFormatter.apiDate(
          checkOutDate.value,
        );

    lengthOfStay.value = AppDateFormatter.getDaysDifference(
          startDate: displayCheckInDate.value,
          endDate: displayCheckOutDate.value,
        );

    argumentData.value = SearchCriteriaModel(
          latitude: latitude.value,
          longitude: longitude.value,
          radiusKm: 100,
          destinationType: "",
          destinationId: "",
          checkIn: displayCheckInDate.value,
          checkOut: displayCheckOutDate.value,
          totalRooms: 1,
          totalChildren: 0,
          totalAdults: 1,
          lengthOfStay: lengthOfStay.value,
          childAges: [],
        );

    await getProperties();

  }

  final repository = PropertyRepository();

  final propertyList = <PropertiesList>[].obs;

  final propertyData = PropertyListModel().obs;

  final searchCriteria = SearchCriteria().obs;

  var isLoading = false.obs;
  var isPaginationLoading = false.obs;

  int page = 1;
  int size = 10;

  bool hasMoreData = true;

  final argumentData = SearchCriteriaModel().obs;


  Future<void> getProperties({
    bool loadMore = false,
    bool refresh = false,
  }) async {

    try {

      /// Prevent multiple API calls
      if (isLoading.value || isPaginationLoading.value) {
        return;
      }

      if (loadMore) {

        if (!hasMoreData) return;

        isPaginationLoading.value = true;

      } else {

        page = 1;
        hasMoreData = true;

        /// First Loading Only
        if (!refresh &&
            propertyList.isEmpty) {

          isLoading.value = true;
        }
      }

      final payload = {

        "searchCriteria": argumentData.value.toJson(),

        "preferences": {

          "sorting": {
            "field": "Ranking",
            "order": "Desc"
          },

          "pagination": {
            "page": page,
            "size": size
          },

          "filters": {"isDiscover":true}
        },

        "requestHeader": {

          "requestId": DateTime.now().millisecondsSinceEpoch.toString(),

          "timestamp": DateTime.now().toIso8601String(),

          "source": {
            "platform": "Mobile",
            "deviceType": "Android",
            "ipAddress": "0.0.0.0",
            "locale": "en-gb",
            "currency": "INR"
          }
        },

        "userContext": {
          "isUserLoggedIn": SessionManager.instance.isLoggedIn,
          "travellerType": "Standard"
        }

      };

      final response = await repository.getProperty(
        payload,
      );

      if (response.isSuccessful) {

        List data = response.body["properties"] ?? [];

        PropertyListModel dataModel = PropertyListModel.fromJson(response.body);

        propertyData.value = dataModel;

        if (loadMore) {

          propertyList.addAll(dataModel.properties!);

        } else {

          propertyList.assignAll(dataModel.properties!);
        }

        /// next page
        if (data.isNotEmpty) {
          page++;
        }

        /// check last page
        hasMoreData = data.length == size;

      } else {

        log(
          "API Error : ${response.error}",
        );
      }

    } catch (e) {

      log(
        "Error : $e",
      );

    } finally {

      isLoading.value = false;

      isPaginationLoading.value = false;
    }
  }


 final popularCityList = [
   {
     "id":"132166",
     "label":"Indore",
     "type":"city",
     "img":AppAssets.indoreImg
   },
   {
     "id": "131679",
     "label": "Delhi",
     "type": "city",
     "img":AppAssets.delhiImg
   },
   {
     "id": "133024",
     "label": "Mumbai",
     "type": "city",
     "img":AppAssets.mumbaiImg
   },
   {
     "id":"132201",
     "label":"Jaipur",
     "type":"city",
     "img":AppAssets.jaipurImg
   },
   {
     "id": "57933",
     "label": "Bengaluru",
     "type": "city",
     "img":AppAssets.bengluruImg
   },
   {
     "id":"142001",
     "label":"Kolkata",
     "type":"city",
     "img":AppAssets.kolkataImg
   },
  ].obs;

 void popularCityOnTap({popularCity}) {

    final PropertyDetailsArgument data = PropertyDetailsArgument(
      cityName: '${popularCity['label']}',
      searchCriteria: SearchCriteriaModel(
        destinationType: "${popularCity['type']}",
        destinationId: "${popularCity['id']}",
        checkIn: displayCheckInDate.value,
        checkOut: displayCheckOutDate.value,
        totalAdults: 1,
        totalRooms: 1,
        totalChildren: 0,
        childAges: [],
        lengthOfStay: lengthOfStay.value,
      ),
    );

    Get.toNamed(
      Routes.PROPERTY_LIST,
      arguments: data,
    );

  }


}
