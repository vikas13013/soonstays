import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soonstays/core/constants/app_assets.dart';
import 'package:soonstays/core/constants/app_size.dart';
import 'package:soonstays/core/constants/app_strings.dart';
import 'package:soonstays/core/constants/app_text_styles.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/common_appbar.dart';
import '../controllers/legal_policy_controller.dart';

class LegalPolicyView extends GetView<LegalPolicyController> {
  const LegalPolicyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F8FC),
      appBar: CommonAppBar(
          title: AppStrings.legalAndPolicy,
          isActionTrue: true
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              const _HeaderSection(),

              16.height,

              const _InfoCard(),

              16.height,

              const _PrivacyCard(),

              16.height,

              _OnThisPageCard(),

              16.height,

              const _BottomInfoCard(),

              20.height,

            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [

            AppColors.primary,

            AppColors.blue,

            AppColors.primary3,

          ],
        ),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
        children: [

          Expanded(
            child: Text(
              "${AppStrings.adhHospitalityPvtLtd} - ${AppStrings.soonStays.toUpperCase()}",
              style: AppTextStyle.white18Bold,
            ),
          ),

          Image.asset(
            AppAssets.legalPolicy,
            height: 80,
          ),

        ],
      ),
    );
  }
}

Widget commonCard({
  required Widget child,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16),
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.05),
          blurRadius: 15,
          offset: const Offset(0, 6),
        ),
      ],
    ),

    child: child,
  );
}


class _InfoCard extends StatelessWidget {
  const _InfoCard();

  @override
  Widget build(BuildContext context) {
    return commonCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          _iconCircle(Icons.info),

          const SizedBox(width: 15),

          const Expanded(
            child: Text(
              AppStrings.thisDocumentIsAnElectronicRecord,
              style: AppTextStyle.black13Regular,
            ),
          ),
        ],
      ),
    );
  }
}

class _PrivacyCard extends StatelessWidget {
  const _PrivacyCard();

  @override
  Widget build(BuildContext context) {
    return commonCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          _iconCircle(Icons.shield_outlined),

          const SizedBox(width: 15),

          const Expanded(
            child: Text(
              AppStrings.thisPrivacyPolicyEplains,
              style: AppTextStyle.black13Regular,
            ),
          ),
        ],
      ),
    );
  }
}


class _OnThisPageCard extends StatelessWidget {
  _OnThisPageCard();

  final List<String> items = [
    (AppStrings.informationWeCollect),
    (AppStrings.howWeUseYourInformation),
    (AppStrings.informationSharingAndDisclosure),
    (AppStrings.dataSecurity),
    (AppStrings.yourRightsAndChoices),
    (AppStrings.cookiesAndTrackingTechnologies),
    (AppStrings.changesToThisPolicy),
    (AppStrings.contactUs),
  ];

  @override
  Widget build(BuildContext context) {
    return commonCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            "${AppStrings.onThisPage}",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 15),

          ...List.generate(
            items.length,
                (index) => ListTile(
              contentPadding: EdgeInsets.zero,

              leading: _iconCircle(Icons.description),

              title: Text(
                "${index + 1}. ${items[index]}",
              ),

              trailing: const Icon(
                Icons.chevron_right,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class _BottomInfoCard extends StatelessWidget {
  const _BottomInfoCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.lightBg,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Row(
        children: [

          const Icon(
            Icons.lock,
            color: AppColors.blue,
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Text(
              "${AppStrings.yourPrivacyIsImportantToUs}",
              style: AppTextStyle.black13Regular,
            ),
          ),
        ],
      ),
    );
  }
}


Widget _iconCircle(IconData icon) {
  return Container(
    height: 50,
    width: 50,
    decoration: BoxDecoration(
      color: AppColors.lightBg,
      borderRadius: BorderRadius.circular(14),
    ),
    child: Icon(
      icon,
      color: AppColors.blue,
    ),
  );
}