import 'package:intl/intl.dart';

class AppDateFormatter {

  /// UI format
  /// 04 Jun 2026
  static String displayDate(
      DateTime? date) {

    if(date == null) return "";

    return DateFormat(
      "dd MMM yyyy",
    ).format(date);
  }

  /// API / Share format
  /// 2026-06-04
  static String apiDate(
      DateTime? date,
      ) {

    if(date == null) return "";

    return DateFormat(
      "yyyy-MM-dd",
    ).format(date);
  }

  /// Returns total days difference
  static int getDaysDifference({
    required String startDate,
    required String endDate,
  }) {

    DateTime start = DateTime.parse(startDate);
    DateTime end = DateTime.parse(endDate);

    return end.difference(start).inDays;
  }

  String formatDate(String? date) {
    if (date == null || date.isEmpty) return "";

    try {
      return DateFormat('dd MMM yyyy')
          .format(DateTime.parse(date));
    } catch (e) {
      return "";
    }
  }


  String formatDateDisplay(String? date) {
    if (date == null || date.isEmpty) return "";

    return DateFormat('dd MMM yyyy')
        .format(DateTime.parse(date).toLocal());
  }


}

class BookingDateHelper {

  static String getWeekDay(String date) {
    return DateFormat('EEE')
        .format(DateTime.parse(date))
        .toUpperCase();
  }

  static String getDay(String date) {
    return DateFormat('dd')
        .format(DateTime.parse(date));
  }

  static String getMonthYear(String date) {
    return DateFormat('MMM yyyy')
        .format(DateTime.parse(date));
  }
}