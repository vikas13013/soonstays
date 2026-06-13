import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonstays/app/data/model/property_details/property_details_model.dart';
import 'package:soonstays/app/data/model/search_criteria_model.dart';
import 'package:soonstays/core/constants/app_strings.dart';
import 'package:soonstays/core/widgets/common_loader.dart';

import '../../../../core/arguments/property_details_arguments.dart';
import '../../../../core/get_storage/session_manager.dart';
import '../../../data/model/property_details/available_rooms_model.dart';
import '../../../data/model/property_list/property_list_model.dart';
import '../../../data/repository/property_details_repository.dart';
import '../../../routes/app_pages.dart';

class PropertyDetailsController extends GetxController with GetSingleTickerProviderStateMixin{
  //TODO: Implement PropertyDetailsController

  @override
  void onInit() {
    super.onInit();

    tabController = TabController(
      length: tabList.length,
      vsync: this,
    );

    final PropertyDetailsArgument data = Get.arguments;

    searchCriteria.value = data.searchCriteria!;

    propertyListData.value = data.propertiesData!;

    getPropertyDetails();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {

    tabController.dispose();

    super.onClose();
  }


  final facilityList = <dynamic>[
    {
      'icon':Icon(Icons.groups_2_outlined,size: 18,),
      'name':AppStrings.coupleFriendly
    },
    {
      'icon':Icon(Icons.home_work_outlined,size: 18,),
      'name':AppStrings.topRated
    },
    {
      'icon':Icon(Icons.wifi,size: 18,),
      'name':AppStrings.freeWiFi
    },
    {
      'icon':Icon(Icons.tv_outlined,size: 18,),
      'name':AppStrings.acRooms
    },
    {
      'icon':Icon(Icons.local_parking_outlined,size: 18,),
      'name':AppStrings.parking
    }
  ];

  final tabBarList = [
    Tab(
      text: AppStrings.selectRoom,
    ),
    Tab(
      text: AppStrings.aboutHotel,
    ),
    Tab(
      text: AppStrings.location,
    ),
    Tab(
      text: AppStrings.amenities,
    ),
    Tab(
      text: AppStrings.policies,
    ),
  ];


  late TabController tabController;

  final selectedTab = 0.obs;

  final tabList = [
    (AppStrings.selectRoom),
    (AppStrings.aboutHotel),
    (AppStrings.location),
    (AppStrings.amenities),
    (AppStrings.policies)
  ];

  final repository = PropertyDetailsRepository();

  final allDetailsData = {}.obs;

  final pricePerNight = 0.0.obs;

  final propertyData = PropertyDetailsModel().obs;

  final availableRoomsList = <AvailableRoomsList>[].obs;

  final searchCriteria = SearchCriteriaModel().obs;

  final propertyListData = PropertiesList().obs;

  final isLoading = true.obs;

  Future<void> getPropertyDetails() async {

    try {

      Loading().onLoading();

      final payload = {

        "slug": propertyListData.value.slug.toString(),

        "searchCriteria": searchCriteria.value.toJson(),

        "preferences": {

          "sorting": {
            "field": "Ranking",
            "order": "Desc"
          },

          "pagination": {
            "page": 1,
            "size": 45
          }
        },

        "requestHeader": {

          "requestId": DateTime.now().millisecondsSinceEpoch.toString(),

          "timestamp": DateTime.now().toUtc().toIso8601String(),

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

      log("payload : ${jsonEncode(payload)}");

      final response = await repository.getPropertyDetails(
        payload,
      );

      if (response.isSuccessful) {

        final body = response.body;

        allDetailsData.value = body;

        propertyData.value = PropertyDetailsModel.fromJson(body['property']);

        availableRoomsList.value = (body['available_rooms'] as List).map((e) => AvailableRoomsList.fromJson(e)).toList().obs;

        searchCriteria.value = body['searchCriteria'];

        // print("bodybody :${body}");

      } else {

        print(
          response.error,
        );
      }

    } catch (e) {

      print(e);
    }finally {

      isLoading.value = false;

      Loading().onDone();

    }
  }


  checkoutNavigate({
    required String roomId,
    required String ratePlanId
  }){

    var data = {

      "roomId": roomId,

      "ratePlanId": ratePlanId,

      "property": allDetailsData['property'],

      "searchCriteria": allDetailsData['searchCriteria'],

      "available_rooms": allDetailsData['available_rooms']

    };

    Get.toNamed(
        Routes.BOOKING_SCREEN,
        arguments: data
    );

  }


}
