import 'package:get/get.dart';
import '../../../data/api_client/policies_client.dart';
import '../../../data/services/policies/policies_service.dart';

class CancellationPolicyController extends GetxController {
  //TODO: Implement CancellationPolicyController

  @override
  void onInit() {
    super.onInit();

    getCancellationPolicy();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  RxBool isLoading = false.obs;

  RxString htmlData = "".obs;

  CmsService cmsService = policiesClient.getService<CmsService>();

  Future<void> getCancellationPolicy() async {
    try {
      isLoading.value = true;

      final response = await cmsService.getCancellationPolicy();

      if (response.isSuccessful) {

        htmlData.value = response.body ?? "";

      }
    } finally {

      isLoading.value = false;

    }
  }


}
