// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'property_image_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$PropertyImageService extends PropertyImageService {
  _$PropertyImageService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = PropertyImageService;

  @override
  Future<Response<dynamic>> getPropertyImages(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('/api/v1/media-assets/property-images-by-tags');
    final $body = body;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }
}
