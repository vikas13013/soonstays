import 'package:get/get.dart';

import '../model/profile/profile_data_modal.dart';
import '../services/profile/profile_service.dart';

class ProfileRepository {

  final ProfileService _service = Get.find();

  Future<UserProfileModel?> getProfile() async {
    try {
      final response = await _service.getProfile();

      if (response.isSuccessful) {
        return UserProfileModel.fromJson(response.body);
      }

      return null;
    } catch (e) {
      rethrow;
    }
  }
}