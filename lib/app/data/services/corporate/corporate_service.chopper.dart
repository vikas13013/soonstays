// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'corporate_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$CorporateService extends CorporateService {
  _$CorporateService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = CorporateService;

  @override
  Future<Response<dynamic>> submitCorporate(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('/api/v1/corporate');
    final $body = body;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }
}
