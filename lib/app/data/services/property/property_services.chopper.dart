// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'property_services.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$PropertyServices extends PropertyServices {
  _$PropertyServices([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = PropertyServices;

  @override
  Future<Response<dynamic>> searchHotel(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('/api/v1/property/consumer/search/detail');
    final $body = body;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }
}
