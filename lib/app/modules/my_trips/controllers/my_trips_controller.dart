import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonstays/app/data/model/bookings/bookings_model.dart';
import 'package:soonstays/app/data/services/booking/booking_service.dart';
import '../../../data/api_client/api_client.dart';

class BookingTabData {

  int page = 1;

  bool hasMore = true;

  RxBool isLoading = true.obs;

  RxBool isLoadMore = false.obs;

  RxList<BookingList> list = <BookingList>[].obs;

}

class MyTripsController extends GetxController with GetSingleTickerProviderStateMixin{
  //TODO: Implement MyTripsController

  late TabController tabController;

  final BookingTabData upcoming = BookingTabData();

  final BookingTabData cancelled = BookingTabData();

  final BookingTabData completed = BookingTabData();

  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();

    tabController = TabController(
      length: 3,
      vsync: this,
    );

    /// Initial Load
    getBookings(
      status: "CONFIRMED,PENDING",
      bookingData: upcoming,
    );

    /// Tab Change
    tabController.addListener(() {

      if (!tabController.indexIsChanging) {

        switch (tabController.index) {

          case 0:

            if (upcoming.list.isEmpty) {

              getBookings(
                status: "CONFIRMED,PENDING",
                bookingData: upcoming,
              );
            }

            break;

          case 1:

            if (cancelled.list.isEmpty) {

              getBookings(
                status: "CANCELLED",
                bookingData: cancelled,
              );
            }

            break;

          case 2:

            if (completed.list.isEmpty) {

              getBookings(
                status: "COMPLETED",
                bookingData: completed,
              );
            }

            break;
        }
      }
    });

    scrollController.addListener(
      _paginationListener,
    );
  }

  void _paginationListener() {

    if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 200) {

      switch (tabController.index) {

        case 0:

          if (!upcoming.isLoadMore.value && upcoming.hasMore) {

            getBookings(
              status:
              "CONFIRMED,PENDING",
              bookingData: upcoming,
              loadMore: true,
            );
          }

          break;

        case 1:

          if (!cancelled.isLoadMore.value && cancelled.hasMore) {

            getBookings(
              status: "CANCELLED",
              bookingData: cancelled,
              loadMore: true,
            );
          }

          break;

        case 2:

          if (!completed.isLoadMore.value && completed.hasMore) {

            getBookings(
              status: "COMPLETED",
              bookingData: completed,
              loadMore: true,
            );
          }

          break;
      }
    }
  }

  BookingService bookingService = chopperClient.getService<BookingService>();

  Future<void> getBookings({
    required String status,
    required BookingTabData bookingData,
    bool loadMore = false,
  }) async {

    try {

      print("Status : ${status}");

      if (loadMore) {

        bookingData.isLoadMore.value = true;

      } else {

        bookingData.isLoading.value = true;

        await Future.delayed(
          const Duration(milliseconds: 50),
        );

        bookingData.page = 1;

        bookingData.list.clear();
      }

      final response = await bookingService.getMyBookings(
        page: bookingData.page,
        limit: 10,
        status: status,
      );

      if (response.isSuccessful) {

        final result =
        BookingsModel.fromJson(
          response.body,
        );

        bookingData.list.addAll(
          result.data ?? [],
        );

        bookingData.hasMore = bookingData.list.length < (result.total ?? 0);

        if (bookingData.hasMore) {
          bookingData.page++;
        }
      }
    } finally {

      bookingData.isLoading.value =
      false;

      bookingData.isLoadMore.value =
      false;
    }
  }
}

enum BookingTab {
  upcoming,
  cancelled,
  completed,
}