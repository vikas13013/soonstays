enum BookingStatus {
  confirmed,
  pending,
  cancelled,
  completed,
}

extension BookingStatusExtension on BookingStatus {

  String get value {
    switch (this) {
      case BookingStatus.confirmed:
        return "CONFIRMED";

      case BookingStatus.pending:
        return "PENDING";

      case BookingStatus.cancelled:
        return "CANCELLED";

      case BookingStatus.completed:
        return "COMPLETED";
    }
  }

  String get title {
    switch (this) {
      case BookingStatus.confirmed:
        return "Confirmed";

      case BookingStatus.pending:
        return "Pending";

      case BookingStatus.cancelled:
        return "Cancelled";

      case BookingStatus.completed:
        return "Completed";
    }
  }
}