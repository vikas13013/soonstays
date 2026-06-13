import 'package:url_launcher/url_launcher.dart';

class CommonLauncher {

  /// ================= OPEN URL =================
  static Future<void> openUrl(String url) async {

    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {

      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );

    } else {

      throw "Could not launch $url";
    }
  }

  /// ================= CALL =================
  static Future<void> makeCall(String phone) async {

    final Uri uri = Uri(
      scheme: 'tel',
      path: phone,
    );

    if (await canLaunchUrl(uri)) {

      await launchUrl(uri);

    } else {

      throw "Could not call $phone";
    }
  }

  /// ================= EMAIL =================
  static Future<void> sendEmail({
    required String email,

    String subject = "",
    String body = "",

  }) async {

    final Uri uri = Uri(
      scheme: 'mailto',

      path: email,

      query: 'subject=$subject&body=$body',
    );

    if (await canLaunchUrl(uri)) {

      await launchUrl(uri);

    } else {

      throw "Could not send email";
    }
  }

  /// ================= WHATSAPP =================
  static Future<void> openWhatsApp({
    required String phone,

    String message = "",

  }) async {

    final url = "https://wa.me/$phone?text=${Uri.encodeComponent(message)}";

    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {

      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );

    } else {

      throw "WhatsApp not installed";
    }
  }

  /// ================= OPEN MAP =================
  static Future<void> openMap({
    required double latitude,
    required double longitude,
  }) async {

    final Uri uri = Uri.parse(
      "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude",
    );

    if (await canLaunchUrl(uri)) {

      await launchUrl(
        uri,

        mode: LaunchMode.externalApplication,
      );

    } else {

      throw "Could not open map";
    }
  }
}