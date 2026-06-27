import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PropertiesImagesController extends GetxController with GetSingleTickerProviderStateMixin  {
  //TODO: Implement PropertiesImagesController

  late TabController tabController;

  final properties = {}.obs;

  final tabs = [].obs;

  final selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();

    properties.value = Get.arguments;

    tabs.value = properties.keys.toList();

    tabController = TabController(
      length: tabs.length,
      vsync: this,
    );

    tabController.addListener(() {
      if (!tabController.indexIsChanging) {
        selectedIndex.value = tabController.index;
      }
    });
  }



  List<dynamic> getImages(String key) {
    return properties[key] ?? [];
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

}
