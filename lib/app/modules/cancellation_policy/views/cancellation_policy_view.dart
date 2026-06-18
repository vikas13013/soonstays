import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:get/get.dart';
import 'package:soonstays/core/constants/app_strings.dart';
import 'package:soonstays/core/widgets/common_appbar.dart';

import '../controllers/cancellation_policy_controller.dart';

class CancellationPolicyView extends GetView<CancellationPolicyController> {
  const CancellationPolicyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
          title: "${AppStrings.cancellationPolicy}",
          isActionTrue: true
      ),
      body: Obx(
            () {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                Html(
                  data: controller.htmlData.value,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
