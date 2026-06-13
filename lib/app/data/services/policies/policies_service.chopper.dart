// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'policies_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$CmsService extends CmsService {
  _$CmsService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = CmsService;

  @override
  Future<Response<String>> getCancellationPolicy() {
    final Uri $url = Uri.parse('/cancellation-policy/');
    final Request $request = Request('GET', $url, client.baseUrl);
    return client.send<String, String>($request);
  }

  @override
  Future<Response<String>> getPrivacyPolicy() {
    final Uri $url = Uri.parse('/privacy-policy/');
    final Request $request = Request('GET', $url, client.baseUrl);
    return client.send<String, String>($request);
  }

  @override
  Future<Response<String>> getTermsConditions() {
    final Uri $url = Uri.parse('/terms-conditions/');
    final Request $request = Request('GET', $url, client.baseUrl);
    return client.send<String, String>($request);
  }

  @override
  Future<Response<String>> getLegalPrivacy() {
    final Uri $url = Uri.parse('/legal&privacy/');
    final Request $request = Request('GET', $url, client.baseUrl);
    return client.send<String, String>($request);
  }
}
