// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'booking_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$BookingService extends BookingService {
  _$BookingService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = BookingService;

  @override
  Future<Response<dynamic>> getMyBookings({
    required int page,
    required int limit,
    String? status,
  }) {
    final Uri $url = Uri.parse('/api/v1/bookings/my-bookings');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'limit': limit,
      'status': status,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> createBooking(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('/api/v1/bookings');
    final $body = body;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }
}
