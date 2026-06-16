import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController

  RxInt selectedIndex = 0.obs;

  RxBool showBottomBar = true.obs;

  final ScrollController homeScrollController = ScrollController();

  final ScrollController tripsScrollController = ScrollController();

  final ScrollController moreScrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();

    homeScrollController.addListener(_scrollListener);

    tripsScrollController.addListener(_scrollListener);

    moreScrollController.addListener(_scrollListener);

  }

  void _scrollListener() {
    ScrollDirection direction = ScrollDirection.idle;

    if (selectedIndex.value == 0) {
      direction = homeScrollController.position.userScrollDirection;
    } else if (selectedIndex.value == 1) {
      direction = tripsScrollController.position.userScrollDirection;
    } else if (selectedIndex.value == 2) {
      direction = moreScrollController.position.userScrollDirection;
    }

    if (direction == ScrollDirection.reverse) {
      showBottomBar.value = false;
    }

    if (direction == ScrollDirection.forward) {
      showBottomBar.value = true;
    }
  }

  void changeTab(int index) {
    selectedIndex.value = index;
  }

  @override
  void onClose() {
    homeScrollController.dispose();
    super.onClose();
  }


}
