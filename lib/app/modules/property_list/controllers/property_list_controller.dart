import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/screens/property_filter_screen.dart';
import '../../../../core/arguments/property_details_arguments.dart';
import '../../../../core/get_storage/session_manager.dart';
import '../../../../core/utils/app_date_format.dart';
import '../../../data/model/property_list/property_list_model.dart';
import '../../../data/model/search_criteria_model.dart';
import '../../../data/repository/property_repository.dart';
import '../../search/view/search_view.dart';

class PropertyListController extends GetxController {
  //TODO: Implement PropertyListController

  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    final PropertyDetailsArgument data = Get.arguments;

    log("${data.searchCriteria!.toJson()}  ${data.cityName.toString()}");

    getPropertyData(
      data: data.searchCriteria,
      cityName: data.cityName
    );

  }


  ///arguments: {
  //    "city": "",
  //    "type": "",
  //    "cityId": "",
  //    "checkIn": "",
  //    "checkOut": "",
  //    "lengthOfStay": 1,
  //    "totalRooms": 1,
  //    "totalAdults": 1,
  //    "totalChildren": 1,
  //     "childAges": []
  // }

  getPropertyData({SearchCriteriaModel?data,String?cityName}){

    getArgumentsData(data: data!,cityName: cityName!);

    getProperties();

    scrollController.addListener(() {

      if(scrollController.position.pixels >= scrollController.position.maxScrollExtent-100){

        getProperties(
          loadMore: true,
        );
      }

    });

    update();

  }

  getArgumentsData({required SearchCriteriaModel data,required String cityName}){

    if(Get.arguments!=null){

      argumentData.value = data;

    }


    print("argumentData.value : ${argumentData.value}");

    cityNameController.value = cityName.toString();

    displayCheckInDate.value = AppDateFormatter.displayDate(
      DateTime.parse(argumentData.value.checkIn.toString()),
    );

    displayCheckOutDate.value = AppDateFormatter.displayDate(
        DateTime.parse(argumentData.value.checkOut.toString()),
    );


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

  final filterData = {}.obs;

  // Date
  Rx<String> cityNameController = "".obs;
  Rx<String> displayCheckInDate = "".obs;
  Rx<String> displayCheckOutDate = "".obs;

  Future<void> getProperties({
    bool loadMore = false,
    bool refresh = false,
  }) async {

    try {

      /// Prevent multiple API calls
      if (isLoading.value ||
          isPaginationLoading.value) {
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

          "filters": filterData
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

        searchCriteria.value = dataModel.searchCriteria!;

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

  Future<void> refreshProperties() async {

    await getProperties(
      refresh: true,
    );
  }

  Future searchDialog() async{

    final result = await Get.dialog(
      Dialog(
        child: SearchView(
          type: 0,
        ),
      ),
    );

    if(result != null){

      final PropertyDetailsArgument data = result;

      getPropertyData(
          data: data.searchCriteria,
          cityName: data.cityName
      );

    }

  }


  @override
  void onClose() {

    scrollController.dispose();

    super.onClose();
  }

  filterView(BuildContext context){

  return PropertyFilter.show(
    context: context,
    onApply: (filter) {

      filterData.value = filter.toJson();

      getPropertyData(
          cityName: cityNameController.value,
          data: argumentData.value
      );

      log("filter : ${filter.toJson()}");

      },
    );

  }

}
