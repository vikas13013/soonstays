import 'package:share_plus/share_plus.dart';

class CommonShare {
  CommonShare._();

  /// Share Text
  static Future<void> text({
    required String text,
    String? subject,
  }) async {
    await SharePlus.instance.share(
      ShareParams(
        text: text,
        subject: subject,
      ),
    );
  }

  /// Share Link
  static Future<void> link({
    required String title,
    required String url,
  }) async {
    await SharePlus.instance.share(
      ShareParams(
        text: "$title\n\n$url",
        subject: title,
      ),
    );
  }

  /// Share Property
  static Future<void> property({
    required String propertyName,
    required String location,
    required String link,
  }) async {
    await SharePlus.instance.share(
      ShareParams(
        subject: propertyName,
        text: '''
🏨 $propertyName

📍 $location

🔗 $link
''',
      ),
    );
  }

  /// Share Image
  static Future<void> image(String path) async {
    await SharePlus.instance.share(
      ShareParams(
        files: [XFile(path)],
      ),
    );
  }

  /// Share Multiple Images
  static Future<void> images(List<String> paths) async {
    await SharePlus.instance.share(
      ShareParams(
        files: paths.map((e) => XFile(e)).toList(),
      ),
    );
  }
}